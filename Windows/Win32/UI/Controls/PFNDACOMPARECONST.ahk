#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines the prototype for the compare function used by DSA_Sort when the items being compared are constant objects.
 * @remarks
 * Alternate names for this callback are <b>PFNDPACOMPARECONST</b> and <b>PFNDSACOMPARECONST</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/dpa_dsa/nc-dpa_dsa-pfndacompareconst
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class PFNDACOMPARECONST extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<Void>} p1 
     * @param {Pointer<Void>} p2 
     * @param {LPARAM} lParam_ 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(p1, p2, lParam_) {
        lParam_ := lParam_ is Win32Handle ? NumGet(lParam_, "ptr") : lParam_

        p1Marshal := p1 is VarRef ? "ptr" : "ptr"
        p2Marshal := p2 is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, p1Marshal, p1, p2Marshal, p2, "ptr", lParam_, "int")
        return result
    }
}
