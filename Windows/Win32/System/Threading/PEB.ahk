#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RTL_USER_PROCESS_PARAMETERS.ahk" { RTL_USER_PROCESS_PARAMETERS }
#Import ".\PEB_LDR_DATA.ahk" { PEB_LDR_DATA }

/**
 * Contains process information.
 * @remarks
 * The syntax for this structure on 64-bit Windows is as follows:
 * 
 * 
 * ``` syntax
 * typedef struct _PEB {
 *     BYTE Reserved1[2];
 *     BYTE BeingDebugged;
 *     BYTE Reserved2[21];
 *     PPEB_LDR_DATA LoaderData;
 *     PRTL_USER_PROCESS_PARAMETERS ProcessParameters;
 *     BYTE Reserved3[520];
 *     PPS_POST_PROCESS_INIT_ROUTINE PostProcessInitRoutine;
 *     BYTE Reserved4[136];
 *     ULONG SessionId;
 * } PEB;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/winternl/ns-winternl-peb
 * @namespace Windows.Win32.System.Threading
 */
export default struct PEB {
    #StructPack 8

    /**
     * Reserved for internal use by the operating system.
     */
    Reserved1 : Int8[2]

    /**
     * Indicates whether the specified process is currently being debugged. The <b>PEB</b> structure, however, is an internal operating-system structure whose layout may change in the future. It is best to use the <a href="https://docs.microsoft.com/windows/desktop/api/debugapi/nf-debugapi-checkremotedebuggerpresent">CheckRemoteDebuggerPresent</a> function instead.
     */
    BeingDebugged : Int8

    /**
     * Reserved for internal use by the operating system.
     */
    Reserved2 : Int8[1]

    /**
     * Reserved for internal use by the operating system.
     */
    Reserved3 : IntPtr[2]

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winternl/ns-winternl-peb_ldr_data">PEB_LDR_DATA</a> structure that contains information about the loaded modules for the process.
     */
    Ldr : PEB_LDR_DATA.Ptr

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winternl/ns-winternl-rtl_user_process_parameters">RTL_USER_PROCESS_PARAMETERS</a> structure that contains process parameter information such as the command line.
     */
    ProcessParameters : RTL_USER_PROCESS_PARAMETERS.Ptr

    /**
     * Reserved for internal use by the operating system.
     */
    Reserved4 : IntPtr[3]

    AtlThunkSListPtr : IntPtr

    /**
     * Reserved for internal use by the operating system.
     */
    Reserved5 : IntPtr

    /**
     * Reserved for internal use by the operating system.
     */
    Reserved6 : UInt32

    /**
     * Reserved for internal use by the operating system.
     */
    Reserved7 : IntPtr

    Reserved8 : UInt32

    AtlThunkSListPtr32 : UInt32

    Reserved9 : IntPtr[45]

    Reserved10 : Int8[96]

    /**
     * Not supported.
     */
    PostProcessInitRoutine : IntPtr

    Reserved11 : Int8[128]

    Reserved12 : IntPtr[1]

    /**
     * The Terminal Services session identifier associated with the current process.
     */
    SessionId : UInt32

}
