#Requires AutoHotkey v2.0.0 64-bit

/**
 * Represents the relationship between the processor set identified in the corresponding SYSTEM_LOGICAL_PROCESSOR_INFORMATION or SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX structure.
 * @remarks
 * 
  * The value specified by this enumeration indicates the relationship represented in the corresponding [SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX](./ns-winnt-system_logical_processor_information_ex.md)  structure. 
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ne-winnt-logical_processor_relationship
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class LOGICAL_PROCESSOR_RELATIONSHIP{

    /**
     * The specified logical processors share a single processor core.
     * @type {Integer (Int32)}
     */
    static RelationProcessorCore => 0

    /**
     * The specified logical processors  are part of the same NUMA node.
     * @type {Integer (Int32)}
     */
    static RelationNumaNode => 1

    /**
     * The specified logical processors  share a cache. 
 * 
 * <b>Windows Server 2003:  </b>This value is not supported until Windows Server 2003 with SP1 and Windows XP Professional x64 Edition.
     * @type {Integer (Int32)}
     */
    static RelationCache => 2

    /**
     * The specified logical processors share a physical package (a single package socketed or soldered onto a motherboard may contain multiple processor cores or threads, each of which is treated as a separate processor by the operating system).
 * 
 * <b>Windows Server 2003:  </b>This value is not supported until Windows Server 2003 with SP1 and Windows XP Professional x64 Edition.
     * @type {Integer (Int32)}
     */
    static RelationProcessorPackage => 3

    /**
     * The specified logical processors share a single <a href="https://docs.microsoft.com/windows/desktop/ProcThread/processor-groups">processor group</a>.
 * 
 * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP Professional x64 Edition:  </b>This value is not supported until Windows Server 2008 R2.
     * @type {Integer (Int32)}
     */
    static RelationGroup => 4

    /**
     * @type {Integer (Int32)}
     */
    static RelationProcessorDie => 5

    /**
     * Introduced in TBD - Release Iron.  Requests that the full affinity be returned. Unlike the other relation types, **RelationNumaNodeEx** is not used on input. It is simply a request for **RelationNumaNode** with full group information.
     * @type {Integer (Int32)}
     */
    static RelationNumaNodeEx => 6

    /**
     * @type {Integer (Int32)}
     */
    static RelationProcessorModule => 7

    /**
     * On input, retrieves information about all possible relationship types. This value is not used on output.
 * 
 * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP Professional x64 Edition:  </b>This value is not supported  until Windows Server 2008 R2.
     * @type {Integer (Int32)}
     */
    static RelationAll => 65535
}
