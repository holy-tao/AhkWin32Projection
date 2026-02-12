#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewControlProcessOptions.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * This class contains options that can be set when creating a [Windows.Web.UI.Interop.WebViewControl](webviewcontrol.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrolprocessoptions
 * @namespace Windows.Web.UI.Interop
 * @version WindowsRuntime 1.4
 */
class WebViewControlProcessOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewControlProcessOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewControlProcessOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the enterprise ID for apps that are WIP-enabled.
     * @remarks
     * To learn more about Windows Information Protection (WIP), see [Protect your enterprise data using WIP](/windows/threat-protection/windows-information-protection/protect-enterprise-data-using-wip).
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrolprocessoptions.enterpriseid
     * @type {HSTRING} 
     */
    EnterpriseId {
        get => this.get_EnterpriseId()
        set => this.put_EnterpriseId(value)
    }

    /**
     * Gets or sets a boolean value indicating whether the privateNetworkClientServer capability is enabled.
     * @remarks
     * To learn more about capabilities and the privateNetworkClientServer capability, see the [App capability declarations](/windows/uwp/packaging/app-capability-declarations) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrolprocessoptions.privatenetworkclientservercapability
     * @type {Integer} 
     */
    PrivateNetworkClientServerCapability {
        get => this.get_PrivateNetworkClientServerCapability()
        set => this.put_PrivateNetworkClientServerCapability(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of **WebViewControlProcessOptions**
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Web.UI.Interop.WebViewControlProcessOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_EnterpriseId(value) {
        if (!this.HasProp("__IWebViewControlProcessOptions")) {
            if ((queryResult := this.QueryInterface(IWebViewControlProcessOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlProcessOptions := IWebViewControlProcessOptions(outPtr)
        }

        return this.__IWebViewControlProcessOptions.put_EnterpriseId(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EnterpriseId() {
        if (!this.HasProp("__IWebViewControlProcessOptions")) {
            if ((queryResult := this.QueryInterface(IWebViewControlProcessOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlProcessOptions := IWebViewControlProcessOptions(outPtr)
        }

        return this.__IWebViewControlProcessOptions.get_EnterpriseId()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PrivateNetworkClientServerCapability(value) {
        if (!this.HasProp("__IWebViewControlProcessOptions")) {
            if ((queryResult := this.QueryInterface(IWebViewControlProcessOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlProcessOptions := IWebViewControlProcessOptions(outPtr)
        }

        return this.__IWebViewControlProcessOptions.put_PrivateNetworkClientServerCapability(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrivateNetworkClientServerCapability() {
        if (!this.HasProp("__IWebViewControlProcessOptions")) {
            if ((queryResult := this.QueryInterface(IWebViewControlProcessOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlProcessOptions := IWebViewControlProcessOptions(outPtr)
        }

        return this.__IWebViewControlProcessOptions.get_PrivateNetworkClientServerCapability()
    }

;@endregion Instance Methods
}
