#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags that specify what PssCaptureSnapshot captures.
 * @remarks
 * 
 * If both <b>PSS_CREATE_FORCE_BREAKAWAY</b> and <b>PSS_CREATE_BREAKAWAY</b> are specified, then <b>PSS_CREATE_FORCE_BREAKAWAY</b> takes precedence.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//processsnapshot/ne-processsnapshot-pss_capture_flags
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 * @version v4.0.30319
 */
class PSS_CAPTURE_FLAGS{

    /**
     * Capture nothing.
     * @type {Integer (UInt32)}
     */
    static PSS_CAPTURE_NONE => 0

    /**
     * Capture a snapshot of all cloneable pages in the process. The clone includes all <b>MEM_PRIVATE</b> regions, as well as all sections (<b>MEM_MAPPED</b> and <b>MEM_IMAGE</b>) that are shareable. All Win32 sections created via <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createfilemappinga">CreateFileMapping</a> are shareable.
     * @type {Integer (UInt32)}
     */
    static PSS_CAPTURE_VA_CLONE => 1

    /**
     * (Do not use.)
     * @type {Integer (UInt32)}
     */
    static PSS_CAPTURE_RESERVED_00000002 => 2

    /**
     * Capture the handle table (handle values only).
     * @type {Integer (UInt32)}
     */
    static PSS_CAPTURE_HANDLES => 4

    /**
     * Capture name information for each handle.
     * @type {Integer (UInt32)}
     */
    static PSS_CAPTURE_HANDLE_NAME_INFORMATION => 8

    /**
     * Capture basic handle information such as <b>HandleCount</b>, <b>PointerCount</b>, <b>GrantedAccess</b>, etc.
     * @type {Integer (UInt32)}
     */
    static PSS_CAPTURE_HANDLE_BASIC_INFORMATION => 16

    /**
     * Capture type-specific information for supported object types: <b>Process</b>, <b>Thread</b>, <b>Event</b>, <b>Mutant</b>, <b>Section.</b>
     * @type {Integer (UInt32)}
     */
    static PSS_CAPTURE_HANDLE_TYPE_SPECIFIC_INFORMATION => 32

    /**
     * Capture the handle tracing table.
     * @type {Integer (UInt32)}
     */
    static PSS_CAPTURE_HANDLE_TRACE => 64

    /**
     * Capture thread information (IDs only).
     * @type {Integer (UInt32)}
     */
    static PSS_CAPTURE_THREADS => 128

    /**
     * Capture the context for each thread.
     * @type {Integer (UInt32)}
     */
    static PSS_CAPTURE_THREAD_CONTEXT => 256

    /**
     * Capture extended context for each thread (e.g. <b>CONTEXT_XSTATE</b>).
     * @type {Integer (UInt32)}
     */
    static PSS_CAPTURE_THREAD_CONTEXT_EXTENDED => 512

    /**
     * (Do not use.)
     * @type {Integer (UInt32)}
     */
    static PSS_CAPTURE_RESERVED_00000400 => 1024

    /**
     * Capture a snapshot of the virtual address space. The VA space is captured as an array of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-memory_basic_information">MEMORY_BASIC_INFORMATION</a> structures. This flag does not capture the contents of the pages.
     * @type {Integer (UInt32)}
     */
    static PSS_CAPTURE_VA_SPACE => 2048

    /**
     * For <b>MEM_IMAGE</b> and <b>MEM_MAPPED</b> regions, dumps the path to the file backing the sections (identical to what <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getmappedfilenamea">GetMappedFileName</a> returns). For <b>MEM_IMAGE</b> regions, also dumps:
 * 
 * <ul>
 * <li>
 * <b>IMAGE_NT_HEADERS.FileHeader.TimeDateStamp</b>
 * 
 * </li>
 * <li>
 * <b>IMAGE_NT_HEADERS.OptionalHeader.SizeOfImage</b>
 * 
 * </li>
 * <li>
 * <b>IMAGE_NT_HEADERS.OptionalHeader.ImageBase</b>
 * 
 * </li>
 * <li>
 * <b>IMAGE_NT_HEADERS.OptionalHeader.CheckSum</b>
 * 
 * </li>
 * </ul>
 * The PROCESS_VM_READ access right is required on the process handle.
 * 
 * <div class="alert"><b>Warning</b>  This option is only valid when <b>PSS_CAPTURE_VA_SPACE</b> is specified. </div>
 * <div> </div>
     * @type {Integer (UInt32)}
     */
    static PSS_CAPTURE_VA_SPACE_SECTION_INFORMATION => 4096

    /**
     * 
     * @type {Integer (UInt32)}
     */
    static PSS_CAPTURE_IPT_TRACE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static PSS_CAPTURE_RESERVED_00004000 => 16384

    /**
     * The breakaway is optional. If the clone process fails to create as a breakaway, then it is created still inside the job. This flag must be specified in combination with either <b>PSS_CREATE_FORCE_BREAKAWAY</b> and/or <b>PSS_CREATE_BREAKAWAY</b>.
     * @type {Integer (UInt32)}
     */
    static PSS_CREATE_BREAKAWAY_OPTIONAL => 67108864

    /**
     * The clone is broken away from the parent process' job. This is equivalent to <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> flag <b>CREATE_BREAKAWAY_FROM_JOB</b>.
     * @type {Integer (UInt32)}
     */
    static PSS_CREATE_BREAKAWAY => 134217728

    /**
     * The clone is forcefully broken away the parent process's job. This is only allowed for Tcb-privileged callers.
     * @type {Integer (UInt32)}
     */
    static PSS_CREATE_FORCE_BREAKAWAY => 268435456

    /**
     * The facility should not use the process heap for any persistent or transient allocations. The use of the heap may be undesirable in certain contexts such as creation of snapshots in the exception reporting path (where the heap may be corrupted).
     * @type {Integer (UInt32)}
     */
    static PSS_CREATE_USE_VM_ALLOCATIONS => 536870912

    /**
     * Measure performance of the facility. Performance counters can be retrieved via <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-pssquerysnapshot">PssQuerySnapshot</a> with the <b>PSS_QUERY_PERFORMANCE_COUNTERS</b> information class of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_query_information_class">PSS_QUERY_INFORMATION_CLASS</a>.
     * @type {Integer (UInt32)}
     */
    static PSS_CREATE_MEASURE_PERFORMANCE => 1073741824

    /**
     * The virtual address (VA) clone process does not hold a reference to the underlying image. This will cause functions such as <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-queryfullprocessimagenamea">QueryFullProcessImageName</a> to fail on the VA clone process.
 * 
 * <div class="alert"><b>Important</b>  <p class="note"> This flag has no effect unless <b>PSS_CAPTURE_VA_CLONE</b> is specified.
 * 
 * </div>
 * <div> </div>
     * @type {Integer (UInt32)}
     */
    static PSS_CREATE_RELEASE_SECTION => 2147483648
}
