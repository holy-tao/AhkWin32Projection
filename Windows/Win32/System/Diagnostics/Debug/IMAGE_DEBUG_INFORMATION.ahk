#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\Kernel\LIST_ENTRY.ahk

/**
 * Contains debugging information.
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
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-image_debug_information
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGE_DEBUG_INFORMATION extends Win32Struct
{
    static sizeof => 208

    static packingSize => 8

    /**
     * A linked list of <b>LIST_ENTRY</b> structures.
     * @type {LIST_ENTRY}
     */
    List{
        get {
            if(!this.HasProp("__List"))
                this.__List := LIST_ENTRY(this.ptr + 0)
            return this.__List
        }
    }

    /**
     * The size of the memory allocated for the 
     *       <b>IMAGE_DEBUG_INFORMATION</b> structure and all 
     *       debugging information, in bytes.
     * @type {Integer}
     */
    ReservedSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The base address of the image.
     * @type {Pointer<Void>}
     */
    ReservedMappedBase {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * 
     * @type {Integer}
     */
    ReservedMachine {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * 
     * @type {Integer}
     */
    ReservedCharacteristics {
        get => NumGet(this, 34, "ushort")
        set => NumPut("ushort", value, this, 34)
    }

    /**
     * The checksum of the image.
     * @type {Integer}
     */
    ReservedCheckSum {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The requested base address of the image.
     * @type {Integer}
     */
    ImageBase {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The size of the image, in bytes.
     * @type {Integer}
     */
    SizeOfImage {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The number of COFF section headers.
     * @type {Integer}
     */
    ReservedNumberOfSections {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * A pointer to the first COFF section header. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-image_section_header">IMAGE_SECTION_HEADER</a>.
     * @type {Pointer<IMAGE_SECTION_HEADER>}
     */
    ReservedSections {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * The size of the <b>ExportedNames</b> member, in bytes.
     * @type {Integer}
     */
    ReservedExportedNamesSize {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * A pointer to a series of null-terminated strings that name all the functions exported from the image.
     * @type {Pointer<Ptr>}
     */
    ReservedExportedNames {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * The number of entries contained in the <b>FunctionTableEntries</b> member.
     * @type {Integer}
     */
    ReservedNumberOfFunctionTableEntries {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * A pointer to the first function table entry. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-image_function_entry">IMAGE_FUNCTION_ENTRY</a>.
     * @type {Pointer<IMAGE_FUNCTION_ENTRY>}
     */
    ReservedFunctionTableEntries {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * The lowest function table starting address.
     * @type {Integer}
     */
    ReservedLowestFunctionStartingAddress {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * The highest function table ending address.
     * @type {Integer}
     */
    ReservedHighestFunctionEndingAddress {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * The number of entries contained in the <b>FpoTableEntries</b> member.
     * @type {Integer}
     */
    ReservedNumberOfFpoTableEntries {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * A pointer to the first FPO entry. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-fpo_data">FPO_DATA</a>.
     * @type {Pointer<FPO_DATA>}
     */
    ReservedFpoTableEntries {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * The size of the COFF symbol table, in bytes.
     * @type {Integer}
     */
    SizeOfCoffSymbols {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * A pointer to the COFF symbol table.
     * @type {Pointer<IMAGE_COFF_SYMBOLS_HEADER>}
     */
    CoffSymbols {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * The size of the CodeView symbol table, in bytes.
     * @type {Integer}
     */
    ReservedSizeOfCodeViewSymbols {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * A pointer to the beginning of the CodeView symbol table.
     * @type {Pointer<Void>}
     */
    ReservedCodeViewSymbols {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * The relative path to the image file name.
     * @type {Pointer<Ptr>}
     */
    ImageFilePath {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * The image file name.
     * @type {Pointer<Ptr>}
     */
    ImageFileName {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * The full path to the symbol file.
     * @type {Pointer<Ptr>}
     */
    ReservedDebugFilePath {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * The timestamp of the image. This represents the date and time the image was created by the linker.
     * @type {Integer}
     */
    ReservedTimeDateStamp {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * This value is <b>TRUE</b> if the image is a ROM image.
     * @type {Integer}
     */
    ReservedRomImage {
        get => NumGet(this, 180, "int")
        set => NumPut("int", value, this, 180)
    }

    /**
     * A pointer to the first debug directory. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-image_debug_directory">IMAGE_DEBUG_DIRECTORY</a>.
     * @type {Pointer<IMAGE_DEBUG_DIRECTORY>}
     */
    ReservedDebugDirectory {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * The number of entries contained in the <b>DebugDirectory</b> member.
     * @type {Integer}
     */
    ReservedNumberOfDebugDirectories {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * The original function table base address.
     * @type {Integer}
     */
    ReservedOriginalFunctionTableBaseAddress {
        get => NumGet(this, 196, "uint")
        set => NumPut("uint", value, this, 196)
    }

    /**
     * This member is reserved for use by the operating system.
     * @type {Array<UInt32>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 200, 2, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }
}
