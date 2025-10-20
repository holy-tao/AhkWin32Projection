#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ITridentTouchInput extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITridentTouchInput
     * @type {Guid}
     */
    static IID => Guid("{30510850-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnPointerMessage"]

    /**
     * 
     * @param {Integer} msg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<BOOL>} pfAllowManipulations 
     * @returns {HRESULT} 
     */
    OnPointerMessage(msg, wParam, lParam, pfAllowManipulations) {
        result := ComCall(3, this, "uint", msg, "ptr", wParam, "ptr", lParam, "ptr", pfAllowManipulations, "HRESULT")
        return result
    }
}
