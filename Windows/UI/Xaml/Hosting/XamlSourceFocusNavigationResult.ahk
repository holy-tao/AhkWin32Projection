#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IXamlSourceFocusNavigationResult.ahk
#Include .\IXamlSourceFocusNavigationResultFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for a request to navigate focus to a [DesktopWindowXamlSource](desktopwindowxamlsource.md) object by using the [NavigateFocus](desktopwindowxamlsource_navigatefocus_659659671.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.xamlsourcefocusnavigationresult
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class XamlSourceFocusNavigationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXamlSourceFocusNavigationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXamlSourceFocusNavigationResult.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [XamlSourceFocusNavigationResult](xamlsourcefocusnavigationresult.md) class.
     * @param {Boolean} focusMoved True if the focus successfully moved to the [DesktopWindowXamlSource](desktopwindowxamlsource.md) object; otherwise, false.
     * @returns {XamlSourceFocusNavigationResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.xamlsourcefocusnavigationresult.#ctor
     */
    static CreateInstance(focusMoved) {
        if (!XamlSourceFocusNavigationResult.HasProp("__IXamlSourceFocusNavigationResultFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Hosting.XamlSourceFocusNavigationResult")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlSourceFocusNavigationResultFactory.IID)
            XamlSourceFocusNavigationResult.__IXamlSourceFocusNavigationResultFactory := IXamlSourceFocusNavigationResultFactory(factoryPtr)
        }

        return XamlSourceFocusNavigationResult.__IXamlSourceFocusNavigationResultFactory.CreateInstance(focusMoved)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value that indicates whether the focus successfully moved to the [DesktopWindowXamlSource](desktopwindowxamlsource.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.xamlsourcefocusnavigationresult.wasfocusmoved
     * @type {Boolean} 
     */
    WasFocusMoved {
        get => this.get_WasFocusMoved()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_WasFocusMoved() {
        if (!this.HasProp("__IXamlSourceFocusNavigationResult")) {
            if ((queryResult := this.QueryInterface(IXamlSourceFocusNavigationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlSourceFocusNavigationResult := IXamlSourceFocusNavigationResult(outPtr)
        }

        return this.__IXamlSourceFocusNavigationResult.get_WasFocusMoved()
    }

;@endregion Instance Methods
}
