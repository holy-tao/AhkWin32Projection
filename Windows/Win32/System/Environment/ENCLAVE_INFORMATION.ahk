#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ENCLAVE_IDENTITY.ahk" { ENCLAVE_IDENTITY }

/**
 * Contains information about the currently executing enclave.
 * @see https://learn.microsoft.com/windows/win32/api/ntenclv/ns-ntenclv-enclave_information
 * @namespace Windows.Win32.System.Environment
 */
export default struct ENCLAVE_INFORMATION {
    #StructPack 8

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
     */
    EnclaveType : UInt32

    /**
     * Reserved.
     */
    Reserved : UInt32

    /**
     * A pointer to the base address of the enclave.
     */
    BaseAddress : IntPtr

    /**
     * The size of the enclave, in bytes.
     */
    Size : IntPtr

    /**
     * The identity of the primary module of an enclave.
     */
    Identity : ENCLAVE_IDENTITY

}
