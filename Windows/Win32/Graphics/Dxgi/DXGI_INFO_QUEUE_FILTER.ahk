#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXGI_INFO_QUEUE_FILTER_DESC.ahk

/**
 * Describes a debug message filter, which contains lists of message types to allow and deny.
 * @remarks
 * 
  * Use with an <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/nn-dxgidebug-idxgiinfoqueue">IDXGIInfoQueue</a> interface.
  * 
  * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgidebug/ns-dxgidebug-dxgi_info_queue_filter
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_INFO_QUEUE_FILTER extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_filter_desc">DXGI_INFO_QUEUE_FILTER_DESC</a> structure that describes the types of messages to allow.
     * @type {DXGI_INFO_QUEUE_FILTER_DESC}
     */
    AllowList{
        get {
            if(!this.HasProp("__AllowList"))
                this.__AllowList := DXGI_INFO_QUEUE_FILTER_DESC(this.ptr + 0)
            return this.__AllowList
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_filter_desc">DXGI_INFO_QUEUE_FILTER_DESC</a> structure that describes the types of messages to deny.
     * @type {DXGI_INFO_QUEUE_FILTER_DESC}
     */
    DenyList{
        get {
            if(!this.HasProp("__DenyList"))
                this.__DenyList := DXGI_INFO_QUEUE_FILTER_DESC(this.ptr + 48)
            return this.__DenyList
        }
    }
}
