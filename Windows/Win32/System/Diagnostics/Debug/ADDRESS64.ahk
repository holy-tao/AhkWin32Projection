#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ADDRESS_MODE.ahk" { ADDRESS_MODE }

/**
 * Represents an address. It is used in the STACKFRAME64 structure. (ADDRESS64)
 * @remarks
 * This structure supersedes the <b>ADDRESS</b> structure. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>ADDRESS</b> is defined as follows in DbgHelp.h. 
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-address64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct ADDRESS64 {
    #StructPack 8

    /**
     * The offset into the segment, or a 32-bit virtual address. The interpretation of this value depends on the value contained in the <b>Mode</b> member.
     */
    Offset : Int64

    /**
     * The segment number. This value is used only for 16-bit addressing.
     */
    Segment : UInt16

    Mode : ADDRESS_MODE

}
