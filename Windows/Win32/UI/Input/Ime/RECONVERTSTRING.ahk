#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RECONVERTSTRING structure (immdev.h) defines the strings for IME reconversion.
 * @remarks
 * The <b>dwCompStrOffset</b> and <b>dwTargetOffset</b> members are the relative positions in <b>dwStrOffset</b>. For a Unicode IME, <b>dwStrLen</b>, <b>dwCompStrLen</b>, and <b>dwTargetStrLen</b> are TCHAR values, that is, character counts. The members <b>dwStrOffset</b>, <b>dwCompStrOffset</b>, and <b>dwTargetStrOffset</b> specify byte counts.
 * 
 * If an application starts the reconversion process by calling <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immsetcompositionstringa">ImmSetCompositionString</a> with SCS_SETRECONVERTSTRING and SCS_QUERYRECONVERTSTRING, the application must allocate the necessary memory for the <b>RECONVERTSTRING</b> structure as well as the composition string buffer. IME should not use this memory later. If IME starts the process, IME should allocate necessary memory for the structure and the composition string buffer.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/ns-immdev-reconvertstring
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct RECONVERTSTRING {
    #StructPack 4

    /**
     * Size of this structure and the memory block it heads.
     */
    dwSize : UInt32

    /**
     * Version number. Must be 0.
     */
    dwVersion : UInt32

    /**
     * Length of the string that contains the composition string.
     */
    dwStrLen : UInt32

    /**
     * Offset from the start position of this structure.
     */
    dwStrOffset : UInt32

    /**
     * Length of the string that will be the composition string.
     */
    dwCompStrLen : UInt32

    /**
     * Offset of the string that will be the composition string.
     */
    dwCompStrOffset : UInt32

    /**
     * Length of the string that is related to the target clause in the composition string.
     */
    dwTargetStrLen : UInt32

    /**
     * Offset of the target string.
     */
    dwTargetStrOffset : UInt32

}
