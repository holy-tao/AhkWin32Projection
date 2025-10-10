#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ENCLAVE_IDENTITY.ahk

/**
 * Contains information about the currently executing enclave.
 * @see https://docs.microsoft.com/windows/win32/api//ntenclv/ns-ntenclv-enclave_information
 * @namespace Windows.Win32.System.Environment
 * @version v4.0.30319
 */
class ENCLAVE_INFORMATION extends Win32Struct
{
    static sizeof => 176

    static packingSize => 8

    /**
     * The architecture type of the enclave.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ENCLAVE_TYPE_SGX"></a><a id="enclave_type_sgx"></a><dl>
     * <dt><b><b>ENCLAVE_TYPE_SGX</b></b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An enclave for the Intel Software Guard Extensions (SGX) architecture extension.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ENCLAVE_TYPE_VBS"></a><a id="enclave_type_vbs"></a><dl>
     * <dt><b>ENCLAVE_TYPE_VBS</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A  VBS enclave.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    EnclaveType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to the base address of the enclave.
     * @type {Pointer<Void>}
     */
    BaseAddress {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size of the enclave, in bytes.
     * @type {Pointer}
     */
    Size {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The identity of the primary module of an enclave.
     * @type {ENCLAVE_IDENTITY}
     */
    Identity{
        get {
            if(!this.HasProp("__Identity"))
                this.__Identity := ENCLAVE_IDENTITY(this.ptr + 24)
            return this.__Identity
        }
    }
}
