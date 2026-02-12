#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the visual feedback used to indicate the UI element with focus when navigating with a keyboard or gamepad.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.focusvisualkind
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class FocusVisualKind extends Win32Enum{

    /**
     * A dotted line rectangle. Also known as "marching ants". 
     * 
     * The default on Windows 10 November Update (Windows 10 version 1511 - build number 10.0.10586, codenamed "Threshold 2") and earlier.
     * @type {Integer (Int32)}
     */
    static DottedLine => 0

    /**
     * A solid line rectangle composed of an inner and outer rectangle of contrasting colors.
     * 
     * The default on Windows 10 Anniversary Update (Windows 10 version 1607 - build number 10.0.14393, codenamed "Redstone 1") and earlier. 
     * 
     * DottedLine visual is difficult to see in 10-foot experience.
     * @type {Integer (Int32)}
     */
    static HighVisibility => 1

    /**
     * A solid line rectangle, surrounded by a glowing light effect to simulate depth. 
     * 
     * Opt-in feature for Xbox with Windows 10 version 1803 (codenamed "Redstone 4") and later.
     * @type {Integer (Int32)}
     */
    static Reveal => 2
}
