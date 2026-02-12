#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkToolbarIsStencilButtonCheckedChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [IsStencilButtonCheckedChanged](inktoolbar_isstencilbuttoncheckedchanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarisstencilbuttoncheckedchangedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class InkToolbarIsStencilButtonCheckedChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkToolbarIsStencilButtonCheckedChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkToolbarIsStencilButtonCheckedChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the button for the selected stencil.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarisstencilbuttoncheckedchangedeventargs.stencilbutton
     * @type {InkToolbarStencilButton} 
     */
    StencilButton {
        get => this.get_StencilButton()
    }

    /**
     * Gets the type of stencil.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarisstencilbuttoncheckedchangedeventargs.stencilkind
     * @type {Integer} 
     */
    StencilKind {
        get => this.get_StencilKind()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [InkToolbarIsStencilButtonCheckedChangedEventArgs](inktoolbarisstencilbuttoncheckedchangedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarIsStencilButtonCheckedChangedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {InkToolbarStencilButton} 
     */
    get_StencilButton() {
        if (!this.HasProp("__IInkToolbarIsStencilButtonCheckedChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IInkToolbarIsStencilButtonCheckedChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarIsStencilButtonCheckedChangedEventArgs := IInkToolbarIsStencilButtonCheckedChangedEventArgs(outPtr)
        }

        return this.__IInkToolbarIsStencilButtonCheckedChangedEventArgs.get_StencilButton()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StencilKind() {
        if (!this.HasProp("__IInkToolbarIsStencilButtonCheckedChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IInkToolbarIsStencilButtonCheckedChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarIsStencilButtonCheckedChangedEventArgs := IInkToolbarIsStencilButtonCheckedChangedEventArgs(outPtr)
        }

        return this.__IInkToolbarIsStencilButtonCheckedChangedEventArgs.get_StencilKind()
    }

;@endregion Instance Methods
}
