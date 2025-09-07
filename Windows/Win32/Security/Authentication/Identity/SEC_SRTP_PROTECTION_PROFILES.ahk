#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Stores the SRTP protection profiles.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_srtp_protection_profiles
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SEC_SRTP_PROTECTION_PROFILES extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * The size (in bytes) of the SRTP protection profiles array.
     * @type {Integer}
     */
    ProfilesSize {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * An array of SRTP protection profiles.
     * @type {Array<UInt16>}
     */
    ProfilesList{
        get {
            if(!this.HasProp("__ProfilesListProxyArray"))
                this.__ProfilesListProxyArray := Win32FixedArray(this.ptr + 2, 2, Primitive, "ushort")
            return this.__ProfilesListProxyArray
        }
    }
}
