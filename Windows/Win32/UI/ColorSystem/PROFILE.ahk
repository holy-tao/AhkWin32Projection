#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that defines a color profile.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//icm/ns-icm-profile
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class PROFILE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The contents of this member is indicated by the **dwTYPE** member. It will either be a pointer to a null-terminated string containing the file name of the device profile, or it will be a pointer to a buffer in memory containing the device profile data.
     * @type {Pointer<Void>}
     */
    pProfileData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size in bytes of the data buffer pointed to by the **pProfileData** member.
     * @type {Integer}
     */
    cbDataSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
