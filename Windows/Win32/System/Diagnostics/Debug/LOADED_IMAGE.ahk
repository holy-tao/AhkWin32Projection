#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\IMAGE_SECTION_HEADER.ahk" { IMAGE_SECTION_HEADER }
#Import ".\IMAGE_NT_HEADERS64.ahk" { IMAGE_NT_HEADERS64 }
#Import "..\..\Kernel\LIST_ENTRY.ahk" { LIST_ENTRY }
#Import ".\IMAGE_FILE_CHARACTERISTICS2.ahk" { IMAGE_FILE_CHARACTERISTICS2 }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

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
 * @architecture X64, Arm64
 */
export default struct LOADED_IMAGE {
    #StructPack 8

    /**
     * The file name of the mapped file.
     */
    ModuleName : PSTR

    /**
     * A handle to the mapped file.
     */
    hFile : HANDLE

    /**
     * The base address of the mapped file.
     */
    MappedAddress : IntPtr

    /**
     * A pointer to an 
     * <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-image_nt_headers32">IMAGE_NT_HEADERS</a> structure.
     */
    FileHeader : IMAGE_NT_HEADERS64.Ptr

    /**
     * A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-image_section_header">IMAGE_SECTION_HEADER</a> structure.
     */
    LastRvaSection : IMAGE_SECTION_HEADER.Ptr

    /**
     * The number of COFF section headers.
     */
    NumberOfSections : UInt32

    /**
     * A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-image_section_header">IMAGE_SECTION_HEADER</a> structure.
     */
    Sections : IMAGE_SECTION_HEADER.Ptr

    Characteristics : IMAGE_FILE_CHARACTERISTICS2

    /**
     * If the image is a kernel mode executable image, this value is <b>TRUE</b>.
     */
    fSystemImage : BOOLEAN

    /**
     * If the image is a 16-bit executable image, this value is <b>TRUE</b>.
     */
    fDOSImage : BOOLEAN

    /**
     * If the image is read-only, this value is <b>TRUE</b>.
     * 
     * <b>Prior to Windows Vista:  </b>This member is not included in the structure.
     */
    fReadOnly : BOOLEAN

    /**
     * The version string.
     * 
     * <b>Prior to Windows Vista:  </b>This member is not included in the structure.
     */
    Version : Int8

    /**
     * The list of loaded images.
     */
    Links : LIST_ENTRY

    /**
     * The size of the image, in bytes.
     */
    SizeOfImage : UInt32

}
