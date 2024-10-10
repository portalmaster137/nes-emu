CXX = g++
TARGET = nesemu
BUILDDIR = build

CXXFLAGS = -std=c++17 -O3

CXXFLAGS += $(shell sdl2-config --cflags)

LDFLAGS = $(shell sdl2-config --libs)

# .h files in  inc/
# .cpp files in src/

SRCS = $(wildcard src/*.cpp)
OBJS = $(SRCS:src/%.cpp=$(BUILDDIR)/%.o)

all: $(TARGET)
build:
	mkdir -p $(BUILDDIR)

$(TARGET): build $(OBJS) 
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

$(BUILDDIR)/%.o: src/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<


clean:
	rm -f $(OBJS) $(TARGET)

