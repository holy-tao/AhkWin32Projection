#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\XamlUICommand.ahk
#Include .\IStandardUICommand.ahk
#Include .\IStandardUICommand2.ahk
#Include .\IStandardUICommandStatics.ahk
#Include .\IStandardUICommandFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Derives from [XamlUICommand](xamluicommand.md), adding a set of standard platform commands with pre-defined properties.
 * @remarks
 * [XamlUICommand](xamluicommand.md) implements the ICommand interface ([Windows.UI.Xaml.Input.ICommand](icommand.md) for C++ or [System.Windows.Input.ICommand](/dotnet/api/system.windows.input.icommand?view=dotnet-uwp-10.0&preserve-view=true) for C#), adding various UI properties, methods, and events.
 * 
 * The platform provides the following set of commands.
 * 
 * | Command/Label | Description | Icon | Keyboard shortcut |
 * | ------- | ---- | ----------------- | ----- |
 * | Cut | Delete the selected content and copy it to the clipboard. | :::image type="icon" source="images/segoe-fluent-icons/E8C6.png" alt-text="Cut icon." border="false":::<br>E8C6 | Ctrl + X |
 * | Copy | Copy the selected content to the clipboard. | :::image type="icon" source="images/segoe-fluent-icons/E8C8.png" alt-text="Copy icon." border="false":::<br>E8C8  |Ctrl + C |
 * | Paste | Insert the the clipboard content. | :::image type="icon" source="images/segoe-fluent-icons/E77F.png" alt-text="Paste icon." border="false":::<br>E77F | Ctrl + P |
 * | Select All | Select all content. | :::image type="icon" source="images/segoe-fluent-icons/E8B3.png" alt-text="Select all icon." border="false":::<br>E8B3 | Ctrl + A |
 * | Delete | Delete the selected content. | :::image type="icon" source="images/segoe-fluent-icons/E74D.png" alt-text="Delete icon." border="false":::<br>E74D | Delete |
 * | Share | Share the selected content. | :::image type="icon" source="images/segoe-fluent-icons/E72D.png" alt-text="Share icon." border="false":::<br>E72D | n/a |
 * | Save | Save changes.  | :::image type="icon" source="images/segoe-fluent-icons/E74E.png" alt-text="Save icon." border="false":::<br>E74E | Ctrl + S |
 * | Open | Open panel. | :::image type="icon" source="images/segoe-fluent-icons/E8A0.png" alt-text="Open panel icon." border="false":::<br>E8A0 | Ctrl + O |
 * | Close | Close panel. | :::image type="icon" source="images/segoe-fluent-icons/E89F.png" alt-text="Close panel icon." border="false":::<br>E89F | Alt + F4 |
 * | Pause | Pause currently playing media. | :::image type="icon" source="images/segoe-fluent-icons/E769.png" alt-text="Pause icon." border="false":::<br>E769 | Spacebar |
 * | Play | Play currently paused media. | :::image type="icon" source="images/segoe-fluent-icons/E768.png" alt-text="Play icon." border="false":::<br>E768 | Spacebar |
 * | Stop | Stop media. | :::image type="icon" source="images/segoe-fluent-icons/E71A.png" alt-text="Stop icon." border="false":::<br>E71A | Escape |
 * | Forward | Skip forward. | :::image type="icon" source="images/segoe-fluent-icons/E72A.png" alt-text="Forward icon." border="false":::<br>E72A | Alt + Right arrow |
 * | Back | Skip back. | :::image type="icon" source="images/segoe-fluent-icons/E72B.png" alt-text="Back icon." border="false":::<br>E72B | Alt + Left arrow |
 * | Undo | Revert the most recent action. | :::image type="icon" source="images/segoe-fluent-icons/E7A7.png" alt-text="Undo icon." border="false":::<br>E7A7 | Ctrl + Z |
 * | Redo | Repeat the most recently undone action. | :::image type="icon" source="images/segoe-fluent-icons/E7A6.png" alt-text="Redo icon." border="false":::<br>E7A6 | Ctrl + Y |
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.standarduicommand
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class StandardUICommand extends XamlUICommand {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStandardUICommand

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStandardUICommand.IID

    /**
     * Identifies the [Kind](standarduicommand_kind.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.standarduicommand.kindproperty
     * @type {DependencyProperty} 
     */
    static KindProperty {
        get => StandardUICommand.get_KindProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_KindProperty() {
        if (!StandardUICommand.HasProp("__IStandardUICommandStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.StandardUICommand")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardUICommandStatics.IID)
            StandardUICommand.__IStandardUICommandStatics := IStandardUICommandStatics(factoryPtr)
        }

        return StandardUICommand.__IStandardUICommandStatics.get_KindProperty()
    }

    /**
     * 
     * @returns {StandardUICommand} 
     */
    static CreateInstance() {
        if (!StandardUICommand.HasProp("__IStandardUICommandFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.StandardUICommand")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardUICommandFactory.IID)
            StandardUICommand.__IStandardUICommandFactory := IStandardUICommandFactory(factoryPtr)
        }

        return StandardUICommand.__IStandardUICommandFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @param {Integer} kind 
     * @returns {StandardUICommand} 
     */
    static CreateInstanceWithKind(kind) {
        if (!StandardUICommand.HasProp("__IStandardUICommandFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.StandardUICommand")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardUICommandFactory.IID)
            StandardUICommand.__IStandardUICommandFactory := IStandardUICommandFactory(factoryPtr)
        }

        return StandardUICommand.__IStandardUICommandFactory.CreateInstanceWithKind(kind, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the platform command (with pre-defined properties such as icon, keyboard accelerator, and description) that can be used with a [StandardUICommand](standarduicommand.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.standarduicommand.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
        set => this.put_Kind(value)
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
    get_Kind() {
        if (!this.HasProp("__IStandardUICommand")) {
            if ((queryResult := this.QueryInterface(IStandardUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStandardUICommand := IStandardUICommand(outPtr)
        }

        return this.__IStandardUICommand.get_Kind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Kind(value) {
        if (!this.HasProp("__IStandardUICommand2")) {
            if ((queryResult := this.QueryInterface(IStandardUICommand2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStandardUICommand2 := IStandardUICommand2(outPtr)
        }

        return this.__IStandardUICommand2.put_Kind(value)
    }

;@endregion Instance Methods
}
