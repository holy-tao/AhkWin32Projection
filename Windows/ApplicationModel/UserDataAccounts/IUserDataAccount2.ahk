#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserDataAccounts
 * @version WindowsRuntime 1.4
 */
class IUserDataAccount2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDataAccount2
     * @type {Guid}
     */
    static IID => Guid("{078cd89f-de82-404b-8195-c8a3ac198f60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EnterpriseId", "get_IsProtectedUnderLock"]

    /**
     * @type {HSTRING} 
     */
    EnterpriseId {
        get => this.get_EnterpriseId()
    }

    /**
     * @type {Boolean} 
     */
    IsProtectedUnderLock {
        get => this.get_IsProtectedUnderLock()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EnterpriseId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsProtectedUnderLock() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
