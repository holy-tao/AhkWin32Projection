#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCClientProvisioning.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCClientProvisioning2 extends IRTCClientProvisioning{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCClientProvisioning2
     * @type {Guid}
     */
    static IID => Guid("{a70909b5-f40e-4587-bb75-e6bc0845023e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnableProfileEx"]

    /**
     * 
     * @param {IRTCProfile} pProfile 
     * @param {Integer} lRegisterFlags 
     * @param {Integer} lRoamingFlags 
     * @returns {HRESULT} 
     */
    EnableProfileEx(pProfile, lRegisterFlags, lRoamingFlags) {
        result := ComCall(10, this, "ptr", pProfile, "int", lRegisterFlags, "int", lRoamingFlags, "HRESULT")
        return result
    }
}
