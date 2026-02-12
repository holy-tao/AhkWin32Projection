#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IProvisionedProfile extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProvisionedProfile
     * @type {Guid}
     */
    static IID => Guid("{217700e0-8202-11df-adb9-f4ce462d9137}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UpdateCost", "UpdateUsage"]

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    UpdateCost(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ProfileUsage} value 
     * @returns {HRESULT} 
     */
    UpdateUsage(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
