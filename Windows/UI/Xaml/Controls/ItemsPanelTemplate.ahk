#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\FrameworkTemplate.ahk
#Include .\IItemsPanelTemplate.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Specifies the panel that the [ItemsPresenter](itemspresenter.md) creates for the layout of the items of an [ItemsControl](itemscontrol.md).
 * @remarks
 * An ItemsPanelTemplate object element should contain exactly one [FrameworkElement](../windows.ui.xaml/frameworkelement.md)-derived class that serves as the root element for items. In most cases this is a [Panel](panel.md)-derived class. The expanded template serves as the parent for the realized items and there generally is more than one item. Therefore the XAML content property of the intended root element of an ItemsPanelTemplate should support a collection, as [Panel.Children](panel_children.md) does.
 * 
 * > [!IMPORTANT]
 * > The root element of the template declared for the ItemsPanelTemplate in the [GroupStyle.Panel](groupstyle_panel.md) property cannot be a virtualizing panel. Virtualizing panels are defined as any type that derives from [VirtualizingPanel](virtualizingpanel.md), for example the [VirtualizingStackPanel](virtualizingstackpanel.md) class.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemspaneltemplate
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ItemsPanelTemplate extends FrameworkTemplate {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IItemsPanelTemplate

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IItemsPanelTemplate.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ItemsPanelTemplate](itemspaneltemplate.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsPanelTemplate")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
