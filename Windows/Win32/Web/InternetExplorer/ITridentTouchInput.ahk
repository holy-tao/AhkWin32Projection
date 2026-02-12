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
     * @param {Integer} msg_ 
     * @param {WPARAM} wParam_ 
     * @param {LPARAM} lParam_ 
     * @returns {BOOL} 
     */
    OnPointerMessage(msg_, wParam_, lParam_) {
        wParam_ := wParam_ is Win32Handle ? NumGet(wParam_, "ptr") : wParam_
        lParam_ := lParam_ is Win32Handle ? NumGet(lParam_, "ptr") : lParam_

        result := ComCall(3, this, "uint", msg_, "ptr", wParam_, "ptr", lParam_, "int*", &pfAllowManipulations := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfAllowManipulations
    }
}
