#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents information about call targets for Control Flow Guard (CFG).
 * @see https://learn.microsoft.com/windows/win32/Memory/-cfg-call-target-info
 * @namespace Windows.Win32.System.Memory
 */
export default struct CFG_CALL_TARGET_INFO {
    #StructPack 8

    /**
     * Offset relative to a provided (start) virtual address. This offset should be 16 byte aligned.
     */
    Offset : IntPtr

    /**
     * Flags describing the operation to be performed on the address. If **CFG\_CALL\_TARGET\_VALID** is set, then the address will be marked valid for CFG. Otherwise, it will be marked an invalid call target.
     */
    Flags : IntPtr

}
