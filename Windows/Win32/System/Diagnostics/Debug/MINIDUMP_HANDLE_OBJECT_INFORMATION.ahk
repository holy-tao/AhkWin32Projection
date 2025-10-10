#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains object-specific information for a handle.
 * @see https://docs.microsoft.com/windows/win32/api//minidumpapiset/ns-minidumpapiset-minidump_handle_object_information
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_HANDLE_OBJECT_INFORMATION extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * An RVA to a 
     * <b>MINIDUMP_HANDLE_OBJECT_INFORMATION</b> structure that specifies additional object-specific information. This member is 0 if there are no more elements in the list.
     * @type {Integer}
     */
    NextInfoRva {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The object information type. This member is one of the values from the <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ne-minidumpapiset-minidump_handle_object_information_type">MINIDUMP_HANDLE_OBJECT_INFORMATION_TYPE</a> enumeration.
     * @type {Integer}
     */
    InfoType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size of the information that follows this member, in bytes.
     * @type {Integer}
     */
    SizeOfInfo {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
