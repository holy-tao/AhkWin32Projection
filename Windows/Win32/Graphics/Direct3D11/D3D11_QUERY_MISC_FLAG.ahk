#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags that describe miscellaneous query behavior.
 * @remarks
 * 
  * This flag is part of a query description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_query_desc">D3D11_QUERY_DESC</a>).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_query_misc_flag
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_QUERY_MISC_FLAG{

    /**
     * Tell the hardware that if it is not yet sure if something is hidden or not to draw it anyway. This is only used with an occlusion predicate. Predication data cannot be returned to your application via <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">ID3D11DeviceContext::GetData</a> when using this flag.
     * @type {Integer (Int32)}
     */
    static D3D11_QUERY_MISC_PREDICATEHINT => 1
}
