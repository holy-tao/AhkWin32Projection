#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncConstraintCallback extends IUnknown{
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
     * 
     * @param {Pointer<IConstraintConflict>} pConflict 
     * @returns {HRESULT} 
     */
    OnConstraintConflict(pConflict) {
        result := ComCall(3, this, "ptr", pConflict, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
