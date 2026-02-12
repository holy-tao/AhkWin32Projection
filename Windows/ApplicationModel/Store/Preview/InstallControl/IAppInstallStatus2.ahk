#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\System\User.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class IAppInstallStatus2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppInstallStatus2
     * @type {Guid}
     */
    static IID => Guid("{96e7818a-5e92-4aa9-8edc-58fed4b87e00}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_User", "get_ReadyForLaunch"]

    /**
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * @type {Boolean} 
     */
    ReadyForLaunch {
        get => this.get_ReadyForLaunch()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return User(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ReadyForLaunch() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
