#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Used to query or set the value used to generate Posix user and group identifiers.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-trusted_posix_offset_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class TRUSTED_POSIX_OFFSET_INFO extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * An offset that the system uses to generate Posix user and group identifiers that correspond to a given SID. To generate a Posix identifier, the system adds the RID from the SID to the Posix offset of the trusted domain identified by the SID.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
