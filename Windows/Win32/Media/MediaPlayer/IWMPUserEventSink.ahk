#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPUserEventSink interface receives event notifications from a custom video presenter.
 * @see https://docs.microsoft.com/windows/win32/api//wmpservices/nn-wmpservices-iwmpusereventsink
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPUserEventSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPUserEventSink
     * @type {Guid}
     */
    static IID => Guid("{cfccfa72-c343-48c3-a2de-b7a4402e39f2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NotifyUserEvent"]

    /**
     * 
     * @param {Integer} EventCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmpservices/nf-wmpservices-iwmpusereventsink-notifyuserevent
     */
    NotifyUserEvent(EventCode) {
        result := ComCall(3, this, "int", EventCode, "HRESULT")
        return result
    }
}
