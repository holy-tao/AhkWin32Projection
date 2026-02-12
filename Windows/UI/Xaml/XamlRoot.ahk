#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IXamlRoot.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\XamlRoot.ahk
#Include .\XamlRootChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a tree of XAML content and information about the context in which it is hosted.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.xamlroot
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class XamlRoot extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXamlRoot

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXamlRoot.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the root element of the XAML element tree.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.xamlroot.content
     * @type {UIElement} 
     */
    Content {
        get => this.get_Content()
    }

    /**
     * Gets the width and height of the content area.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.xamlroot.size
     * @type {SIZE} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * Gets a value that represents the number of raw (physical) pixels for each view pixel.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.xamlroot.rasterizationscale
     * @type {Float} 
     */
    RasterizationScale {
        get => this.get_RasterizationScale()
    }

    /**
     * Gets a value that indicates whether the XamlRoot is visible.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.xamlroot.ishostvisible
     * @type {Boolean} 
     */
    IsHostVisible {
        get => this.get_IsHostVisible()
    }

    /**
     * Gets the context identifier for the view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.xamlroot.uicontext
     * @type {UIContext} 
     */
    UIContext {
        get => this.get_UIContext()
    }

    /**
     * Occurs when a property of XamlRoot has changed.
     * @type {TypedEventHandler<XamlRoot, XamlRootChangedEventArgs>}
    */
    OnChanged {
        get {
            if(!this.HasProp("__OnChanged")){
                this.__OnChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b86311bb-2eef-5b2c-8d0d-c178f3979b6a}"),
                    XamlRoot,
                    XamlRootChangedEventArgs
                )
                this.__OnChangedToken := this.add_Changed(this.__OnChanged.iface)
            }
            return this.__OnChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnChangedToken")) {
            this.remove_Changed(this.__OnChangedToken)
            this.__OnChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Content() {
        if (!this.HasProp("__IXamlRoot")) {
            if ((queryResult := this.QueryInterface(IXamlRoot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlRoot := IXamlRoot(outPtr)
        }

        return this.__IXamlRoot.get_Content()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_Size() {
        if (!this.HasProp("__IXamlRoot")) {
            if ((queryResult := this.QueryInterface(IXamlRoot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlRoot := IXamlRoot(outPtr)
        }

        return this.__IXamlRoot.get_Size()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RasterizationScale() {
        if (!this.HasProp("__IXamlRoot")) {
            if ((queryResult := this.QueryInterface(IXamlRoot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlRoot := IXamlRoot(outPtr)
        }

        return this.__IXamlRoot.get_RasterizationScale()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHostVisible() {
        if (!this.HasProp("__IXamlRoot")) {
            if ((queryResult := this.QueryInterface(IXamlRoot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlRoot := IXamlRoot(outPtr)
        }

        return this.__IXamlRoot.get_IsHostVisible()
    }

    /**
     * 
     * @returns {UIContext} 
     */
    get_UIContext() {
        if (!this.HasProp("__IXamlRoot")) {
            if ((queryResult := this.QueryInterface(IXamlRoot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlRoot := IXamlRoot(outPtr)
        }

        return this.__IXamlRoot.get_UIContext()
    }

    /**
     * 
     * @param {TypedEventHandler<XamlRoot, XamlRootChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Changed(handler) {
        if (!this.HasProp("__IXamlRoot")) {
            if ((queryResult := this.QueryInterface(IXamlRoot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlRoot := IXamlRoot(outPtr)
        }

        return this.__IXamlRoot.add_Changed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Changed(token) {
        if (!this.HasProp("__IXamlRoot")) {
            if ((queryResult := this.QueryInterface(IXamlRoot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlRoot := IXamlRoot(outPtr)
        }

        return this.__IXamlRoot.remove_Changed(token)
    }

;@endregion Instance Methods
}
