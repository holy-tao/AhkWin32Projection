#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.AssessmentTool
 * @version v4.0.30319
 */
class IQueryOEMWinSATCustomization extends IUnknown{
    /**
     * The interface identifier for IQueryOEMWinSATCustomization
     * @type {Guid}
     */
    static IID => Guid("{bc9a6a9f-ad4e-420e-9953-b34671e9df22}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} state 
     * @returns {HRESULT} 
     */
    GetOEMPrePopulationInfo(state) {
        result := ComCall(3, this, "int*", state, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
