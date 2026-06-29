#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Specifies custom minidump information to be collected by the WerReportAddDump function.
 * @remarks
 * The flags specified in this structure have a direct correlation to flags passed in the   <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/nc-minidumpapiset-minidump_callback_routine">MiniDumpCallback</a> callback function (see <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/nf-minidumpapiset-minidumpwritedump">MiniDumpWriteDump</a>) when WER generates the dump file.
 * 
 * If the minidump's callback input type is <b>ThreadCallback</b> (see the <b>CallbackType</b> member of <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_callback_output">MINIDUMP_CALLBACK_INPUT</a>), the <b>ThreadWriteFlags</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_callback_output">MINIDUMP_CALLBACK_OUTPUT</a> is set to the flags specified in the <b>dwExceptionThreadFlags</b>, <b>dwExceptionThreadExFlags</b>, <b>dwOtherThreadFlags</b>, or <b>dwOtherThreadExFlags</b> members. If the callback is for the crashing thread, the <b>dwExceptionThreadFlags</b> or <b>dwExceptionThreadExFlags</b> flags are used; otherwise, the  <b>dwOtherThreadFlags</b> or <b>dwOtherThreadExFlags</b> flags are used.
 * 
 * If the callback input type is <b>ModuleCallback</b>, the  <b>ModuleWriteFlags</b> member of <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_callback_output">MINIDUMP_CALLBACK_OUTPUT</a> is set to the flags specified in the <b>dwPreferredModuleFlags</b> or <b>dwOtherModuleFlags</b> members. If the callback is for a module on the preferred modules list, the <b>dwPreferredModuleFlags</b> flags are used; otherwise, the <b>dwOtherModuleFlags</b> flags are used.
 * @see https://learn.microsoft.com/windows/win32/api/werapi/ns-werapi-wer_dump_custom_options
 * @namespace Windows.Win32.System.ErrorReporting
 */
export default struct WER_DUMP_CUSTOM_OPTIONS {
    #StructPack 4

    /**
     * The size of the structure, in bytes.
     */
    dwSize : UInt32

    dwMask : UInt32

    /**
     * The type information to include in the minidump. You can specify one or more of the <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ne-minidumpapiset-minidump_type">MINIDUMP_TYPE</a> flags. 
     * 
     * This member is valid only if <b>dwMask</b> contains WER_DUMP_MASK_DUMPTYPE.
     */
    dwDumpFlags : UInt32

    /**
     * If this member is <b>TRUE</b> and <b>dwMask</b> contains WER_DUMP_MASK_ONLY_THISTHREAD, the minidump is to be collected only for the calling thread.
     */
    bOnlyThisThread : BOOL

    /**
     * The type of thread information to include in the minidump. You can specify one or more of the <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ne-minidumpapiset-thread_write_flags">THREAD_WRITE_FLAGS</a> flags.
     * 
     * This member is valid only if <b>dwMask</b> contains WER_DUMP_MASK_THREADFLAGS.
     */
    dwExceptionThreadFlags : UInt32

    /**
     * The type of thread information to include in the minidump. You can specify one or more of the <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ne-minidumpapiset-thread_write_flags">THREAD_WRITE_FLAGS</a> flags.
     * 
     * This member is valid only if <b>dwMask</b> contains WER_DUMP_MASK_OTHERTHREADFLAGS.
     */
    dwOtherThreadFlags : UInt32

    /**
     * The type of thread information to include in the minidump. You can specify one or more of the <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ne-minidumpapiset-thread_write_flags">THREAD_WRITE_FLAGS</a> flags.
     * 
     * This member is valid only if <b>dwMask</b> contains WER_DUMP_MASK_THREADFLAGS_EX.
     */
    dwExceptionThreadExFlags : UInt32

    /**
     * The type of thread information to include in the minidump. You can specify one or more of the <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ne-minidumpapiset-thread_write_flags">THREAD_WRITE_FLAGS</a> flags.
     * 
     * This member is valid only if <b>dwMask</b> contains WER_DUMP_MASK_OTHERTHREADFLAGS_EX.
     */
    dwOtherThreadExFlags : UInt32

    /**
     * The type of module information to include in the minidump for modules specified in the <b>wzPreferredModuleList</b> member. You can specify one or more of the <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ne-minidumpapiset-module_write_flags">MODULE_WRITE_FLAGS</a> flags.
     * 
     * This member is valid only if <b>dwMask</b> contains WER_DUMP_MASK_PREFERRED_MODULESFLAGS.
     */
    dwPreferredModuleFlags : UInt32

    /**
     * The type of module information to include in the minidump. You can specify one or more of the <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ne-minidumpapiset-module_write_flags">MODULE_WRITE_FLAGS</a> flags.
     * 
     * This member is valid only if <b>dwMask</b> contains WER_DUMP_MASK_OTHER_MODULESFLAGS.
     */
    dwOtherModuleFlags : UInt32

    /**
     * A list of module names (do not include the path) to which the <b>dwPreferredModuleFlags</b> flags apply. Each name must be null-terminated, and the list must be terminated with two null characters (for example, module1.dll\0module2.dll\0\0).
     * 
     * To specify that all modules are preferred, set this member to "*\0\0". If you include * in a list with other module names, the * is ignored. 
     * 
     * This member is valid only if <b>dwMask</b> contains WER_DUMP_MASK_PREFERRED_MODULE_LIST.
     */
    wzPreferredModuleList : WCHAR[256]

}
