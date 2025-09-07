#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies the type of information that will be written to the minidump file by the MiniDumpWriteDump function.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ne-minidumpapiset-minidump_type
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_TYPE{

    /**
     * `0x00000000`. Include just the information necessary to capture stack traces for all existing threads in a process.
     * @type {Integer (Int32)}
     */
    static MiniDumpNormal => 0

    /**
     * `0x00000001`. Include the data sections from all loaded modules. This results in the inclusion of global variables, which 
 *       can make the minidump file significantly larger. For per-module control, use the 
 *       <b>ModuleWriteDataSeg</b> enumeration value from 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ne-minidumpapiset-module_write_flags">MODULE_WRITE_FLAGS</a>.
     * @type {Integer (Int32)}
     */
    static MiniDumpWithDataSegs => 1

    /**
     * `0x00000002`. Include all accessible memory in the process. The raw memory data is included at the end, so that the 
 *       initial structures can be mapped directly without the raw memory information. This option can result in a very 
 *       large file.
     * @type {Integer (Int32)}
     */
    static MiniDumpWithFullMemory => 2

    /**
     * `0x00000004`. Include high-level information about the operating system handles that are active when the minidump is 
 *       made.
     * @type {Integer (Int32)}
     */
    static MiniDumpWithHandleData => 4

    /**
     * `0x00000008`. Stack and backing store memory written to the minidump file should be filtered to remove all but the 
 *       pointer values necessary to reconstruct a stack trace.
     * @type {Integer (Int32)}
     */
    static MiniDumpFilterMemory => 8

    /**
     * `0x00000010`. Stack and backing store memory should be scanned for pointer references to modules in the module list. If a 
 *       module is referenced by stack or backing store memory, the <b>ModuleWriteFlags</b> member of 
 *       the <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_callback_output">MINIDUMP_CALLBACK_OUTPUT</a> structure is 
 *       set to <b>ModuleReferencedByMemory</b>.
     * @type {Integer (Int32)}
     */
    static MiniDumpScanMemory => 16

    /**
     * `0x00000020`. Include information from the list of modules that were recently unloaded, if this information is maintained 
 *       by the operating system.
 *       
 * 
 * <b>Windows Server 2003 and Windows XP:  </b>The operating system does not maintain information for unloaded modules until 
 *         Windows Server 2003 with SP1 and Windows XP with SP2.
 * 
 * <b>DbgHelp 5.1:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static MiniDumpWithUnloadedModules => 32

    /**
     * `0x00000040`. Include pages with data referenced by locals or other stack memory. This option can increase the size of 
 *       the minidump file significantly.
 *       
 * 
 * <b>DbgHelp 5.1:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static MiniDumpWithIndirectlyReferencedMemory => 64

    /**
     * `0x00000080`. Filter module paths for information such as user names or important directories. This option may prevent 
 *       the system from locating the image file and should be used only in special situations.
 *       
 * 
 * <b>DbgHelp 5.1:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static MiniDumpFilterModulePaths => 128

    /**
     * `0x00000100`. Include complete per-process and per-thread information from the operating system.
 *       
 * 
 * <b>DbgHelp 5.1:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static MiniDumpWithProcessThreadData => 256

    /**
     * `0x00000200`. Scan the virtual address space for <b>PAGE_READWRITE</b> memory to be included.
 *       
 * 
 * <b>DbgHelp 5.1:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static MiniDumpWithPrivateReadWriteMemory => 512

    /**
     * `0x00000400`. Reduce the data that is dumped by eliminating memory regions that are not essential to meet criteria  
 *       specified for the dump. This can avoid dumping  memory that may contain data that is private to the user. 
 *       However, it is not a guarantee that no private information will be present.
 *       
 * 
 * <b>DbgHelp 6.1 and earlier:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static MiniDumpWithoutOptionalData => 1024

    /**
     * `0x00000800`. Include memory region information. For more information, see 
 *       <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory_info_list">MINIDUMP_MEMORY_INFO_LIST</a>.
 *       
 * 
 * <b>DbgHelp 6.1 and earlier:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static MiniDumpWithFullMemoryInfo => 2048

    /**
     * `0x00001000`. Include thread state information. For more information, see 
 *       <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread_info_list">MINIDUMP_THREAD_INFO_LIST</a>.
 *       
 * 
 * <b>DbgHelp 6.1 and earlier:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static MiniDumpWithThreadInfo => 4096

    /**
     * `0x00002000`. Include all code and code-related sections from loaded modules to capture executable content. For 
 *       per-module control, use the <b>ModuleWriteCodeSegs</b> enumeration value from 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ne-minidumpapiset-module_write_flags">MODULE_WRITE_FLAGS</a>.
 *       
 * 
 * <b>DbgHelp 6.1 and earlier:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static MiniDumpWithCodeSegs => 8192

    /**
     * `0x00004000`. Turns off secondary auxiliary-supported memory gathering.
     * @type {Integer (Int32)}
     */
    static MiniDumpWithoutAuxiliaryState => 16384

    /**
     * `0x00008000`. Requests that auxiliary data providers include their state in the dump image; the state data that is 
 *       included is provider dependent. This option can result in a large dump image.
     * @type {Integer (Int32)}
     */
    static MiniDumpWithFullAuxiliaryState => 32768

    /**
     * `0x00010000`. Scans the virtual address space for <b>PAGE_WRITECOPY</b> memory to be included.
 *       
 * 
 * <b>Prior to DbgHelp 6.1:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static MiniDumpWithPrivateWriteCopyMemory => 65536

    /**
     * `0x00020000`. If you specify <b>MiniDumpWithFullMemory</b>, the 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/nf-minidumpapiset-minidumpwritedump">MiniDumpWriteDump</a> function will fail if the 
 *        function cannot read the memory regions; however, if you include 
 *        <b>MiniDumpIgnoreInaccessibleMemory</b>, the 
 *        <b>MiniDumpWriteDump</b> function will ignore the memory 
 *        read failures and continue to generate the dump. Note that the inaccessible memory regions are not included in 
 *        the dump.
 * 
 * <b>Prior to DbgHelp 6.1:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static MiniDumpIgnoreInaccessibleMemory => 131072

    /**
     * `0x00040000`. Adds security token related data. This will make the "!token" extension work when 
 *       processing a user-mode dump.
 *       
 * 
 * <b>Prior to DbgHelp 6.1:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static MiniDumpWithTokenInformation => 262144

    /**
     * `0x00080000`. Adds module header related data.
 *       
 * 
 * <b>Prior to DbgHelp 6.1:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static MiniDumpWithModuleHeaders => 524288

    /**
     * `0x00100000`. Adds filter triage related data.
 *       
 * 
 * <b>Prior to DbgHelp 6.1:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static MiniDumpFilterTriage => 1048576

    /**
     * `0x00200000`. Adds AVX crash state context registers.
 * 
 * <b>Prior to DbgHelp 6.1:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static MiniDumpWithAvxXStateContext => 2097152

    /**
     * `0x00400000`. Adds Intel Processor Trace related data. 
 * 
 * <b>Prior to DbgHelp 6.1:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static MiniDumpWithIptTrace => 4194304

    /**
     * `0x00800000`. Scans inaccessible partial memory pages.
 * 
 * <b>Prior to DbgHelp 6.1:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static MiniDumpScanInaccessiblePartialPages => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static MiniDumpFilterWriteCombinedMemory => 16777216

    /**
     * `0x00ffffff`. Indicates which flags are valid.
     * @type {Integer (Int32)}
     */
    static MiniDumpValidTypeFlags => 33554431
}
