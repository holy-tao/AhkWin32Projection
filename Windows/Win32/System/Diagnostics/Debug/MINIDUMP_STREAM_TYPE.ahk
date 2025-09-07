#Requires AutoHotkey v2.0.0 64-bit

/**
 * Represents the type of a minidump data stream.
 * @remarks
 * In this context, a data stream is a set of data in a minidump file.
  * 
  * The <b>StreamType</b> member of the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_directory">MINIDUMP_DIRECTORY</a> structure can be one of these types. Additional types may be added in the future, so if a program reading the minidump header encounters a stream type it does not recognize, it should ignore the stream altogether.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ne-minidumpapiset-minidump_stream_type
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_STREAM_TYPE{

    /**
     * Reserved. Do not use this enumeration value.
     * @type {Integer (Int32)}
     */
    static UnusedStream => 0

    /**
     * Reserved. Do not use this enumeration value.
     * @type {Integer (Int32)}
     */
    static ReservedStream0 => 1

    /**
     * Reserved. Do not use this enumeration value.
     * @type {Integer (Int32)}
     */
    static ReservedStream1 => 2

    /**
     * The stream contains thread information. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_thread_list">MINIDUMP_THREAD_LIST</a>.
     * @type {Integer (Int32)}
     */
    static ThreadListStream => 3

    /**
     * The stream contains module information. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_module_list">MINIDUMP_MODULE_LIST</a>.
     * @type {Integer (Int32)}
     */
    static ModuleListStream => 4

    /**
     * The stream contains memory allocation information. For more information, see 
 * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory_list">MINIDUMP_MEMORY_LIST</a>.
     * @type {Integer (Int32)}
     */
    static MemoryListStream => 5

    /**
     * The stream contains exception information. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_exception_stream">MINIDUMP_EXCEPTION_STREAM</a>.
     * @type {Integer (Int32)}
     */
    static ExceptionStream => 6

    /**
     * The stream contains general system information. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_system_info">MINIDUMP_SYSTEM_INFO</a>.
     * @type {Integer (Int32)}
     */
    static SystemInfoStream => 7

    /**
     * The stream contains extended thread information. For more information, see 
 * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread_ex_list">MINIDUMP_THREAD_EX_LIST</a>.
     * @type {Integer (Int32)}
     */
    static ThreadExListStream => 8

    /**
     * The stream contains memory allocation information. For more information, see 
 * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory64_list">MINIDUMP_MEMORY64_LIST</a>.
     * @type {Integer (Int32)}
     */
    static Memory64ListStream => 9

    /**
     * The stream contains an ANSI string used for documentation purposes.
     * @type {Integer (Int32)}
     */
    static CommentStreamA => 10

    /**
     * The stream contains a Unicode string used for documentation purposes.
     * @type {Integer (Int32)}
     */
    static CommentStreamW => 11

    /**
     * The stream contains high-level information about the active operating system handles. For more information, see 
 * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_handle_data_stream">MINIDUMP_HANDLE_DATA_STREAM</a>.
     * @type {Integer (Int32)}
     */
    static HandleDataStream => 12

    /**
     * The stream contains function table information. For more information, see 
 * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_function_table_stream">MINIDUMP_FUNCTION_TABLE_STREAM</a>.
     * @type {Integer (Int32)}
     */
    static FunctionTableStream => 13

    /**
     * The stream contains module information for the unloaded modules. For more information, see 
 * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_unloaded_module_list">MINIDUMP_UNLOADED_MODULE_LIST</a>.
 * 
 * <b>DbgHelp 5.1:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static UnloadedModuleListStream => 14

    /**
     * The stream contains miscellaneous information. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_misc_info">MINIDUMP_MISC_INFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_misc_info_2">MINIDUMP_MISC_INFO_2</a>.
 * 
 * <b>DbgHelp 5.1:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static MiscInfoStream => 15

    /**
     * The stream contains memory region description information. It corresponds to the information that would be returned for the process from the <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory_info_list">VirtualQuery</a> function. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_memory_info_list">MINIDUMP_MEMORY_INFO_LIST</a>.
 * 
 * <b>DbgHelp 6.1 and earlier:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static MemoryInfoListStream => 16

    /**
     * The stream contains thread state information. For more information, see <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread_info_list">MINIDUMP_THREAD_INFO_LIST</a>.
 * 
 * <b>DbgHelp 6.1 and earlier:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static ThreadInfoListStream => 17

    /**
     * This stream contains operation list information. For more information, see <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_handle_operation_list">MINIDUMP_HANDLE_OPERATION_LIST</a>.
 * 
 * <b>DbgHelp 6.4 and earlier:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static HandleOperationListStream => 18

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TokenStream => 19

    /**
     * 
     * @type {Integer (Int32)}
     */
    static JavaScriptDataStream => 20

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SystemMemoryInfoStream => 21

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ProcessVmCountersStream => 22

    /**
     * 
     * @type {Integer (Int32)}
     */
    static IptTraceStream => 23

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ThreadNamesStream => 24

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ceStreamNull => 32768

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ceStreamSystemInfo => 32769

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ceStreamException => 32770

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ceStreamModuleList => 32771

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ceStreamProcessList => 32772

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ceStreamThreadList => 32773

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ceStreamThreadContextList => 32774

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ceStreamThreadCallStackList => 32775

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ceStreamMemoryVirtualList => 32776

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ceStreamMemoryPhysicalList => 32777

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ceStreamBucketParameters => 32778

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ceStreamProcessModuleMap => 32779

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ceStreamDiagnosisList => 32780

    /**
     * Any value greater than this value will not be used by the system and can be used to represent application-defined data streams. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_user_stream">MINIDUMP_USER_STREAM</a>.
     * @type {Integer (Int32)}
     */
    static LastReservedStream => 65535
}
