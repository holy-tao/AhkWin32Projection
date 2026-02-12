#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\ContentControl.ahk
#Include .\IPivotHeaderItem.ahk
#Include .\IPivotHeaderItemFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a header item in the specialized pivot header items control.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.pivotheaderitem
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class PivotHeaderItem extends ContentControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPivotHeaderItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPivotHeaderItem.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {PivotHeaderItem} 
     */
    static CreateInstance() {
        if (!PivotHeaderItem.HasProp("__IPivotHeaderItemFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.PivotHeaderItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPivotHeaderItemFactory.IID)
            PivotHeaderItem.__IPivotHeaderItemFactory := IPivotHeaderItemFactory(factoryPtr)
        }

        return PivotHeaderItem.__IPivotHeaderItemFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
