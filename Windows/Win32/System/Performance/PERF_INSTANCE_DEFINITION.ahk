#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes an instance of a performance object.
 * @remarks
 * The object contains instances if the <b>NumInstances</b>  member of <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_object_type">PERF_OBJECT_TYPE</a> is greater than zero. Use the <b>DefinitionLength</b> member of <b>PERF_OBJECT_TYPE</b> to find the first instance of the object. For details, see <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/performance-data-format">Performance Data Format</a>.
 * 
 * Consumers should use the parent instance name, if specified, to create a full instance name that is used for display. The convention is to form the name as parent/child.
 * 
 * Providers should use unique instance names. If you do not, it makes it difficult for consumers to calculate and display performance values because they cannot tell if the current instance refers to the same instance that was queried previously (instances can come and go). 
 * 
 * Providers must allocate enough space for the instance name to ensure that <b>ByteLength</b> is aligned to an 8-byte boundary.
 * @see https://learn.microsoft.com/windows/win32/api/winperf/ns-winperf-perf_instance_definition
 * @namespace Windows.Win32.System.Performance
 */
export default struct PERF_INSTANCE_DEFINITION {
    #StructPack 4

    /**
     * Size of this structure, including the instance name that follows, in bytes. This value must be an 8-byte multiple.
     */
    ByteLength : UInt32

    /**
     * Index of the name of the parent object in the title database. For example, if the object is a thread, the parent object is a process, or if the object is a logical drive, the parent is a physical drive.
     */
    ParentObjectTitleIndex : UInt32

    /**
     * Position of the instance within the parent object that is associated with this instance. The position is zero-based.
     */
    ParentObjectInstance : UInt32

    /**
     * A unique identifier that you can use to identify the instance instead of
     *                                         using the name to identify
     *                                         the instance. If you do not use unique identifiers to distinguish the counter instances, set this member to PERF_NO_UNIQUE_ID.
     */
    UniqueID : Int32

    /**
     * Offset from the beginning of this structure to the Unicode name of this instance.
     */
    NameOffset : UInt32

    /**
     * Length of the instance name, including the null-terminator, in bytes. This member is zero if the instance does not have a name. 
     * 
     * Do not include in the length any padding that you added to the instance name to ensure that <b>ByteLength</b> is aligned to an 8-byte boundary.
     */
    NameLength : UInt32

}
