#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Identifies the type of module information that will be written to the minidump file by the MiniDumpWriteDump function.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ne-minidumpapiset-module_write_flags
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MODULE_WRITE_FLAGS extends Win32Enum{

    /**
     * Only module information will be written to the minidump file.
     * @type {Integer (Int32)}
     */
    static ModuleWriteModule => 1

    /**
     * Module and data segment information will be written to the minidump file. This value will only be set if the <b>MiniDumpWithDataSegs</b> enumeration value from <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ne-minidumpapiset-minidump_type">MINIDUMP_TYPE</a> is set.
     * @type {Integer (Int32)}
     */
    static ModuleWriteDataSeg => 2

    /**
     * Module, data segment, and miscellaneous record information will be written to the minidump file.
     * @type {Integer (Int32)}
     */
    static ModuleWriteMiscRecord => 4

    /**
     * CodeView information will be written to the minidump file. Some debuggers need the CodeView information to properly locate symbols.
     * @type {Integer (Int32)}
     */
    static ModuleWriteCvRecord => 8

    /**
     * Indicates that a module was referenced by a pointer on the stack or backing store of a thread in the minidump. This value is valid only if the <i>DumpType</i> parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/nf-minidumpapiset-minidumpwritedump">MiniDumpWriteDump</a> function includes <b>MiniDumpScanMemory</b>.
     * @type {Integer (Int32)}
     */
    static ModuleReferencedByMemory => 16

    /**
     * Per-module automatic TLS data is written to the minidump file. (Note that automatic TLS data is created using <b>__declspec(thread)</b> while <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-tlsalloc">TlsAlloc</a> creates dynamic TLS data). This value is valid only if the <i>DumpType</i> parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/nf-minidumpapiset-minidumpwritedump">MiniDumpWriteDump</a> function includes <b>MiniDumpWithProcessThreadData</b>.
     * 
     * <b>DbgHelp 6.1 and earlier:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static ModuleWriteTlsData => 32

    /**
     * Code segment information will be written to the minidump file. This value will only be set if the <b>MiniDumpWithCodeSegs</b> enumeration value from <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ne-minidumpapiset-minidump_type">MINIDUMP_TYPE</a> is set.
     * 
     * <b>DbgHelp 6.1 and earlier:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static ModuleWriteCodeSegs => 64
}
