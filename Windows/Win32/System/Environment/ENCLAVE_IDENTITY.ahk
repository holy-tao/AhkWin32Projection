#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the identity of the primary module of an enclave.
 * @see https://learn.microsoft.com/windows/win32/api/ntenclv/ns-ntenclv-enclave_identity
 * @namespace Windows.Win32.System.Environment
 * @version v4.0.30319
 */
class ENCLAVE_IDENTITY extends Win32Struct
{
    static sizeof => 152

    static packingSize => 4

    /**
     * The identifier of the owner for the enclave.
     * @type {Array<Byte>}
     */
    OwnerId{
        get {
            if(!this.HasProp("__OwnerIdProxyArray"))
                this.__OwnerIdProxyArray := Win32FixedArray(this.ptr + 0, 32, Primitive, "char")
            return this.__OwnerIdProxyArray
        }
    }

    /**
     * The unique identifier of the primary module for the enclave.
     * @type {Array<Byte>}
     */
    UniqueId{
        get {
            if(!this.HasProp("__UniqueIdProxyArray"))
                this.__UniqueIdProxyArray := Win32FixedArray(this.ptr + 32, 32, Primitive, "char")
            return this.__UniqueIdProxyArray
        }
    }

    /**
     * The author identifier of the primary module for the enclave.
     * @type {Array<Byte>}
     */
    AuthorId{
        get {
            if(!this.HasProp("__AuthorIdProxyArray"))
                this.__AuthorIdProxyArray := Win32FixedArray(this.ptr + 64, 32, Primitive, "char")
            return this.__AuthorIdProxyArray
        }
    }

    /**
     * The family identifier of the primary module for the enclave.
     * @type {Array<Byte>}
     */
    FamilyId{
        get {
            if(!this.HasProp("__FamilyIdProxyArray"))
                this.__FamilyIdProxyArray := Win32FixedArray(this.ptr + 96, 16, Primitive, "char")
            return this.__FamilyIdProxyArray
        }
    }

    /**
     * The image identifier of the primary module for the enclave.
     * @type {Array<Byte>}
     */
    ImageId{
        get {
            if(!this.HasProp("__ImageIdProxyArray"))
                this.__ImageIdProxyArray := Win32FixedArray(this.ptr + 112, 16, Primitive, "char")
            return this.__ImageIdProxyArray
        }
    }

    /**
     * The security version number of the primary module for the enclave.
     * @type {Integer}
     */
    EnclaveSvn {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * The security version number of the Virtual Secure Mode (VSM) kernel.
     * @type {Integer}
     */
    SecureKernelSvn {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * The security version number of the platform that hosts the enclave.
     * @type {Integer}
     */
    PlatformSvn {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * Flags that describe the runtime policy for the enclave.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ENCLAVE_FLAG_FULL_DEBUG_ENABLED"></a><a id="enclave_flag_full_debug_enabled"></a><dl>
     * <dt><b>ENCLAVE_FLAG_FULL_DEBUG_ENABLED</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enclave supports debugging.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ENCLAVE_FLAG_DYNAMIC_DEBUG_ENABLED"></a><a id="enclave_flag_dynamic_debug_enabled"></a><dl>
     * <dt><b>ENCLAVE_FLAG_DYNAMIC_DEBUG_ENABLED</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enclave supports dynamic debugging.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ENCLAVE_FLAG_DYNAMIC_DEBUG_ACTIVE"></a><a id="enclave_flag_dynamic_debug_active"></a><dl>
     * <dt><b>ENCLAVE_FLAG_DYNAMIC_DEBUG_ACTIVE</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dynamic debugging is turned on for the enclave.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * The signing level of the primary module for the enclave.
     * @type {Integer}
     */
    SigningLevel {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * @type {Integer}
     */
    EnclaveType {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }
}
