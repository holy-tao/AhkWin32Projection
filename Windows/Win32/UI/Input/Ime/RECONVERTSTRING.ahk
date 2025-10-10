#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines the strings for IME reconversion. It is the first item in a memory block that contains the strings for reconversion.
 * @remarks
 * 
  * The <b>dwCompStrOffset</b> and <b>dwTargetOffset</b> members are the relative positions in <b>dwStrOffset</b>. For a Unicode IME, <b>dwStrLen</b>, <b>dwCompStrLen</b>, and <b>dwTargetStrLen</b> are TCHAR values, that is, character counts. The members <b>dwStrOffset</b>, <b>dwCompStrOffset</b>, and <b>dwTargetStrOffset</b> specify byte counts.
  * 
  * If an application starts the reconversion process by calling <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immsetcompositionstringa">ImmSetCompositionString</a> with SCS_SETRECONVERTSTRING and SCS_QUERYRECONVERTSTRING, the application must allocate the necessary memory for the <b>RECONVERTSTRING</b> structure as well as the composition string buffer. IME should not use this memory later. If IME starts the process, IME should allocate necessary memory for the structure and the composition string buffer.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//imm/ns-imm-reconvertstring
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class RECONVERTSTRING extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * Size of this structure and the memory block it heads.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Version number. Must be 0.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Length of the string that contains the composition string.
     * @type {Integer}
     */
    dwStrLen {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Offset from the start position of this structure.
     * @type {Integer}
     */
    dwStrOffset {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Length of the string that will be the composition string.
     * @type {Integer}
     */
    dwCompStrLen {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Offset of the string that will be the composition string.
     * @type {Integer}
     */
    dwCompStrOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Length of the string that is related to the target clause in the composition string.
     * @type {Integer}
     */
    dwTargetStrLen {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Offset of the target string.
     * @type {Integer}
     */
    dwTargetStrOffset {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
