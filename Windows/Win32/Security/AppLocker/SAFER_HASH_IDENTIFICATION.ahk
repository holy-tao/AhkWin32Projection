#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\SAFER_IDENTIFICATION_HEADER.ahk

/**
 * Represents a hash identification rule.
 * @see https://learn.microsoft.com/windows/win32/api/winsafer/ns-winsafer-safer_hash_identification
 * @namespace Windows.Win32.Security.AppLocker
 * @version v4.0.30319
 */
class SAFER_HASH_IDENTIFICATION extends Win32Struct
{
    static sizeof => 1136

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ns-winsafer-safer_identification_header">SAFER_IDENTIFICATION_HEADER</a> structure containing the structure header. The <b>dwIdentificationType</b> member  of the header must be <b>SaferIdentityTypeImageHash</b>, and the <b>cbStructSize</b> member  of the header must be sizeof(SAFER_HASH_IDENTIFICATION).
     * @type {SAFER_IDENTIFICATION_HEADER}
     */
    header{
        get {
            if(!this.HasProp("__header"))
                this.__header := SAFER_IDENTIFICATION_HEADER(this.ptr + 0)
            return this.__header
        }
    }

    /**
     * A description of the hash identification rule provided by the user.
     * @type {String}
     */
    Description {
        get => StrGet(this.ptr + 24, 255, "UTF-16")
        set => StrPut(value, this.ptr + 24, 255, "UTF-16")
    }

    /**
     * A human-readable name for the hash identification rule.
     * @type {String}
     */
    FriendlyName {
        get => StrGet(this.ptr + 536, 255, "UTF-16")
        set => StrPut(value, this.ptr + 536, 255, "UTF-16")
    }

    /**
     * The size of the <b>ImageHash</b> member in bytes. For example, if the algorithm specified by the <b>HashAlgorithm</b> member is MD5, the size is 16.
     * @type {Integer}
     */
    HashSize {
        get => NumGet(this, 1048, "uint")
        set => NumPut("uint", value, this, 1048)
    }

    /**
     * The computed hash of the code image.
     * @type {Array<Byte>}
     */
    ImageHash{
        get {
            if(!this.HasProp("__ImageHashProxyArray"))
                this.__ImageHashProxyArray := Win32FixedArray(this.ptr + 1052, 64, Primitive, "char")
            return this.__ImageHashProxyArray
        }
    }

    /**
     * The algorithm used to compute the hash.
     * @type {Integer}
     */
    HashAlgorithm {
        get => NumGet(this, 1116, "uint")
        set => NumPut("uint", value, this, 1116)
    }

    /**
     * The size of the original file in bytes.
     * @type {Integer}
     */
    ImageSize {
        get => NumGet(this, 1120, "int64")
        set => NumPut("int64", value, this, 1120)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    dwSaferFlags {
        get => NumGet(this, 1128, "uint")
        set => NumPut("uint", value, this, 1128)
    }
}
