#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Holds the MEMORY_BASIC_INFORMATION returned by PssWalkSnapshot for a virtual address (VA) region.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalksnapshot">PssWalkSnapshot</a> returns a <b>PSS_VA_SPACE_ENTRY</b> structure when the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_walk_information_class">PSS_WALK_INFORMATION_CLASS</a> member that the caller provides it is <b>PSS_WALK_VA_SPACE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/processsnapshot/ns-processsnapshot-pss_va_space_entry
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 */
export default struct PSS_VA_SPACE_ENTRY {
    #StructPack 8

    /**
     * Information about the VA region. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-memory_basic_information">MEMORY_BASIC_INFORMATION</a>.
     */
    BaseAddress : IntPtr

    /**
     * Information about the VA region. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-memory_basic_information">MEMORY_BASIC_INFORMATION</a>.
     */
    AllocationBase : IntPtr

    /**
     * Information about the VA region. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-memory_basic_information">MEMORY_BASIC_INFORMATION</a>.
     */
    AllocationProtect : UInt32

    /**
     * Information about the VA region. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-memory_basic_information">MEMORY_BASIC_INFORMATION</a>.
     */
    RegionSize : IntPtr

    /**
     * Information about the VA region. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-memory_basic_information">MEMORY_BASIC_INFORMATION</a>.
     */
    State : UInt32

    /**
     * Information about the VA region. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-memory_basic_information">MEMORY_BASIC_INFORMATION</a>.
     */
    Protect : UInt32

    /**
     * Information about the VA region. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-memory_basic_information">MEMORY_BASIC_INFORMATION</a>.
     */
    Type : UInt32

    /**
     * If section information was captured and the region is an executable image (<b>MEM_IMAGE</b>), this is the <b>TimeDateStamp</b> value from the Portable Executable (PE) header which describes the image. It is the low 32 bits of the number of seconds since 00:00 January 1, 1970 (a C run-time time_t value), that indicates when the file was created.
     */
    TimeDateStamp : UInt32

    /**
     * If section information was captured and the region is an executable image (<b>MEM_IMAGE</b>), this is the <b>SizeOfImage</b> value from the Portable Executable (PE) header which describes the image. It is the size (in bytes) of the image, including all headers, as the image is loaded in memory.
     */
    SizeOfImage : UInt32

    /**
     * If section information was captured and the region is an executable image (<b>MEM_IMAGE</b>), this is the <b>ImageBase</b> value from the Portable Executable (PE) header which describes the image. It is the  preferred address of the first byte of the image when loaded into memory.
     */
    ImageBase : IntPtr

    /**
     * If section information was captured and the region is an executable image (<b>MEM_IMAGE</b>), this is the <b>CheckSum</b> value from the Portable Executable (PE) header which describes the image. It is the image file checksum.
     */
    CheckSum : UInt32

    /**
     * The length of the mapped file name buffer, in bytes.
     */
    MappedFileNameLength : UInt16

    /**
     * If section information was captured, this is the file path backing the section (if any). The path may be in NT namespace. The string may not be terminated by a <b>NULL</b> character. The pointer is valid for the lifetime of the walk marker passed to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalksnapshot">PssWalkSnapshot</a>.
     */
    MappedFileName : PWSTR

}
