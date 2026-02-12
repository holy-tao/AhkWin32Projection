#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class IPackageUserInformation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageUserInformation
     * @type {Guid}
     */
    static IID => Guid("{f6383423-fa09-4cbc-9055-15ca275e2e7e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UserSecurityId", "get_InstallState"]

    /**
     * @type {HSTRING} 
     */
    UserSecurityId {
        get => this.get_UserSecurityId()
    }

    /**
     * @type {Integer} 
     */
    InstallState {
        get => this.get_InstallState()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserSecurityId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InstallState() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
