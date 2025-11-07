#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\IMAGE_FILE_HEADER.ahk
#Include .\IMAGE_DATA_DIRECTORY.ahk
#Include .\IMAGE_OPTIONAL_HEADER64.ahk

/**
 * Represents the PE header format.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-image_nt_headers64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGE_NT_HEADERS64 extends Win32Struct
{
    static sizeof => 272

    static packingSize => 8

    /**
     * A 4-byte signature identifying the file as a PE image. The bytes are "PE\0\0".
     * @type {Integer}
     */
    Signature {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-image_file_header">IMAGE_FILE_HEADER</a> structure that specifies the file header.
     * @type {IMAGE_FILE_HEADER}
     */
    FileHeader{
        get {
            if(!this.HasProp("__FileHeader"))
                this.__FileHeader := IMAGE_FILE_HEADER(8, this)
            return this.__FileHeader
        }
    }

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-image_optional_header32">IMAGE_OPTIONAL_HEADER</a> structure that specifies the optional file header.
     * @type {IMAGE_OPTIONAL_HEADER64}
     */
    OptionalHeader{
        get {
            if(!this.HasProp("__OptionalHeader"))
                this.__OptionalHeader := IMAGE_OPTIONAL_HEADER64(32, this)
            return this.__OptionalHeader
        }
    }
}
