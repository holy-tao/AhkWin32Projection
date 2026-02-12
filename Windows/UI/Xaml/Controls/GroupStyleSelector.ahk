#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGroupStyleSelector.ahk
#Include .\IGroupStyleSelectorOverrides.ahk
#Include .\IGroupStyleSelectorFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Enables custom group style selection logic as a function of the parent group and its level.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.groupstyleselector
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class GroupStyleSelector extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGroupStyleSelector

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGroupStyleSelector.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {GroupStyleSelector} 
     */
    static CreateInstance() {
        if (!GroupStyleSelector.HasProp("__IGroupStyleSelectorFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.GroupStyleSelector")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGroupStyleSelectorFactory.IID)
            GroupStyleSelector.__IGroupStyleSelectorFactory := IGroupStyleSelectorFactory(factoryPtr)
        }

        return GroupStyleSelector.__IGroupStyleSelectorFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns a specific [GroupStyle](groupstyle.md) for a given group and level.
     * @remarks
     * To provide a specific group style in a derived class, override the [SelectGroupStyleCore](groupstyleselector_selectgroupstylecore_1139726630.md) method.
     * 
     * > **Windows 8**
     * > In Windows 8, you can pass **null** as the *group* parameter value. In Windows 8.1, passing **null** causes an error.
     * @param {IInspectable} group The group to return a [GroupStyle](groupstyle.md) for.
     * @param {Integer} level The level of nesting for the specified group.
     * @returns {GroupStyle} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.groupstyleselector.selectgroupstyle
     */
    SelectGroupStyle(group, level) {
        if (!this.HasProp("__IGroupStyleSelector")) {
            if ((queryResult := this.QueryInterface(IGroupStyleSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGroupStyleSelector := IGroupStyleSelector(outPtr)
        }

        return this.__IGroupStyleSelector.SelectGroupStyle(group, level)
    }

    /**
     * When implemented by a derived class, returns a specific [GroupStyle](groupstyle.md) for a given group and level.
     * @remarks
     * > **Windows 8**
     * > In Windows 8, you can pass **null** as the *group* parameter value. In Windows 8.1, passing **null** causes an error.
     * @param {IInspectable} group The group to return a [GroupStyle](groupstyle.md) for.
     * @param {Integer} level The level of nesting for the specified group.
     * @returns {GroupStyle} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.groupstyleselector.selectgroupstylecore
     */
    SelectGroupStyleCore(group, level) {
        if (!this.HasProp("__IGroupStyleSelectorOverrides")) {
            if ((queryResult := this.QueryInterface(IGroupStyleSelectorOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGroupStyleSelectorOverrides := IGroupStyleSelectorOverrides(outPtr)
        }

        return this.__IGroupStyleSelectorOverrides.SelectGroupStyleCore(group, level)
    }

;@endregion Instance Methods
}
