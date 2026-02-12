#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Security\Credentials\WebAccount.ahk
#Include .\WebAccountCommandInvokedHandler.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class IWebAccountCommand extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAccountCommand
     * @type {Guid}
     */
    static IID => Guid("{caa39398-9cfa-4246-b0c4-a913a3896541}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WebAccount", "get_Invoked", "get_Actions"]

    /**
     * @type {WebAccount} 
     */
    WebAccount {
        get => this.get_WebAccount()
    }

    /**
     * @type {WebAccountCommandInvokedHandler} 
     */
    Invoked {
        get => this.get_Invoked()
    }

    /**
     * @type {Integer} 
     */
    Actions {
        get => this.get_Actions()
    }

    /**
     * 
     * @returns {WebAccount} 
     */
    get_WebAccount() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebAccount(value)
    }

    /**
     * 
     * @returns {WebAccountCommandInvokedHandler} 
     */
    get_Invoked() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebAccountCommandInvokedHandler(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Actions() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
