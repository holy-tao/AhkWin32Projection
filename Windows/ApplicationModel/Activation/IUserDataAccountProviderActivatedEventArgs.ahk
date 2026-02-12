#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\UserDataAccounts\Provider\IUserDataAccountProviderOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides data when an app is activated to manage user accounts.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iuserdataaccountprovideractivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IUserDataAccountProviderActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDataAccountProviderActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{1bc9f723-8ef1-4a51-a63a-fe711eeab607}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Operation"]

    /**
     * Gets the user account management operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iuserdataaccountprovideractivatedeventargs.operation
     * @type {IUserDataAccountProviderOperation} 
     */
    Operation {
        get => this.get_Operation()
    }

    /**
     * 
     * @returns {IUserDataAccountProviderOperation} 
     */
    get_Operation() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUserDataAccountProviderOperation(value)
    }
}
