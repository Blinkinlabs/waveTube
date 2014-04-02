
import java.nio.*;
import javax.media.opengl.*;
import com.jogamp.common.nio.*;


class Edge {
  // Mapping into the strip image array
  int m_x;      // screen location
  int m_y;
  int m_strip;  // strip location
  int m_offset;
  int m_length;
  boolean m_flipped;

  // For LED Tree edges
  // @param strip Strip number (0-7, one for each bb8 output)
  // @param offset 
  // @param flipped
  Edge(int x, int y, int strip, int offset, boolean flipped) {
    m_x = x;
    m_y = y;
    m_strip = strip;
    m_offset = offset;
    m_flipped = flipped;
    m_length = 60;  // For simplicity
  }

  
  void copyOver(PImage input, PImage output) {
    for(int dY = 0; dY < m_length; dY++) {
      if (m_flipped == false) {
        output.pixels[(m_offset+dY)*displayWidth + m_strip] = input.pixels[(m_y+dY)*displayWidth + m_x];
      }
      else {
         output.pixels[(m_offset+dY)*displayWidth + m_strip] = input.pixels[(70 - (m_y+dY))*displayWidth + m_x];
      }
    }
  }
}

