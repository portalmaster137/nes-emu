CXX = g++
CXXFLAGS = -std=c++17 `sdl2-config --cflags`
LDFLAGS = `sdl2-config --libs`

OBJ_DIR = ./obj
INCLUDE_DIR = ./include
SRC_DIR = ./src
PCH_DIR = ./pch
OUTPUT = main

HEADERS = $(wildcard $(INCLUDE_DIR)/*.h)
SOURCES = $(wildcard $(SRC_DIR)/*.cpp)
PCHS = $(patsubst $(INCLUDE_DIR)/%.h,$(PCH_DIR)/%.h.gch,$(HEADERS))
OBJECTS = $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SOURCES))

all: $(PCHS) $(OUTPUT)

$(PCH_DIR)/%.h.gch: $(INCLUDE_DIR)/%.h
	@mkdir -p $(PCH_DIR)
	$(CXX) $(CXXFLAGS) -I$(INCLUDE_DIR) -x c++-header $< -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -I$(INCLUDE_DIR) -c $< -o $@

$(OUTPUT): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $@ $(LDFLAGS)

clean:
	rm -rf $(PCH_DIR) $(OBJ_DIR) $(OUTPUT)

.PHONY: all clean