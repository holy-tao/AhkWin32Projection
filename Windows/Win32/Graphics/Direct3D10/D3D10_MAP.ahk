#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies a resource to be accessed for reading and writing by the CPU. Applications may combine one or more of these flags.
 * @remarks
 * 
  * This enumeration is used in <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10buffer-map">ID3D10Buffer::Map</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10texture1d-map">ID3D10Texture1D::Map</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10texture2d-map">ID3D10Texture2D::Map</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10texture3d-map">ID3D10Texture3D::Map</a>.
  * 
  * These remarks are divided into the following topics:
  * 
  * 
  * <ul>
  * <li><a href="https://docs.microsoft.com/">Meaning of D3D10_MAP_WRITE_NO_OVERWRITE</a></li>
  * <li><a href="https://docs.microsoft.com/">Common Usage of D3D10_MAP_WRITE_DISCARD with D3D10_MAP_WRITE_NO_OVERWRITE</a></li>
  * </ul>
  * 
  * 
  * <h3><a id="NO_OVERWRITE_DETAILS"></a><a id="no_overwrite_details"></a>Meaning of D3D10_MAP_WRITE_NO_OVERWRITE</h3>
  * D3D10_MAP_WRITE_NO_OVERWRITE signifies that the application promises not to write to data that the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-input-assembler-stage">Input Assembler</a> (IA) stage is using. In exchange, the GPU allows the application to write to other parts of the same buffer.  The application must ensure that it does not write over any data in use by the IA stage.
  * 
  * For example, consider the buffer illustrated in the following diagram. If a Draw call has been issued that uses vertices 4-6, an application that calls Map on this buffer must ensure that it does not write to the vertices that the Draw call will access during rendering.
  * 
  * <img alt="Diagram of vertex data in different stages of utilization" src="./images/d3d10_map_nooverwrite.png"/>
  * However, ensuring this can be difficult, because the GPU is often many frames behind the CPU in terms of which frame it is currently processing. Keeping track of which sections of a resource are being used because of calls made 2 to 5 frames ago is difficult and error-prone. Because of this, it is recommended that applications only write to the uninitialized portions of a resource when using D3D10_MAP_WRITE_NO_OVERWRITE.
  * 
  * <h3><a id="DISCARD_NO_OVERWRITE_USES"></a><a id="discard_no_overwrite_uses"></a>Common Usage of D3D10_MAP_WRITE_DISCARD with D3D10_MAP_WRITE_NO_OVERWRITE</h3>
  * D3D10_MAP_WRITE_DISCARD and D3D10_MAP_WRITE_NO_OVERWRITE are normally used in conjunction with dynamic index/vertex buffers, although they can also be used with dynamic textures.
  * 
  * A common use of these two flags involves filling dynamic index/vertex buffers with geometry that can be seen from the camera's current position. The first time that data is entered into the buffer on a given frame, Map is called with D3D10_MAP_WRITE_DISCARD; doing so invalidates the previous contents of the buffer. The buffer is then filled with all available data.
  * 
  * Subsequent writes to the buffer within the same frame should use D3D10_MAP_WRITE_NO_OVERWRITE. This will enable the CPU to access a resource that is potentially being used by the GPU as long as the restrictions described previously are respected.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/ne-d3d10-d3d10_map
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_MAP{

    /**
     * Resource is mapped for reading. The resource must have been created with read access (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_cpu_access_flag">D3D10_CPU_ACCESS_READ</a>).
     * @type {Integer (Int32)}
     */
    static D3D10_MAP_READ => 1

    /**
     * Resource is mapped for writing. The resource must have been created with write access (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_cpu_access_flag">D3D10_CPU_ACCESS_WRITE</a>).
     * @type {Integer (Int32)}
     */
    static D3D10_MAP_WRITE => 2

    /**
     * Resource is mapped for reading and writing. The resource must have been created with read and write access (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_cpu_access_flag">D3D10_CPU_ACCESS_READ and D3D10_CPU_ACCESS_WRITE</a>).
     * @type {Integer (Int32)}
     */
    static D3D10_MAP_READ_WRITE => 3

    /**
     * Resource is mapped for writing; the previous contents of the resource will be undefined. The resource must have been created with write access (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_cpu_access_flag">D3D10_CPU_ACCESS_WRITE</a>).
     * @type {Integer (Int32)}
     */
    static D3D10_MAP_WRITE_DISCARD => 4

    /**
     * Resource is mapped for writing; the existing contents of the resource cannot be overwritten (see Remarks). This flag is only valid on vertex and index buffers. The resource must have been created with write access (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_cpu_access_flag">D3D10_CPU_ACCESS_WRITE</a>). Cannot be used on a resource created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_bind_flag">D3D10_BIND_CONSTANT_BUFFER</a> flag.
     * @type {Integer (Int32)}
     */
    static D3D10_MAP_WRITE_NO_OVERWRITE => 5
}
