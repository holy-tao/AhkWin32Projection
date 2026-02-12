#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\User.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.UserProfile
 * @version WindowsRuntime 1.4
 */
class IDiagnosticsSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDiagnosticsSettings
     * @type {Guid}
     */
    static IID => Guid("{e5e9eccd-2711-44e0-973c-491d78048d24}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanUseDiagnosticsToTailorExperiences", "get_User"]

    /**
     * @type {Boolean} 
     */
    CanUseDiagnosticsToTailorExperiences {
        get => this.get_CanUseDiagnosticsToTailorExperiences()
    }

    /**
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanUseDiagnosticsToTailorExperiences() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return User(value)
    }
}
