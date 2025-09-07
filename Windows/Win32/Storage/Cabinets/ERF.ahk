#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ERF structure contains error information from FCI/FDI. The caller should not modify this structure.
 * @see https://learn.microsoft.com/windows/win32/api/fdi_fci_types/ns-fdi_fci_types-erf
 * @namespace Windows.Win32.Storage.Cabinets
 * @version v4.0.30319
 */
class ERF extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * An FCI/FDI error code.
     * 
     * 
     * The following values are returned for FCI:
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FCIERR_NONE"></a><a id="fcierr_none"></a><dl>
     * <dt><b>FCIERR_NONE</b></dt>
     * <dt>0x00</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No Error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FCIERR_OPEN_SRC"></a><a id="fcierr_open_src"></a><dl>
     * <dt><b>FCIERR_OPEN_SRC</b></dt>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure opening the file to be stored in the cabinet.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FCIERR_READ_SRC"></a><a id="fcierr_read_src"></a><dl>
     * <dt><b>FCIERR_READ_SRC</b></dt>
     * <dt>0x02</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure reading the file to be stored in the cabinet.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FCIERR_ALLOC_FAIL"></a><a id="fcierr_alloc_fail"></a><dl>
     * <dt><b>FCIERR_ALLOC_FAIL</b></dt>
     * <dt>0x03</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory in FCI.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FCIERR_TEMP_FILE"></a><a id="fcierr_temp_file"></a><dl>
     * <dt><b>FCIERR_TEMP_FILE</b></dt>
     * <dt>0x04</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not create a temporary file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FCIERR_BAD_COMPR_TYPE"></a><a id="fcierr_bad_compr_type"></a><dl>
     * <dt><b>FCIERR_BAD_COMPR_TYPE</b></dt>
     * <dt>0x05</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown compression type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FCIERR_CAB_FILE"></a><a id="fcierr_cab_file"></a><dl>
     * <dt><b>FCIERR_CAB_FILE</b></dt>
     * <dt>0x06</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not create the cabinet file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FCIERR_USER_ABORT"></a><a id="fcierr_user_abort"></a><dl>
     * <dt><b>FCIERR_USER_ABORT</b></dt>
     * <dt>0x07</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * FCI aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FCIERR_MCI_FAIL"></a><a id="fcierr_mci_fail"></a><dl>
     * <dt><b>FCIERR_MCI_FAIL</b></dt>
     * <dt>0x08</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure compressing data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FCIERR_CAB_FORMAT_LIMIT"></a><a id="fcierr_cab_format_limit"></a><dl>
     * <dt><b>FCIERR_CAB_FORMAT_LIMIT</b></dt>
     * <dt>0x09</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data-size or file-count exceeded CAB format limits.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * The following values are returned for FDI:
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FDIERROR_NONE"></a><a id="fdierror_none"></a><dl>
     * <dt><b>FDIERROR_NONE</b></dt>
     * <dt>0x00</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FDIERROR_CABINET_NOT_FOUND"></a><a id="fdierror_cabinet_not_found"></a><dl>
     * <dt><b>FDIERROR_CABINET_NOT_FOUND</b></dt>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cabinet file was  not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FDIERROR_NOT_A_CABINET"></a><a id="fdierror_not_a_cabinet"></a><dl>
     * <dt><b>FDIERROR_NOT_A_CABINET</b></dt>
     * <dt>0x02</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cabinet file does not have the correct format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FDIERROR_UNKNOWN_CABINET_VERSION"></a><a id="fdierror_unknown_cabinet_version"></a><dl>
     * <dt><b>FDIERROR_UNKNOWN_CABINET_VERSION</b></dt>
     * <dt>0x03</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cabinet file has an unknown version number.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FDIERROR_CORRUPT_CABINET"></a><a id="fdierror_corrupt_cabinet"></a><dl>
     * <dt><b>FDIERROR_CORRUPT_CABINET</b></dt>
     * <dt>0x04</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cabinet file is corrupt.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FDIERROR_ALLOC_FAIL"></a><a id="fdierror_alloc_fail"></a><dl>
     * <dt><b>FDIERROR_ALLOC_FAIL</b></dt>
     * <dt>0x05</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FDIERROR_BAD_COMPR_TYPE"></a><a id="fdierror_bad_compr_type"></a><dl>
     * <dt><b>FDIERROR_BAD_COMPR_TYPE</b></dt>
     * <dt>0x06</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown compression type used in the cabinet folder.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FDIERROR_MDI_FAIL"></a><a id="fdierror_mdi_fail"></a><dl>
     * <dt><b>FDIERROR_MDI_FAIL</b></dt>
     * <dt>0x07</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure decompressing data from the cabinet file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FDIERROR_TARGET_FILE"></a><a id="fdierror_target_file"></a><dl>
     * <dt><b>FDIERROR_TARGET_FILE</b></dt>
     * <dt>0x08</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure writing to the target file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FDIERROR_RESERVE_MISMATCH"></a><a id="fdierror_reserve_mismatch"></a><dl>
     * <dt><b>FDIERROR_RESERVE_MISMATCH</b></dt>
     * <dt>0x09</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cabinets within a set do not have the same RESERVE sizes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FDIERROR_WRONG_CABINET"></a><a id="fdierror_wrong_cabinet"></a><dl>
     * <dt><b>FDIERROR_WRONG_CABINET</b></dt>
     * <dt>0x0A</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cabinet returned by fdintNEXT_CABINET is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FDIERROR_USER_ABORT"></a><a id="fdierror_user_abort"></a><dl>
     * <dt><b>FDIERROR_USER_ABORT</b></dt>
     * <dt>0x0B</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * FDI aborted.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    erfOper {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * An optional error value filled in by FCI/FDI. For FCI, this is usually the C runtime errno value.
     * @type {Integer}
     */
    erfType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A flag that indicates an error. If <b>TRUE</b>, an error is present.
     * @type {Integer}
     */
    fError {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
