#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FDIERROR.ahk" { FDIERROR }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The FDINOTIFICATION structure to provide information to FNFDINOTIFY.
 * @see https://learn.microsoft.com/windows/win32/api/fdi/ns-fdi-fdinotification
 * @namespace Windows.Win32.Storage.Cabinets
 */
export default struct FDINOTIFICATION {
    #StructPack 8

    /**
     * The size, in bytes, of a cabinet element.
     */
    cb : Int32

    /**
     * A null-terminated string.
     */
    psz1 : PSTR

    /**
     * A null-terminated string.
     */
    psz2 : PSTR

    /**
     * A null-terminated string.
     */
    psz3 : PSTR

    /**
     * Pointer to an application-defined value.
     */
    pv : IntPtr

    /**
     * Application-defined value used to identify the opened file.
     */
    hf : IntPtr

    /**
     * The MS-DOS date.
     * 
     * <table>
     * <tr>
     * <th>Bits</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>0-4</td>
     * <td>Day of the month (1-31)</td>
     * </tr>
     * <tr>
     * <td>5-8</td>
     * <td>Month (1 = January, 2 = February, etc.)</td>
     * </tr>
     * <tr>
     * <td>9-15</td>
     * <td>Year offset from 1980 (add 1980</td>
     * </tr>
     * </table>
     */
    date : UInt16

    /**
     * The MS-DOS time.
     * 
     * <table>
     * <tr>
     * <th>Bits</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>0-4</td>
     * <td>Second divided by 2</td>
     * </tr>
     * <tr>
     * <td>5-10</td>
     * <td>Minute (0-59)</td>
     * </tr>
     * <tr>
     * <td>11-15</td>
     * <td>Hour (0-23 on a 24-hour clock)</td>
     * </tr>
     * </table>
     */
    time : UInt16

    /**
     * The file attributes. For possible values and their descriptions, see File Attributes.
     */
    attribs : UInt16

    /**
     * The identifier for a cabinet set.
     */
    setID : UInt16

    /**
     * The number of the cabinets within a set.
     */
    iCabinet : UInt16

    /**
     * The number of folders within a cabinet.
     */
    iFolder : UInt16

    /**
     * An FDI error code. Possible values include:
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
     */
    fdie : FDIERROR

}
