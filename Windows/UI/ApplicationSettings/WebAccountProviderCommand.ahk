#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebAccountProviderCommand.ahk
#Include .\IWebAccountProviderCommandFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Associates a provider command with a [WebAccountProvider](../windows.security.credentials/webaccountprovider.md) in the account settings pane.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.webaccountprovidercommand
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class WebAccountProviderCommand extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebAccountProviderCommand

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebAccountProviderCommand.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [WebAccountProviderCommand](webaccountprovidercommand.md) class.
     * @param {WebAccountProvider} webAccountProvider_ The web account provider.
     * @param {WebAccountProviderCommandInvokedHandler} invoked The delegate that handles the provider command.
     * @returns {WebAccountProviderCommand} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.webaccountprovidercommand.#ctor
     */
    static CreateWebAccountProviderCommand(webAccountProvider_, invoked) {
        if (!WebAccountProviderCommand.HasProp("__IWebAccountProviderCommandFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.ApplicationSettings.WebAccountProviderCommand")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountProviderCommandFactory.IID)
            WebAccountProviderCommand.__IWebAccountProviderCommandFactory := IWebAccountProviderCommandFactory(factoryPtr)
        }

        return WebAccountProviderCommand.__IWebAccountProviderCommandFactory.CreateWebAccountProviderCommand(webAccountProvider_, invoked)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the web account provider that's associated with the current command.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.webaccountprovidercommand.webaccountprovider
     * @type {WebAccountProvider} 
     */
    WebAccountProvider {
        get => this.get_WebAccountProvider()
    }

    /**
     * Gets the delegate that's invoked when the user selects an account and a specific action in the accounts pane.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.webaccountprovidercommand.invoked
     * @type {WebAccountProviderCommandInvokedHandler} 
     */
    Invoked {
        get => this.get_Invoked()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WebAccountProvider} 
     */
    get_WebAccountProvider() {
        if (!this.HasProp("__IWebAccountProviderCommand")) {
            if ((queryResult := this.QueryInterface(IWebAccountProviderCommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProviderCommand := IWebAccountProviderCommand(outPtr)
        }

        return this.__IWebAccountProviderCommand.get_WebAccountProvider()
    }

    /**
     * 
     * @returns {WebAccountProviderCommandInvokedHandler} 
     */
    get_Invoked() {
        if (!this.HasProp("__IWebAccountProviderCommand")) {
            if ((queryResult := this.QueryInterface(IWebAccountProviderCommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProviderCommand := IWebAccountProviderCommand(outPtr)
        }

        return this.__IWebAccountProviderCommand.get_Invoked()
    }

;@endregion Instance Methods
}
