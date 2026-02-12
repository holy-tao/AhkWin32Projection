#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppWindowPresenter.ahk
#Include ..\..\..\Guid.ahk

/**
 * Displays an app window using a pre-defined configuration appropriate for the device it's shown on.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowpresenter
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class AppWindowPresenter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppWindowPresenter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppWindowPresenter.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the configuration info for the app window presenter.
     * @returns {AppWindowPresentationConfiguration} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowpresenter.getconfiguration
     */
    GetConfiguration() {
        if (!this.HasProp("__IAppWindowPresenter")) {
            if ((queryResult := this.QueryInterface(IAppWindowPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowPresenter := IAppWindowPresenter(outPtr)
        }

        return this.__IAppWindowPresenter.GetConfiguration()
    }

    /**
     * Gets a value that indicates whether the kind of presentation is supported.
     * @param {Integer} presentationKind The kind of presentation.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowpresenter.ispresentationsupported
     */
    IsPresentationSupported(presentationKind) {
        if (!this.HasProp("__IAppWindowPresenter")) {
            if ((queryResult := this.QueryInterface(IAppWindowPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowPresenter := IAppWindowPresenter(outPtr)
        }

        return this.__IAppWindowPresenter.IsPresentationSupported(presentationKind)
    }

    /**
     * Makes a request to show the window using the specified kind of presentation.
     * @param {AppWindowPresentationConfiguration} configuration 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowpresenter.requestpresentation
     */
    RequestPresentation(configuration) {
        if (!this.HasProp("__IAppWindowPresenter")) {
            if ((queryResult := this.QueryInterface(IAppWindowPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowPresenter := IAppWindowPresenter(outPtr)
        }

        return this.__IAppWindowPresenter.RequestPresentation(configuration)
    }

    /**
     * Makes a request to show the window using the specified kind of presentation.
     * @param {Integer} presentationKind The kind of presentation to use to show the app window.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowpresenter.requestpresentation
     */
    RequestPresentationByKind(presentationKind) {
        if (!this.HasProp("__IAppWindowPresenter")) {
            if ((queryResult := this.QueryInterface(IAppWindowPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowPresenter := IAppWindowPresenter(outPtr)
        }

        return this.__IAppWindowPresenter.RequestPresentationByKind(presentationKind)
    }

;@endregion Instance Methods
}
