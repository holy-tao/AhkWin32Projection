#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies which modifier key was pressed.
 * @remarks
 * 
 * In C++, explicit casting is required when trying to set more than one flag at a time. A compilation error occurs if explicit casting is not used.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/ne-msinkaut-inkshiftkeymodifierflags
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkShiftKeyModifierFlags extends Win32Enum{

    /**
     * The SHIFT key was used as a modifier.
     * @type {Integer (Int32)}
     */
    static IKM_Shift => 1

    /**
     * The CTRL key was used as a modifier.
     * @type {Integer (Int32)}
     */
    static IKM_Control => 2

    /**
     * The ALT key was used as a modifier.
     * @type {Integer (Int32)}
     */
    static IKM_Alt => 4
}
