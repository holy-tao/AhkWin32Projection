#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WOW64_CONTEXT_FLAGS.ahk" { WOW64_CONTEXT_FLAGS }
#Import ".\WOW64_FLOATING_SAVE_AREA.ahk" { WOW64_FLOATING_SAVE_AREA }

/**
 * Represents a context frame on WOW64.
 * @remarks
 * In the following versions of Windows, Slot 1 of Thread Local Storage (TLS) holds a pointer to a structure that contains a <b>WOW64_CONTEXT</b> structure starting at offset 4. This might change in later versions of Windows.
 * 
 * <table>
 * <tr>
 * <td>Windows Vista</td>
 * <td>Windows Server 2008</td>
 * </tr>
 * <tr>
 * <td>Windows 7</td>
 * <td>Windows Server 2008 R2</td>
 * </tr>
 * <tr>
 * <td>Windows 8</td>
 * <td>Windows Server 2012</td>
 * </tr>
 * <tr>
 * <td>Windows 8.1</td>
 * <td>Windows Server 2012 R2</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-wow64_context
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct WOW64_CONTEXT {
    #StructPack 4

    ContextFlags : WOW64_CONTEXT_FLAGS

    Dr0 : UInt32

    Dr1 : UInt32

    Dr2 : UInt32

    Dr3 : UInt32

    Dr6 : UInt32

    Dr7 : UInt32

    FloatSave : WOW64_FLOATING_SAVE_AREA

    SegGs : UInt32

    SegFs : UInt32

    SegEs : UInt32

    SegDs : UInt32

    Edi : UInt32

    Esi : UInt32

    Ebx : UInt32

    Edx : UInt32

    Ecx : UInt32

    Eax : UInt32

    Ebp : UInt32

    Eip : UInt32

    SegCs : UInt32

    EFlags : UInt32

    Esp : UInt32

    SegSs : UInt32

    ExtendedRegisters : Int8[512]

}
