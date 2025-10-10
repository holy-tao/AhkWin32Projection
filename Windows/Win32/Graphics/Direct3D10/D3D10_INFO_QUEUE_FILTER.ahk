#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D10_INFO_QUEUE_FILTER_DESC.ahk

/**
 * Debug message filter; contains a lists of message types to allow or deny.
 * @remarks
 * 
  * For use with an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/nn-d3d10sdklayers-id3d10infoqueue">ID3D10InfoQueue Interface</a>.
  * 
  * Providing an allow list with non-zero values causes only the specified combination of categories, severities and message IDs to be allowed.  
  *       Messages that do not match the specified combination will be rejected.
  * 
  * Providing a deny list with non-zero values causes the specified combination of categories, severities and message IDs to be rejected.
  *       Messages that do not match the specified combination will be allowed.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10sdklayers/ns-d3d10sdklayers-d3d10_info_queue_filter
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_INFO_QUEUE_FILTER extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ns-d3d10sdklayers-d3d10_info_queue_filter_desc">D3D10_INFO_QUEUE_FILTER_DESC</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ns-d3d10sdklayers-d3d10_info_queue_filter_desc">D3D10_INFO_QUEUE_FILTER_DESC</a> structure describing the types of messages the info queue should allow.
     * @type {D3D10_INFO_QUEUE_FILTER_DESC}
     */
    AllowList{
        get {
            if(!this.HasProp("__AllowList"))
                this.__AllowList := D3D10_INFO_QUEUE_FILTER_DESC(this.ptr + 0)
            return this.__AllowList
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ns-d3d10sdklayers-d3d10_info_queue_filter_desc">D3D10_INFO_QUEUE_FILTER_DESC</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/ns-d3d10sdklayers-d3d10_info_queue_filter_desc">D3D10_INFO_QUEUE_FILTER_DESC</a> structure describing the types of messages the info queue should reject.
     * @type {D3D10_INFO_QUEUE_FILTER_DESC}
     */
    DenyList{
        get {
            if(!this.HasProp("__DenyList"))
                this.__DenyList := D3D10_INFO_QUEUE_FILTER_DESC(this.ptr + 48)
            return this.__DenyList
        }
    }
}
