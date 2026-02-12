#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\ContentControl.ahk
#Include .\ILoopingSelectorItem.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * An item that is contained in a [LoopingSelector](loopingselector.md) control.
 * @remarks
 * <!--No XAML syntax for this class. Can't be used as a XAML element because there is no public constructor. Properties of the class can be set indirectly though, because it is a Control and therefore has an implicit style via the key "primitives:LoopingSelectorItem" in generic.xaml.-->
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.loopingselectoritem
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class LoopingSelectorItem extends ContentControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILoopingSelectorItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILoopingSelectorItem.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
