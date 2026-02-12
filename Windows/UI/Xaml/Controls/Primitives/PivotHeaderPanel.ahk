#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Canvas.ahk
#Include .\IPivotHeaderPanel.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Displays the header text of the items in a [Pivot](../windows.ui.xaml.controls/pivot.md) control.
 * @remarks
 * The XAML usage shown is for adjusting the XAML template for a [Pivot](../windows.ui.xaml.controls/pivot.md) control (or derived type). A PivotHeaderPanel element is the first child of a [PivotPanel](pivotpanel.md) part in the default template XAML for [Pivot](../windows.ui.xaml.controls/pivot.md). PivotHeaderPanel isn't typically used for general XAML UI composition.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.pivotheaderpanel
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class PivotHeaderPanel extends Canvas {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPivotHeaderPanel

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPivotHeaderPanel.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PivotHeaderPanel](pivotheaderpanel.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.PivotHeaderPanel")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
