#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INewWebUIViewCreatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides info when a new [WebUIView](webuiview.md) is created.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.newwebuiviewcreatedeventargs
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class NewWebUIViewCreatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INewWebUIViewCreatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INewWebUIViewCreatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the web UI view that triggered the event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.newwebuiviewcreatedeventargs.webuiview
     * @type {WebUIView} 
     */
    WebUIView {
        get => this.get_WebUIView()
    }

    /**
     * Gets info about the activated event that caused the view to be created.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.newwebuiviewcreatedeventargs.activatedeventargs
     * @type {IActivatedEventArgs} 
     */
    ActivatedEventArgs {
        get => this.get_ActivatedEventArgs()
    }

    /**
     * Gets a value that indicates whether the view has a pending navigation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.newwebuiviewcreatedeventargs.haspendingnavigate
     * @type {Boolean} 
     */
    HasPendingNavigate {
        get => this.get_HasPendingNavigate()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WebUIView} 
     */
    get_WebUIView() {
        if (!this.HasProp("__INewWebUIViewCreatedEventArgs")) {
            if ((queryResult := this.QueryInterface(INewWebUIViewCreatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INewWebUIViewCreatedEventArgs := INewWebUIViewCreatedEventArgs(outPtr)
        }

        return this.__INewWebUIViewCreatedEventArgs.get_WebUIView()
    }

    /**
     * 
     * @returns {IActivatedEventArgs} 
     */
    get_ActivatedEventArgs() {
        if (!this.HasProp("__INewWebUIViewCreatedEventArgs")) {
            if ((queryResult := this.QueryInterface(INewWebUIViewCreatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INewWebUIViewCreatedEventArgs := INewWebUIViewCreatedEventArgs(outPtr)
        }

        return this.__INewWebUIViewCreatedEventArgs.get_ActivatedEventArgs()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasPendingNavigate() {
        if (!this.HasProp("__INewWebUIViewCreatedEventArgs")) {
            if ((queryResult := this.QueryInterface(INewWebUIViewCreatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INewWebUIViewCreatedEventArgs := INewWebUIViewCreatedEventArgs(outPtr)
        }

        return this.__INewWebUIViewCreatedEventArgs.get_HasPendingNavigate()
    }

    /**
     * Requests a delay before the new view is created.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.newwebuiviewcreatedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__INewWebUIViewCreatedEventArgs")) {
            if ((queryResult := this.QueryInterface(INewWebUIViewCreatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INewWebUIViewCreatedEventArgs := INewWebUIViewCreatedEventArgs(outPtr)
        }

        return this.__INewWebUIViewCreatedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
