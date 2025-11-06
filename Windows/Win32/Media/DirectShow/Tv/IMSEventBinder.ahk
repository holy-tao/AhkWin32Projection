#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSEventBinder extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSEventBinder
     * @type {Guid}
     */
    static IID => Guid("{c3a9f406-2222-436d-86d5-ba3229279efb}")

    /**
     * The class identifier for MSEventBinder
     * @type {Guid}
     */
    static CLSID => Guid("{577faa18-4518-445e-8f70-1473f8cf4ba4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Bind", "Unbind"]

    /**
     * 
     * @param {IDispatch} pEventObject 
     * @param {BSTR} EventName 
     * @param {BSTR} EventHandler 
     * @returns {Integer} 
     */
    Bind(pEventObject, EventName, EventHandler) {
        EventName := EventName is String ? BSTR.Alloc(EventName).Value : EventName
        EventHandler := EventHandler is String ? BSTR.Alloc(EventHandler).Value : EventHandler

        result := ComCall(7, this, "ptr", pEventObject, "ptr", EventName, "ptr", EventHandler, "int*", &CancelID := 0, "HRESULT")
        return CancelID
    }

    /**
     * 
     * @param {Integer} CancelCookie 
     * @returns {HRESULT} 
     */
    Unbind(CancelCookie) {
        result := ComCall(8, this, "uint", CancelCookie, "HRESULT")
        return result
    }
}
