#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Security\Credentials\WebAccountProvider.ahk
#Include .\WebAccountProviderCommandInvokedHandler.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class IWebAccountProviderCommand extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAccountProviderCommand
     * @type {Guid}
     */
    static IID => Guid("{d69bdd9a-a0a6-4e9b-88dc-c71e757a3501}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WebAccountProvider", "get_Invoked"]

    /**
     * @type {WebAccountProvider} 
     */
    WebAccountProvider {
        get => this.get_WebAccountProvider()
    }

    /**
     * @type {WebAccountProviderCommandInvokedHandler} 
     */
    Invoked {
        get => this.get_Invoked()
    }

    /**
     * 
     * @returns {WebAccountProvider} 
     */
    get_WebAccountProvider() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebAccountProvider(value)
    }

    /**
     * 
     * @returns {WebAccountProviderCommandInvokedHandler} 
     */
    get_Invoked() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebAccountProviderCommandInvokedHandler(value)
    }
}
