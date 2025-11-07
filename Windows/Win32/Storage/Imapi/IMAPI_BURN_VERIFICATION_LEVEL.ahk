#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values for the burn verification implemented by the IBurnVerification interface.
 * @remarks
 * 
 * Depending on the format used for the burned media, the values defined by this enumeration will elicit the following behavior during verification:
 * 
 * <table>
 * <tr>
 * <th>MsftDiscFormat2Data</th>
 * <th></th>
 * </tr>
 * <tr>
 * <td>None</td>
 * <td>
 * No burn verification.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>Quick Verification</td>
 * <td>
 * <ul>
 * <li>READ_DISC_INFO command works and data appears correct</li>
 * <li>READ_TRACK_INFO command works on all tracks</li>
 * <li>Checksum comparison of a small set of disc sectors to stream bits</li>
 * </ul>
 * </td>
 * </tr>
 * <tr>
 * <td>Full Verification</td>
 * <td>
 * <ul>
 * <li>Performs the  same heuristic checks as the 'Quick' method, but will also read the entire last session and compare a checksum to the burned stream.</li>
 * </ul>
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * <table>
 * <tr>
 * <th>MsftDiscFormat2TrackAtOnce</th>
 * <th></th>
 * </tr>
 * <tr>
 * <td>None</td>
 * <td>
 * No burn verification.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>Quick Verification</td>
 * <td>
 * After adding each track:
 * 
 * <ul>
 * <li>READ_TRACK_INFO command for last track appears correct</li>
 * </ul>
 * When finishing the disc:
 * 
 * <ul>
 * <li>READ_DISC_INFO command appears correct</li>
 * <li>TOC appears correct</li>
 * </ul>
 * </td>
 * </tr>
 * <tr>
 * <td>Full Verification</td>
 * <td>
 * Full verification is not supported with this format.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * The time required for a full verification is relative to the read speed of the device and  storage medium.
 * 
 * This enumeration is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/ne-imapi2-imapi_burn_verification_level
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IMAPI_BURN_VERIFICATION_LEVEL{

    /**
     * No burn verification.
     * @type {Integer (Int32)}
     */
    static IMAPI_BURN_VERIFICATION_NONE => 0

    /**
     * A quick, heuristic burn verification.
     * @type {Integer (Int32)}
     */
    static IMAPI_BURN_VERIFICATION_QUICK => 1

    /**
     * This verification compares the checksum to the referenced stream for either the last session or each track.  A full verification includes the heuristic checks of a quick verification for both burn formats.
     * @type {Integer (Int32)}
     */
    static IMAPI_BURN_VERIFICATION_FULL => 2
}
