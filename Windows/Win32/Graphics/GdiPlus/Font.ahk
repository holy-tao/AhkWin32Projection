#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a Font Control, which is a specialized container of individual controls dedicated to font manipulation.
 * @remarks
 * Optional.
 * 
 * May occur at most once for each [**ControlGroup**](windowsribbon-element-controlgroup.md), [**Group**](windowsribbon-element-group.md), or [**MenuGroup**](windowsribbon-element-menugroup.md) element.
 * 
 * Any **FontControl** Command attributes declared in markup, such as [**Command.LabelTitle**](windowsribbon-element-command-labeltitle.md) or [**Command.TooltipTitle**](windowsribbon-element-command-tooltiptitle.md), are overridden by the attributes of the individual controls that comprise the **FontControl**.
 * 
 * Any attempt to select a color swatch from the color picker of a [Font Control](windowsribbon-controls-fontcontrol.md) may result in an access violation if no Command handler is associated with the control.
 * @see https://learn.microsoft.com/windows/win32/windowsribbon/windowsribbon-element-fontcontrol
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Font extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
