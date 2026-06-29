#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGE_FILE_HEADER.ahk" { IMAGE_FILE_HEADER }
#Import ".\IMAGE_DLL_CHARACTERISTICS.ahk" { IMAGE_DLL_CHARACTERISTICS }
#Import ".\IMAGE_FILE_CHARACTERISTICS.ahk" { IMAGE_FILE_CHARACTERISTICS }
#Import ".\IMAGE_OPTIONAL_HEADER_MAGIC.ahk" { IMAGE_OPTIONAL_HEADER_MAGIC }
#Import ".\IMAGE_DATA_DIRECTORY.ahk" { IMAGE_DATA_DIRECTORY }
#Import ".\IMAGE_OPTIONAL_HEADER64.ahk" { IMAGE_OPTIONAL_HEADER64 }
#Import "..\..\SystemInformation\IMAGE_FILE_MACHINE.ahk" { IMAGE_FILE_MACHINE }
#Import ".\IMAGE_SUBSYSTEM.ahk" { IMAGE_SUBSYSTEM }

/**
 * Represents the PE header format. (64 bit)
 * @remarks
 * The actual structure in WinNT.h is named <b>IMAGE_NT_HEADERS32</b> and <b>IMAGE_NT_HEADERS</b> is defined as <b>IMAGE_NT_HEADERS32</b>. However, if _WIN64 is defined,  then <b>IMAGE_NT_HEADERS</b> is defined as <b>IMAGE_NT_HEADERS64</b>.
 * 
 * 
 * ```cpp
 * typedef struct _IMAGE_NT_HEADERS64 {
 *     DWORD Signature;
 *     IMAGE_FILE_HEADER FileHeader;
 *     IMAGE_OPTIONAL_HEADER64 OptionalHeader;
 * } IMAGE_NT_HEADERS64, *PIMAGE_NT_HEADERS64;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-image_nt_headers64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGE_NT_HEADERS64 {
    #StructPack 8

    /**
     * A 4-byte signature identifying the file as a PE image. The bytes are "PE\0\0".
     */
    Signature : UInt32

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-image_file_header">IMAGE_FILE_HEADER</a> structure that specifies the file header.
     */
    FileHeader : IMAGE_FILE_HEADER

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-image_optional_header32">IMAGE_OPTIONAL_HEADER</a> structure that specifies the optional file header.
     */
    OptionalHeader : IMAGE_OPTIONAL_HEADER64

}
