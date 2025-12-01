#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the security flags.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_flags
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class SEC_FLAGS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The caller sets ISC/ASC REQ flags. The lower 32 bits are reserved and must be set to 0.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
