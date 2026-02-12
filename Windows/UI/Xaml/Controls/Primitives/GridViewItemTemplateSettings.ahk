#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IGridViewItemTemplateSettings.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides calculated values that can be referenced as **TemplatedParent** sources when defining templates for a [GridView](../windows.ui.xaml.controls/gridview.md) control. Not intended for general use.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitemtemplatesettings
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class GridViewItemTemplateSettings extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGridViewItemTemplateSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGridViewItemTemplateSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that reports the count of items in the current drag operation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.gridviewitemtemplatesettings.dragitemscount
     * @type {Integer} 
     */
    DragItemsCount {
        get => this.get_DragItemsCount()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DragItemsCount() {
        if (!this.HasProp("__IGridViewItemTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IGridViewItemTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGridViewItemTemplateSettings := IGridViewItemTemplateSettings(outPtr)
        }

        return this.__IGridViewItemTemplateSettings.get_DragItemsCount()
    }

;@endregion Instance Methods
}
