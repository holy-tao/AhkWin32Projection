#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Holds the MEMORY_BASIC_INFORMATION returned by PssWalkSnapshot for a virtual address (VA) region.
 * @remarks
 * 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalksnapshot">PssWalkSnapshot</a> returns a <b>PSS_VA_SPACE_ENTRY</b> structure when the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_walk_information_class">PSS_WALK_INFORMATION_CLASS</a> member that the caller provides it is <b>PSS_WALK_VA_SPACE</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//processsnapshot/ns-processsnapshot-pss_va_space_entry
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 * @version v4.0.30319
 */
class PSS_VA_SPACE_ENTRY extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Information about the VA region. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-memory_basic_information">MEMORY_BASIC_INFORMATION</a>.
     * @type {Pointer<Void>}
     */
    BaseAddress {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Information about the VA region. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-memory_basic_information">MEMORY_BASIC_INFORMATION</a>.
     * @type {Pointer<Void>}
     */
    AllocationBase {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Information about the VA region. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-memory_basic_information">MEMORY_BASIC_INFORMATION</a>.
     * @type {Integer}
     */
    AllocationProtect {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Information about the VA region. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-memory_basic_information">MEMORY_BASIC_INFORMATION</a>.
     * @type {Pointer}
     */
    RegionSize {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Information about the VA region. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-memory_basic_information">MEMORY_BASIC_INFORMATION</a>.
     * @type {Integer}
     */
    State {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Information about the VA region. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-memory_basic_information">MEMORY_BASIC_INFORMATION</a>.
     * @type {Integer}
     */
    Protect {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Information about the VA region. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-memory_basic_information">MEMORY_BASIC_INFORMATION</a>.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * If section information was captured and the region is an executable image (<b>MEM_IMAGE</b>), this is the <b>TimeDateStamp</b> value from the Portable Executable (PE) header which describes the image. It is the low 32 bits of the number of seconds since 00:00 January 1, 1970 (a C run-time time_t value), that indicates when the file was created.
     * @type {Integer}
     */
    TimeDateStamp {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * If section information was captured and the region is an executable image (<b>MEM_IMAGE</b>), this is the <b>SizeOfImage</b> value from the Portable Executable (PE) header which describes the image. It is the size (in bytes) of the image, including all headers, as the image is loaded in memory.
     * @type {Integer}
     */
    SizeOfImage {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * If section information was captured and the region is an executable image (<b>MEM_IMAGE</b>), this is the <b>ImageBase</b> value from the Portable Executable (PE) header which describes the image. It is the  preferred address of the first byte of the image when loaded into memory.
     * @type {Pointer<Void>}
     */
    ImageBase {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * If section information was captured and the region is an executable image (<b>MEM_IMAGE</b>), this is the <b>CheckSum</b> value from the Portable Executable (PE) header which describes the image. It is the image file checksum.
     * @type {Integer}
     */
    CheckSum {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The length of the mapped file name buffer, in bytes.
     * @type {Integer}
     */
    MappedFileNameLength {
        get => NumGet(this, 68, "ushort")
        set => NumPut("ushort", value, this, 68)
    }

    /**
     * If section information was captured, this is the file path backing the section (if any). The path may be in NT namespace. The string may not be terminated by a <b>NULL</b> character. The pointer is valid for the lifetime of the walk marker passed to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalksnapshot">PssWalkSnapshot</a>.
     * @type {Pointer<Char>}
     */
    MappedFileName {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
