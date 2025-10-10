#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags that describe miscellaneous query behavior.
 * @remarks
 * 
  * This flag is part of a query description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_query_desc">D3D10_QUERY_DESC</a>).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/ne-d3d10-d3d10_query_misc_flag
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_QUERY_MISC_FLAG{

    /**
     * Tell the hardware that if it is not yet sure if something is hidden or not to draw it anyway. This is only used with an occlusion predicate. Predication data cannot be returned to your application via <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-getdata">ID3D10Asynchronous::GetData</a> when using this flag.
     * @type {Integer (Int32)}
     */
    static D3D10_QUERY_MISC_PREDICATEHINT => 1
}
