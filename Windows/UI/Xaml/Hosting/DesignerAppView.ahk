#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDesignerAppView.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an app view in a XAML design surface.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.designerappview
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class DesignerAppView extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDesignerAppView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDesignerAppView.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the identifier for the app view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.designerappview.applicationviewid
     * @type {Integer} 
     */
    ApplicationViewId {
        get => this.get_ApplicationViewId()
    }

    /**
     * Gets the identifier for the app user model.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.designerappview.appusermodelid
     * @type {HSTRING} 
     */
    AppUserModelId {
        get => this.get_AppUserModelId()
    }

    /**
     * Gets a value that indicates whether the view is visible or hidden.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.designerappview.viewstate
     * @type {Integer} 
     */
    ViewState {
        get => this.get_ViewState()
    }

    /**
     * Get the size of the app view in the designer.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.designerappview.viewsize
     * @type {SIZE} 
     */
    ViewSize {
        get => this.get_ViewSize()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ApplicationViewId() {
        if (!this.HasProp("__IDesignerAppView")) {
            if ((queryResult := this.QueryInterface(IDesignerAppView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDesignerAppView := IDesignerAppView(outPtr)
        }

        return this.__IDesignerAppView.get_ApplicationViewId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppUserModelId() {
        if (!this.HasProp("__IDesignerAppView")) {
            if ((queryResult := this.QueryInterface(IDesignerAppView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDesignerAppView := IDesignerAppView(outPtr)
        }

        return this.__IDesignerAppView.get_AppUserModelId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ViewState() {
        if (!this.HasProp("__IDesignerAppView")) {
            if ((queryResult := this.QueryInterface(IDesignerAppView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDesignerAppView := IDesignerAppView(outPtr)
        }

        return this.__IDesignerAppView.get_ViewState()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_ViewSize() {
        if (!this.HasProp("__IDesignerAppView")) {
            if ((queryResult := this.QueryInterface(IDesignerAppView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDesignerAppView := IDesignerAppView(outPtr)
        }

        return this.__IDesignerAppView.get_ViewSize()
    }

    /**
     * Updates the app view in the designer.
     * @param {Integer} viewState The state of the app view.
     * @param {SIZE} viewSize The size of the app view.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.designerappview.updateviewasync
     */
    UpdateViewAsync(viewState, viewSize) {
        if (!this.HasProp("__IDesignerAppView")) {
            if ((queryResult := this.QueryInterface(IDesignerAppView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDesignerAppView := IDesignerAppView(outPtr)
        }

        return this.__IDesignerAppView.UpdateViewAsync(viewState, viewSize)
    }

    /**
     * Closes the app view in the designer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.designerappview.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
