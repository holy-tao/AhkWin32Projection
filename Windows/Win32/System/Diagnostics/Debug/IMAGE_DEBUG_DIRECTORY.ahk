#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents the debug directory format.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-image_debug_directory
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGE_DEBUG_DIRECTORY extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Reserved.
     * @type {Integer}
     */
    Characteristics {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The ime and date the debugging information was created.
     * @type {Integer}
     */
    TimeDateStamp {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The major version number of the debugging information format.
     * @type {Integer}
     */
    MajorVersion {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * The minor version number of the debugging information format.
     * @type {Integer}
     */
    MinorVersion {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * 
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The size of the debugging information, in bytes. This value does not include the debug directory itself.
     * @type {Integer}
     */
    SizeOfData {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The address of the debugging information when the image is loaded, relative to the image base.
     * @type {Integer}
     */
    AddressOfRawData {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * A file pointer to the debugging information.
     * @type {Integer}
     */
    PointerToRawData {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
