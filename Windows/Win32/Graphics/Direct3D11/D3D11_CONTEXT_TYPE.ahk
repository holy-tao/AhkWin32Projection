#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the context in which a query occurs.
 * @remarks
 * This enum is used by the following:
 *         
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ns-d3d11_3-cd3d11_query_desc1">D3D11_QUERY_DESC1</a> structure
 *           </li>
 * <li>A CD3D11_QUERY_DESC1 constructor.</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11devicecontext3-flush1">ID3D11DeviceContext3::Flush1</a> method
 *           </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/ne-d3d11_3-d3d11_context_type
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_CONTEXT_TYPE extends Win32Enum{

    /**
     * The query can occur in all contexts.
     * @type {Integer (Int32)}
     */
    static D3D11_CONTEXT_TYPE_ALL => 0

    /**
     * The query occurs in the context of a 3D command queue.
     * @type {Integer (Int32)}
     */
    static D3D11_CONTEXT_TYPE_3D => 1

    /**
     * The query occurs in the context of a 3D compute queue.
     * @type {Integer (Int32)}
     */
    static D3D11_CONTEXT_TYPE_COMPUTE => 2

    /**
     * The query occurs in the context of a 3D copy queue.
     * @type {Integer (Int32)}
     */
    static D3D11_CONTEXT_TYPE_COPY => 3

    /**
     * The query occurs in the context of video.
     * @type {Integer (Int32)}
     */
    static D3D11_CONTEXT_TYPE_VIDEO => 4
}
