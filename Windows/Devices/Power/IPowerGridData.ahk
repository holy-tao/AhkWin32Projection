#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Power
 * @version WindowsRuntime 1.4
 */
class IPowerGridData extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPowerGridData
     * @type {Guid}
     */
    static IID => Guid("{c360fb17-fc92-5f6e-999d-16a4cf9d6c40}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Severity", "get_IsLowUserExperienceImpact"]

    /**
     * @type {Float} 
     */
    Severity {
        get => this.get_Severity()
    }

    /**
     * @type {Boolean} 
     */
    IsLowUserExperienceImpact {
        get => this.get_IsLowUserExperienceImpact()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Severity() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLowUserExperienceImpact() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
