#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains extended package information used for NEGO2 negotiations.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecpkg/ns-ntsecpkg-secpkg_nego2_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_NEGO2_INFO extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The authentication identifier.
     * @type {Array<Byte>}
     */
    AuthScheme{
        get {
            if(!this.HasProp("__AuthSchemeProxyArray"))
                this.__AuthSchemeProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__AuthSchemeProxyArray
        }
    }

    /**
     * The flags associated with the authentication package.
     * @type {Integer}
     */
    PackageFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
