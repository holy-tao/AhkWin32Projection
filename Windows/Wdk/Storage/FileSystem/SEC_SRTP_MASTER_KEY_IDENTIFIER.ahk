#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores the SRTP master key identifier.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_srtp_master_key_identifier
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class SEC_SRTP_MASTER_KEY_IDENTIFIER extends Win32Struct
{
    static sizeof => 2

    static packingSize => 1

    /**
     * The size (in bytes) of the SRTP master key identifier.
     * @type {Integer}
     */
    MasterKeyIdentifierSize {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * The SRTP master key identifier.
     * @type {Array<Byte>}
     */
    MasterKeyIdentifier{
        get {
            if(!this.HasProp("__MasterKeyIdentifierProxyArray"))
                this.__MasterKeyIdentifierProxyArray := Win32FixedArray(this.ptr + 1, 1, Primitive, "char")
            return this.__MasterKeyIdentifierProxyArray
        }
    }
}
