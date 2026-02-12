#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ItemsControl.ahk
#Include .\ICommandBarOverflowPresenter.ahk
#Include .\ICommandBarOverflowPresenterFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Displays the overflow content of a [CommandBar](commandbar.md).
 * @remarks
 * You don't typically declare object elements for CommandBarOverflowPresenter in XAML. There are no properties that a CommandBarOverflowPresenter can set in XAML syntax and there's no reason to declare a CommandBarOverflowPresenter as a resource.
 * 
 * The main purpose of the CommandBarOverflowPresenter class is to be the default internal presenter for the [SecondaryCommands](commandbar_secondarycommands.md) value of a [CommandBar](commandbar.md). You extend presentation behavior of the CommandBarOverflowPresenter by setting a value for the [CommandBarOverflowPresenterStyle](commandbar_commandbaroverflowpresenterstyle.md) property of the [CommandBar](commandbar.md). The [Style](../windows.ui.xaml/style.md) you declare that fills the [CommandBarOverflowPresenterStyle](commandbar_commandbaroverflowpresenterstyle.md) property must specify `TargetType="CommandBarOverflowPresenter"`. The properties that can be styled are the dependency properties of the base [ItemsControl](itemscontrol.md) class or [Control](control.md) class, such as [FontSize](control_fontsize.md) or [Padding](control_padding.md), or base element properties such as [FrameworkElement.Margin](../windows.ui.xaml/frameworkelement_margin.md) that the CommandBarOverflowPresenter class inherits.
 * 
 * CommandBarOverflowPresenter exists as a class and has a default constructor basically to satisfy XAML infrastructure support, when it's specified as the [TargetType](../windows.ui.xaml/style_targettype.md) of the [Style](../windows.ui.xaml/style.md) used for a [CommandBarOverflowPresenterStyle](commandbar_commandbaroverflowpresenterstyle.md) value.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.commandbaroverflowpresenter
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class CommandBarOverflowPresenter extends ItemsControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICommandBarOverflowPresenter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICommandBarOverflowPresenter.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {CommandBarOverflowPresenter} 
     */
    static CreateInstance() {
        if (!CommandBarOverflowPresenter.HasProp("__ICommandBarOverflowPresenterFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CommandBarOverflowPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICommandBarOverflowPresenterFactory.IID)
            CommandBarOverflowPresenter.__ICommandBarOverflowPresenterFactory := ICommandBarOverflowPresenterFactory(factoryPtr)
        }

        return CommandBarOverflowPresenter.__ICommandBarOverflowPresenterFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
