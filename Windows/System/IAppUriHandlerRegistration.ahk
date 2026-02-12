#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include .\User.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include ..\Foundation\Collections\IVector.ahk
#Include .\AppUriHandlerHost.ahk
#Include ..\Foundation\IAsyncAction.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IAppUriHandlerRegistration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppUriHandlerRegistration
     * @type {Guid}
     */
    static IID => Guid("{6f73aeb1-4569-5c3f-9ba0-99123eea32c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_User", "GetAppAddedHostsAsync", "SetAppAddedHostsAsync"]

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
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

    /**
     * 
     * @returns {IAsyncOperation<IVector<AppUriHandlerHost>>} 
     */
    GetAppAddedHostsAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVector.Call.Bind(IVector, AppUriHandlerHost), operation)
    }

    /**
     * 
     * @param {IIterable<AppUriHandlerHost>} hosts 
     * @returns {IAsyncAction} 
     */
    SetAppAddedHostsAsync(hosts) {
        result := ComCall(9, this, "ptr", hosts, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
