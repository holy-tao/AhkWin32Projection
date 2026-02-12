#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Security\Authentication\Web\Provider\IWebAccountProviderOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Contains methods for providing information to an app activated as a result of a web account provider operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iwebaccountprovideractivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IWebAccountProviderActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAccountProviderActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{72b71774-98ea-4ccf-9752-46d9051004f1}")

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
     * Gets the web account provider operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iwebaccountprovideractivatedeventargs.operation
     * @type {IWebAccountProviderOperation} 
     */
    Operation {
        get => this.get_Operation()
    }

    /**
     * 
     * @returns {IWebAccountProviderOperation} 
     */
    get_Operation() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWebAccountProviderOperation(value)
    }
}
