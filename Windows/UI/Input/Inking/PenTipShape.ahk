#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the shape of the [PenTip](inkdrawingattributes_pentip.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.pentipshape
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class PenTipShape extends Win32Enum{

    /**
     * Circular or elliptical pen tip. Use [Size](inkdrawingattributes_size.md) to specify the dimensions.
     * @type {Integer (Int32)}
     */
    static Circle => 0

    /**
     * Square or rectangular pen tip. Use [Size](inkdrawingattributes_size.md) to specify the dimensions.
     * @type {Integer (Int32)}
     */
    static Rectangle => 1
}
