#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * See reference information about the CONSOLE_READCONSOLE_CONTROL structure, which contains information for a console read operation.
 * @see https://learn.microsoft.com/windows/console/console-readconsole-control
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class CONSOLE_READCONSOLE_CONTROL extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The size of the structure. Set this member to `sizeof(CONSOLE_READCONSOLE_CONTROL)`.
     * @type {Integer}
     */
    nLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of characters to skip (and thus preserve) before writing newly read input in the buffer passed to the [**ReadConsole**](readconsole.md) function. This value must be less than the *nNumberOfCharsToRead* parameter of the **ReadConsole** function.
     * @type {Integer}
     */
    nInitialChars {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A mask specifying which control characters between `0x00` and `0x1F` should be used to signal that the read is complete. Each bit corresponds to a character with the least significant bit corresponding to `0x00` or `NUL` and the most significant bit corresponding to `0x1F` or `US`. Multiple bits (control characters) can be specified.
     * @type {Integer}
     */
    dwCtrlWakeupMask {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The state of the control keys. This member can be one or more of the following values.
     * 
     * | Value | Meaning |
     * |-|-|
     * | **CAPSLOCK_ON** 0x0080 | The CAPS LOCK light is on. |
     * | **ENHANCED_KEY** 0x0100 | The key is enhanced. See [remarks](key-event-record-str.md#remarks). |
     * | **LEFT_ALT_PRESSED** 0x0002 | The left ALT key is pressed. |
     * | **LEFT_CTRL_PRESSED** 0x0008 | The left CTRL key is pressed. |
     * | **NUMLOCK_ON** 0x0020 | The NUM LOCK light is on. |
     * | **RIGHT_ALT_PRESSED** 0x0001 | The right ALT key is pressed. |
     * | **RIGHT_CTRL_PRESSED** 0x0004 | The right CTRL key is pressed. |
     * | **SCROLLLOCK_ON** 0x0040 | The SCROLL LOCK light is on. |
     * | **SHIFT_PRESSED** 0x0010 | The SHIFT key is pressed. |
     * @type {Integer}
     */
    dwControlKeyState {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
