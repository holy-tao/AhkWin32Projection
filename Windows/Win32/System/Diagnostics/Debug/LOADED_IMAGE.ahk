#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\Kernel\LIST_ENTRY.ahk

/**
 * Contains information about the loaded image.
 * @remarks
 * The <b>LIST_ENTRY</b> structure is defined as follows:
  * 
  * 
  * ```cpp
  * typedef struct _LIST_ENTRY {
  *    struct _LIST_ENTRY *Flink;
  *    struct _LIST_ENTRY *Blink;
  * } LIST_ENTRY, *PLIST_ENTRY, *RESTRICTED_POINTER PRLIST_ENTRY;
  * ```
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-loaded_image
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class LOADED_IMAGE extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * The file name of the mapped file.
     * @type {Pointer<Byte>}
     */
    ModuleName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A handle to the mapped file.
     * @type {Pointer<Void>}
     */
    hFile {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The base address of the mapped file.
     * @type {Pointer<Byte>}
     */
    MappedAddress {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to an 
     * <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-image_nt_headers32">IMAGE_NT_HEADERS</a> structure.
     * @type {Pointer<IMAGE_NT_HEADERS64>}
     */
    FileHeader {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-image_section_header">IMAGE_SECTION_HEADER</a> structure.
     * @type {Pointer<IMAGE_SECTION_HEADER>}
     */
    LastRvaSection {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The number of COFF section headers.
     * @type {Integer}
     */
    NumberOfSections {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-image_section_header">IMAGE_SECTION_HEADER</a> structure.
     * @type {Pointer<IMAGE_SECTION_HEADER>}
     */
    Sections {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * 
     * @type {Integer}
     */
    Characteristics {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * If the image is a kernel mode executable image, this value is <b>TRUE</b>.
     * @type {Integer}
     */
    fSystemImage {
        get => NumGet(this, 60, "char")
        set => NumPut("char", value, this, 60)
    }

    /**
     * If the image is a 16-bit executable image, this value is <b>TRUE</b>.
     * @type {Integer}
     */
    fDOSImage {
        get => NumGet(this, 61, "char")
        set => NumPut("char", value, this, 61)
    }

    /**
     * If the image is read-only, this value is <b>TRUE</b>.
     * 
     * <b>Prior to Windows Vista:  </b>This member is not included in the structure.
     * @type {Integer}
     */
    fReadOnly {
        get => NumGet(this, 62, "char")
        set => NumPut("char", value, this, 62)
    }

    /**
     * The version string.
     * 
     * <b>Prior to Windows Vista:  </b>This member is not included in the structure.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 63, "char")
        set => NumPut("char", value, this, 63)
    }

    /**
     * The list of loaded images.
     * @type {LIST_ENTRY}
     */
    Links{
        get {
            if(!this.HasProp("__Links"))
                this.__Links := LIST_ENTRY(this.ptr + 64)
            return this.__Links
        }
    }

    /**
     * The size of the image, in bytes.
     * @type {Integer}
     */
    SizeOfImage {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }
}
