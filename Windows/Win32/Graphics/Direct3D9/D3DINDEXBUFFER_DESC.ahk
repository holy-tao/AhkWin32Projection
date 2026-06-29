#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DRESOURCETYPE.ahk" { D3DRESOURCETYPE }
#Import ".\D3DPOOL.ahk" { D3DPOOL }
#Import ".\D3DFORMAT.ahk" { D3DFORMAT }

/**
 * Describes an index buffer.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dindexbuffer-desc
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DINDEXBUFFER_DESC {
    #StructPack 4

    /**
     * Type: **[D3DFORMAT](d3dformat.md)**
     * 
     * 
     * Member of the [D3DFORMAT](d3dformat.md) enumerated type, describing the surface format of the index buffer data.
     */
    Format : D3DFORMAT

    /**
     * Type: **[**D3DRESOURCETYPE**](./d3dresourcetype.md)**
     * 
     * 
     * Member of the [**D3DRESOURCETYPE**](./d3dresourcetype.md) enumerated type, identifying this resource as an index buffer.
     */
    Type : D3DRESOURCETYPE

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Combination of one or more of the following flags, specifying the usage for this resource.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                   | Meaning                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
     * |---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="D3DUSAGE_DONOTCLIP"></span><span id="d3dusage_donotclip"></span><dl> <dt>**D3DUSAGE\_DONOTCLIP**</dt> </dl>                            | Set to indicate that the index buffer content will never require clipping.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
     * | <span id="D3DUSAGE_DYNAMIC"></span><span id="d3dusage_dynamic"></span><dl> <dt>**D3DUSAGE\_DYNAMIC**</dt> </dl>                                  | Set to indicate that the index buffer requires dynamic memory use. This is useful for drivers because it enables them to decide where to place the buffer. In general, static index buffers are placed in video memory and dynamic index buffers are placed in AGP memory. Note that there is no separate static usage; if you do not specify D3DUSAGE\_DYNAMIC the index buffer is made static. D3DUSAGE\_DYNAMIC is strictly enforced through the D3DLOCK\_DISCARD and D3DLOCK\_NOOVERWRITE locking flags. As a result, D3DLOCK\_DISCARD and D3DLOCK\_NOOVERWRITE are only valid on index buffers created with D3DUSAGE\_DYNAMIC; they are not valid flags on static vertex buffers.<br/> For more information about using dynamic index buffers, see [Using Dynamic Vertex and Index Buffers](performance-optimizations.md).<br/> Note that D3DUSAGE\_DYNAMIC cannot be specified on managed index buffers. For more information, see [Managing Resources (Direct3D 9)](managing-resources.md).<br/> |
     * | <span id="D3DUSAGE_RTPATCHES"></span><span id="d3dusage_rtpatches"></span><dl> <dt>**D3DUSAGE\_RTPATCHES**</dt> </dl>                            | Set to indicate when the index buffer is to be used for drawing high-order primitives.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
     * | <span id="D3DUSAGE_NPATCHES"></span><span id="d3dusage_npatches"></span><dl> <dt>**D3DUSAGE\_NPATCHES**</dt> </dl>                               | Set to indicate when the index buffer is to be used for drawing N patches.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
     * | <span id="D3DUSAGE_POINTS"></span><span id="d3dusage_points"></span><dl> <dt>**D3DUSAGE\_POINTS**</dt> </dl>                                     | Set to indicate when the index buffer is to be used for drawing point sprites or indexed point lists.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
     * | <span id="D3DUSAGE_SOFTWAREPROCESSING"></span><span id="d3dusage_softwareprocessing"></span><dl> <dt>**D3DUSAGE\_SOFTWAREPROCESSING**</dt> </dl> | Set to indicate that the buffer is to be used with software processing.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
     * | <span id="D3DUSAGE_WRITEONLY"></span><span id="d3dusage_writeonly"></span><dl> <dt>**D3DUSAGE\_WRITEONLY**</dt> </dl>                            | Informs the system that the application writes only to the index buffer. Using this flag enables the driver to choose the best memory location for efficient write operations and rendering. Attempts to read from an index buffer that is created with this capability can result in degraded performance.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
     */
    Usage : UInt32

    /**
     * Type: **[**D3DPOOL**](./d3dpool.md)**
     * 
     * 
     * Member of the [**D3DPOOL**](./d3dpool.md) enumerated type, specifying the class of memory allocated for this index buffer.
     */
    Pool : D3DPOOL

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Size of the index buffer, in bytes.
     */
    Size : UInt32

}
