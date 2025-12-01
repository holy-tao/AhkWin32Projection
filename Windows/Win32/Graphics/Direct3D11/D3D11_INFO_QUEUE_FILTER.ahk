#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_INFO_QUEUE_FILTER_DESC.ahk

/**
 * Debug message filter; contains a lists of message types to allow or deny. (D3D11_INFO_QUEUE_FILTER)
 * @remarks
 * For use with an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nn-d3d11sdklayers-id3d11infoqueue">ID3D11InfoQueue Interface</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_info_queue_filter
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_INFO_QUEUE_FILTER extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_info_queue_filter_desc">D3D11_INFO_QUEUE_FILTER_DESC</a></b>
     * 
     * Types of messages that you want to allow. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_info_queue_filter_desc">D3D11_INFO_QUEUE_FILTER_DESC</a>.
     * @type {D3D11_INFO_QUEUE_FILTER_DESC}
     */
    AllowList{
        get {
            if(!this.HasProp("__AllowList"))
                this.__AllowList := D3D11_INFO_QUEUE_FILTER_DESC(0, this)
            return this.__AllowList
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_info_queue_filter_desc">D3D11_INFO_QUEUE_FILTER_DESC</a></b>
     * 
     * Types of messages that you want to deny.
     * @type {D3D11_INFO_QUEUE_FILTER_DESC}
     */
    DenyList{
        get {
            if(!this.HasProp("__DenyList"))
                this.__DenyList := D3D11_INFO_QUEUE_FILTER_DESC(48, this)
            return this.__DenyList
        }
    }
}
