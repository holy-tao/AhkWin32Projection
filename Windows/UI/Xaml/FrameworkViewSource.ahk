#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFrameworkViewSource.ahk
#Include ..\..\ApplicationModel\Core\IFrameworkViewSource.ahk
#Include ..\..\..\Guid.ahk

/**
 * Creates views, specifically [FrameworkView](frameworkview.md) instances. This is infrastructure and does not need to be accessed in most app scenarios.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkviewsource
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class FrameworkViewSource extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFrameworkViewSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFrameworkViewSource.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [FrameworkViewSource](frameworkviewsource.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkViewSource")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Creates a [FrameworkView](frameworkview.md).
     * @returns {IFrameworkView} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkviewsource.createview
     */
    CreateView() {
        if (!this.HasProp("__IFrameworkViewSource")) {
            if ((queryResult := this.QueryInterface(IFrameworkViewSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkViewSource := IFrameworkViewSource(outPtr)
        }

        return this.__IFrameworkViewSource.CreateView()
    }

;@endregion Instance Methods
}
