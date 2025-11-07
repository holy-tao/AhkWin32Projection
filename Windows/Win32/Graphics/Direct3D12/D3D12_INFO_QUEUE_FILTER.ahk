#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_INFO_QUEUE_FILTER_DESC.ahk

/**
 * Debug message filter; contains a lists of message types to allow or deny.
 * @remarks
 * 
 * For use with an <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12infoqueue">ID3D12InfoQueue</a> Interface.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/ns-d3d12sdklayers-d3d12_info_queue_filter
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_INFO_QUEUE_FILTER extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Specifies types of messages that you want to allow. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_info_queue_filter_desc">D3D12_INFO_QUEUE_FILTER_DESC</a>.
     * @type {D3D12_INFO_QUEUE_FILTER_DESC}
     */
    AllowList{
        get {
            if(!this.HasProp("__AllowList"))
                this.__AllowList := D3D12_INFO_QUEUE_FILTER_DESC(0, this)
            return this.__AllowList
        }
    }

    /**
     * Specifies types of messages that you want to deny.
     * @type {D3D12_INFO_QUEUE_FILTER_DESC}
     */
    DenyList{
        get {
            if(!this.HasProp("__DenyList"))
                this.__DenyList := D3D12_INFO_QUEUE_FILTER_DESC(48, this)
            return this.__DenyList
        }
    }
}
