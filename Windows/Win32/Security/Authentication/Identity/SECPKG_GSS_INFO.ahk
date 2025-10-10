#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * A SECPKG_GSS_INFO structure contains information used for GSS-compatible negotiations.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecpkg/ns-ntsecpkg-secpkg_gss_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_GSS_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The encoded GSS OID length.
     * @type {Integer}
     */
    EncodedIdLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The encoded GSS OID.
     * @type {Array<Byte>}
     */
    EncodedId{
        get {
            if(!this.HasProp("__EncodedIdProxyArray"))
                this.__EncodedIdProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "char")
            return this.__EncodedIdProxyArray
        }
    }
}
