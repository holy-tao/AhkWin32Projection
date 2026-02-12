#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IIsolatedWindowsEnvironmentUserInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsolatedWindowsEnvironmentUserInfo
     * @type {Guid}
     */
    static IID => Guid("{8a9c75ae-69ba-4001-96fc-19a02703b340}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EnvironmentUserSid", "get_EnvironmentUserName", "TryWaitForSignInAsync"]

    /**
     * @type {HSTRING} 
     */
    EnvironmentUserSid {
        get => this.get_EnvironmentUserSid()
    }

    /**
     * @type {HSTRING} 
     */
    EnvironmentUserName {
        get => this.get_EnvironmentUserName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EnvironmentUserSid() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EnvironmentUserName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryWaitForSignInAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
