#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FDINOTIFICATION structure to provide information to FNFDINOTIFY.
 * @see https://learn.microsoft.com/windows/win32/api/fdi/ns-fdi-fdinotification
 * @namespace Windows.Win32.Storage.Cabinets
 * @version v4.0.30319
 */
class FDINOTIFICATION extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * The size, in bytes, of a cabinet element.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A null-terminated string.
     * @type {Pointer<PSTR>}
     */
    psz1 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A null-terminated string.
     * @type {Pointer<PSTR>}
     */
    psz2 {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A null-terminated string.
     * @type {Pointer<PSTR>}
     */
    psz3 {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to an application-defined value.
     * @type {Pointer<Void>}
     */
    pv {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Application-defined value used to identify the opened file.
     * @type {Pointer}
     */
    hf {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

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
     * @type {Integer}
     */
    date {
        get => NumGet(this, 48, "ushort")
        set => NumPut("ushort", value, this, 48)
    }

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
     * @type {Integer}
     */
    time {
        get => NumGet(this, 50, "ushort")
        set => NumPut("ushort", value, this, 50)
    }

    /**
     * The file attributes. For possible values and their descriptions, see File Attributes.
     * @type {Integer}
     */
    attribs {
        get => NumGet(this, 52, "ushort")
        set => NumPut("ushort", value, this, 52)
    }

    /**
     * The identifier for a cabinet set.
     * @type {Integer}
     */
    setID {
        get => NumGet(this, 54, "ushort")
        set => NumPut("ushort", value, this, 54)
    }

    /**
     * The number of the cabinets within a set.
     * @type {Integer}
     */
    iCabinet {
        get => NumGet(this, 56, "ushort")
        set => NumPut("ushort", value, this, 56)
    }

    /**
     * The number of folders within a cabinet.
     * @type {Integer}
     */
    iFolder {
        get => NumGet(this, 58, "ushort")
        set => NumPut("ushort", value, this, 58)
    }

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
     * @type {Integer}
     */
    fdie {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }
}
