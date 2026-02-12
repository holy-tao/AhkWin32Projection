#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewControlProcess.ahk
#Include .\IWebViewControlProcessFactory.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\WebViewControlProcess.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * This class represents the process that one or more [Windows.Web.UI.Interop.WebViewControl](webviewcontrol.md) classes will live in.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrolprocess
 * @namespace Windows.Web.UI.Interop
 * @version WindowsRuntime 1.4
 */
class WebViewControlProcess extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewControlProcess

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewControlProcess.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of **WebViewControlProcess** with options.
     * @param {WebViewControlProcessOptions} processOptions The process options. For more info, see [Windows.Web.UI.Interop.WebViewControlProcessOptions](webviewcontrolprocessoptions.md).
     * @returns {WebViewControlProcess} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrolprocess.#ctor
     */
    static CreateWithOptions(processOptions) {
        if (!WebViewControlProcess.HasProp("__IWebViewControlProcessFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.UI.Interop.WebViewControlProcess")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebViewControlProcessFactory.IID)
            WebViewControlProcess.__IWebViewControlProcessFactory := IWebViewControlProcessFactory(factoryPtr)
        }

        return WebViewControlProcess.__IWebViewControlProcessFactory.CreateWithOptions(processOptions)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the ID of this process.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrolprocess.processid
     * @type {Integer} 
     */
    ProcessId {
        get => this.get_ProcessId()
    }

    /**
     * Gets the enterprise ID of this proces.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrolprocess.enterpriseid
     * @type {HSTRING} 
     */
    EnterpriseId {
        get => this.get_EnterpriseId()
    }

    /**
     * Gets a boolean value indicating whether the privateNetworkClientServer capability is enabled in this process.
     * @remarks
     * You can set this value when creating the **WebViewControlProcess** object and passing in a [Windows.Web.UI.Interop.WebViewControlProcessOptions](webviewcontrolprocessoptions.md) with the [Windows.Web.UI.Interop.WebViewControlProcessOptions.PrivateNetworkClientServerCapability](webviewcontrolprocessoptions_privatenetworkclientservercapability.md) property set to **true**.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrolprocess.isprivatenetworkclientservercapabilityenabled
     * @type {Boolean} 
     */
    IsPrivateNetworkClientServerCapabilityEnabled {
        get => this.get_IsPrivateNetworkClientServerCapabilityEnabled()
    }

    /**
     * Fires when this process is terminated.
     * @remarks
     * Any calls to [Windows.Web.UI.Interop.WebViewControl](webviewcontrol.md) objects within this process will cause an exception.
     * @type {TypedEventHandler<WebViewControlProcess, IInspectable>}
    */
    OnProcessExited {
        get {
            if(!this.HasProp("__OnProcessExited")){
                this.__OnProcessExited := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{0c4182f4-cc4c-55f3-b421-d4e749eb80a1}"),
                    WebViewControlProcess,
                    IInspectable
                )
                this.__OnProcessExitedToken := this.add_ProcessExited(this.__OnProcessExited.iface)
            }
            return this.__OnProcessExited
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of **WebViewControlProcess**.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Web.UI.Interop.WebViewControlProcess")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnProcessExitedToken")) {
            this.remove_ProcessExited(this.__OnProcessExitedToken)
            this.__OnProcessExited.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProcessId() {
        if (!this.HasProp("__IWebViewControlProcess")) {
            if ((queryResult := this.QueryInterface(IWebViewControlProcess.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlProcess := IWebViewControlProcess(outPtr)
        }

        return this.__IWebViewControlProcess.get_ProcessId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EnterpriseId() {
        if (!this.HasProp("__IWebViewControlProcess")) {
            if ((queryResult := this.QueryInterface(IWebViewControlProcess.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlProcess := IWebViewControlProcess(outPtr)
        }

        return this.__IWebViewControlProcess.get_EnterpriseId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPrivateNetworkClientServerCapabilityEnabled() {
        if (!this.HasProp("__IWebViewControlProcess")) {
            if ((queryResult := this.QueryInterface(IWebViewControlProcess.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlProcess := IWebViewControlProcess(outPtr)
        }

        return this.__IWebViewControlProcess.get_IsPrivateNetworkClientServerCapabilityEnabled()
    }

    /**
     * Creates a [Windows.Web.UI.Interop.WebViewControl](webviewcontrol.md) within the context of this process.
     * @param {Integer} hostWindowHandle The parent window.
     * @param {RECT} bounds The initial bounds of the window.
     * @returns {IAsyncOperation<WebViewControl>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrolprocess.createwebviewcontrolasync
     */
    CreateWebViewControlAsync(hostWindowHandle, bounds) {
        if (!this.HasProp("__IWebViewControlProcess")) {
            if ((queryResult := this.QueryInterface(IWebViewControlProcess.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlProcess := IWebViewControlProcess(outPtr)
        }

        return this.__IWebViewControlProcess.CreateWebViewControlAsync(hostWindowHandle, bounds)
    }

    /**
     * Gets a vector containing all the [Windows.Web.UI.Interop.WebViewControl](webviewcontrol.md) objects hosted within this process.
     * @returns {IVectorView<WebViewControl>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrolprocess.getwebviewcontrols
     */
    GetWebViewControls() {
        if (!this.HasProp("__IWebViewControlProcess")) {
            if ((queryResult := this.QueryInterface(IWebViewControlProcess.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlProcess := IWebViewControlProcess(outPtr)
        }

        return this.__IWebViewControlProcess.GetWebViewControls()
    }

    /**
     * Terminates the process.
     * @remarks
     * This will cause the [Windows.Web.UI.Interop.WebViewControlProcess.ProcessExited](webviewcontrolprocess_processexited.md) event to fire and any calls to any [Windows.Web.UI.Interop.WebViewControl](webviewcontrol.md) objects within this process will cause an exception to be thrown.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrolprocess.terminate
     */
    Terminate() {
        if (!this.HasProp("__IWebViewControlProcess")) {
            if ((queryResult := this.QueryInterface(IWebViewControlProcess.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlProcess := IWebViewControlProcess(outPtr)
        }

        return this.__IWebViewControlProcess.Terminate()
    }

    /**
     * 
     * @param {TypedEventHandler<WebViewControlProcess, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ProcessExited(handler) {
        if (!this.HasProp("__IWebViewControlProcess")) {
            if ((queryResult := this.QueryInterface(IWebViewControlProcess.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlProcess := IWebViewControlProcess(outPtr)
        }

        return this.__IWebViewControlProcess.add_ProcessExited(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ProcessExited(token) {
        if (!this.HasProp("__IWebViewControlProcess")) {
            if ((queryResult := this.QueryInterface(IWebViewControlProcess.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlProcess := IWebViewControlProcess(outPtr)
        }

        return this.__IWebViewControlProcess.remove_ProcessExited(token)
    }

;@endregion Instance Methods
}
