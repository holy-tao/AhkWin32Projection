#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the format of a variable data block contained in a report that the EnclaveGetAttestationReport function generates.
 * @remarks
 * An enclave attestation report includes zero or  variable data blocks. These variable data blocks consist of the following items:
 * 
 * <ul>
 * <li>A <b>VBS_ENCLAVE_REPORT_VARDATA_HEADER</b> structure that describes the format of the variable data block. </li>
 * <li>The data described by the <b>VBS_ENCLAVE_REPORT_VARDATA_HEADER</b> structure. If the value of the <b>DataType</b> member of the <b>VBS_ENCLAVE_REPORT_VARDATA_HEADER</b> structure is  <b>VBS_ENCLAVE_VARDATA_MODULE</b>, this data is a <a href="https://docs.microsoft.com/windows/desktop/api/ntenclv/ns-ntenclv-vbs_enclave_report_module">VBS_ENCLAVE_REPORT_MODULE</a> structure.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/ntenclv/ns-ntenclv-vbs_enclave_report_vardata_header
 * @namespace Windows.Win32.System.Environment
 */
export default struct VBS_ENCLAVE_REPORT_VARDATA_HEADER {
    #StructPack 4

    /**
     * The type of the variable data block.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VBS_ENCLAVE_VARDATA_INVALID"></a><a id="vbs_enclave_vardata_invalid"></a><dl>
     * <dt><b>VBS_ENCLAVE_VARDATA_INVALID</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The variable data block is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VBS_ENCLAVE_VARDATA_MODULE"></a><a id="vbs_enclave_vardata_module"></a><dl>
     * <dt><b>VBS_ENCLAVE_VARDATA_MODULE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The variable data block is a module.
     * 
     * </td>
     * </tr>
     * </table>
     */
    DataType : UInt32

    /**
     * The size of this variable data block, including the header, in bytes.
     */
    Size : UInt32

}
