#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IApplicationDebuggerUI extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationDebuggerUI
     * @type {Guid}
     */
    static IID => Guid("{51973c2b-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BringDocumentToTop", "BringDocumentContextToTop"]

    /**
     * 
     * @param {IDebugDocumentText} pddt 
     * @returns {HRESULT} 
     */
    BringDocumentToTop(pddt) {
        result := ComCall(3, this, "ptr", pddt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugDocumentContext} pddc 
     * @returns {HRESULT} 
     */
    BringDocumentContextToTop(pddc) {
        result := ComCall(4, this, "ptr", pddc, "HRESULT")
        return result
    }
}
