#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IBindEventHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBindEventHandler
     * @type {Guid}
     */
    static IID => Guid("{63cdbcb0-c1b1-11d0-9336-00a0c90dcaa9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BindHandler"]

    /**
     * 
     * @param {PWSTR} pstrEvent 
     * @param {IDispatch} pdisp 
     * @returns {HRESULT} 
     */
    BindHandler(pstrEvent, pdisp) {
        pstrEvent := pstrEvent is String ? StrPtr(pstrEvent) : pstrEvent

        result := ComCall(3, this, "ptr", pstrEvent, "ptr", pdisp, "HRESULT")
        return result
    }
}
