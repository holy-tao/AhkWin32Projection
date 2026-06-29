#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PEB.ahk" { PEB }

/**
 * The Thread Environment Block (TEB structure) describes the state of a thread.
 * @remarks
 * The definition of this structure may change from one version of Windows to the next. Do not assume a maximum size for this structure. To see the members of this structure, refer to winternal.h.
 * 
 * You should not directly access this structure. To access the values of the <b>TlsSlots</b> and <b>TlsExpansionSlots</b>  members, call <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-tlsgetvalue">TlsGetValue</a>. To access the value of the <b>ReservedForOle</b> member, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetcontexttoken">CoGetContextToken</a>.
 * 
 * In the following versions of Windows, the offset of the 32-bit TEB address within the 64-bit TEB is 0. This can be used to directly access the 32-bit TEB of a WOW64 thread. This might change in later versions of Windows.
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
 * @see https://learn.microsoft.com/windows/win32/api/winternl/ns-winternl-teb
 * @namespace Windows.Win32.System.Threading
 */
export default struct TEB {
    #StructPack 8

    Reserved1 : IntPtr[12]

    ProcessEnvironmentBlock : PEB.Ptr

    Reserved2 : IntPtr[399]

    Reserved3 : Int8[1952]

    TlsSlots : IntPtr[64]

    Reserved4 : Int8[8]

    Reserved5 : IntPtr[26]

    ReservedForOle : IntPtr

    Reserved6 : IntPtr[4]

    TlsExpansionSlots : IntPtr

}
