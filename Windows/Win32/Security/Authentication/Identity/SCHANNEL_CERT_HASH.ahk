#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the hash store data for the certificate that Schannel uses.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-schannel_cert_hash
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SCHANNEL_CERT_HASH extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    dwLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains bit flags that control the behavior of Schannel. This member can be zero or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCH_MACHINE_CERT_HASH"></a><a id="sch_machine_cert_hash"></a><dl>
     * <dt><b>SCH_MACHINE_CERT_HASH</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate hash of the computer.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Handle to the cryptography provider.
     * @type {Pointer}
     */
    hProv {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The secure hash algorithm.
     * @type {Array<Byte>}
     */
    ShaHash{
        get {
            if(!this.HasProp("__ShaHashProxyArray"))
                this.__ShaHashProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__ShaHashProxyArray
        }
    }
}
