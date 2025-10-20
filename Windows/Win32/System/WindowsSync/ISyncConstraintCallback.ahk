#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncConstraintCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncConstraintCallback
     * @type {Guid}
     */
    static IID => Guid("{8af3843e-75b3-438c-bb51-6f020d70d3cb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnConstraintConflict"]

    /**
     * 
     * @param {IConstraintConflict} pConflict 
     * @returns {HRESULT} 
     */
    OnConstraintConflict(pConflict) {
        result := ComCall(3, this, "ptr", pConflict, "HRESULT")
        return result
    }
}
