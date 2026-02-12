#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContentControl.ahk
#Include .\IGroupItem.ahk
#Include .\IGroupItemFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the root element for a subtree that is created for a group.
 * @remarks
 * GroupItem can technically be used as an object element in XAML. However, the more common XAML usage that involves GroupItem indirectly is when declaring a [ContainerStyle](groupstyle_containerstyle.md). In this case, the "GroupItem" type is specified as the [TargetType](controltemplate_targettype.md) for the style/template.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.groupitem
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class GroupItem extends ContentControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGroupItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGroupItem.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {GroupItem} 
     */
    static CreateInstance() {
        if (!GroupItem.HasProp("__IGroupItemFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.GroupItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGroupItemFactory.IID)
            GroupItem.__IGroupItemFactory := IGroupItemFactory(factoryPtr)
        }

        return GroupItem.__IGroupItemFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
