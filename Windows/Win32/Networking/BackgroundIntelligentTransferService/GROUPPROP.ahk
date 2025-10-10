#Requires AutoHotkey v2.0.0 64-bit

/**
 * The GROUPPROP enumeration defines the constant values for retrieving and setting group property values.
 * @remarks
 * 
  * The <b>GROUPPROP_NOTIFYFLAGS</b> group property can contain one or more of the following notification flags. 
  * 
  * <table>
  * <tr>
  * <th>Flag</th>
  * <th>Meaning</th>
  * </tr>
  * <tr>
  * <td>QM_NOTIFY_FILE_DONE</td>
  * <td>Not supported.</td>
  * </tr>
  * <tr>
  * <td>QM_NOTIFY_JOB_DONE</td>
  * <td>Not supported.</td>
  * </tr>
  * <tr>
  * <td>QM_NOTIFY_GROUP_DONE</td>
  * <td>Notifies the application through <a href="https://docs.microsoft.com/windows/desktop/api/qmgr/nf-qmgr-ibackgroundcopycallback1-onstatus">IBackgroundCopyCallback1::OnStatus</a> that the group is complete.</td>
  * </tr>
  * <tr>
  * <td>QM_NOTIFY_DISABLE_NOTIFY</td>
  * <td>Disables all notifications.</td>
  * </tr>
  * <tr>
  * <td>QM_NOTIFY_USE_PROGRESSEX</td>
  * <td>Not supported.</td>
  * </tr>
  * </table>
  *  
  * 
  * <div class="alert"><b>Note</b>  By default, QMGR calls your <a href="https://docs.microsoft.com/windows/desktop/api/qmgr/nf-qmgr-ibackgroundcopycallback1-onstatus">IBackgroundCopyCallback1::OnStatus</a> method when an error occurs.</div>
  * <div> </div>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//qmgr/ne-qmgr-groupprop
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class GROUPPROP{

    /**
     * Determines when the QMGR processes the group relative to other groups in the queue.
 * 
 * There is only one priority. You must specify a value of 1 when setting this property. The property always returns a value of 1.
 * 
 * Variant data type can be VT_I4, VT_I2, VT_UI4, VT_UI2, VT_INT, or VT_UINT.
     * @type {Integer (Int32)}
     */
    static GROUPPROP_PRIORITY => 0

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static GROUPPROP_REMOTEUSERID => 1

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static GROUPPROP_REMOTEUSERPWD => 2

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static GROUPPROP_LOCALUSERID => 3

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static GROUPPROP_LOCALUSERPWD => 4

    /**
     * Specifies the protocol to use for the download.
 * 
 * You must specify QM_PROTOCOL_HTTP when setting this property.
 * 
 * Variant data type can be VT_I4, VT_I2, VT_UI4, VT_UI2, VT_INT, or VT_UINT.
     * @type {Integer (Int32)}
     */
    static GROUPPROP_PROTOCOLFLAGS => 5

    /**
     * Specifies the type of event notification to receive for the group. See Remarks.
 * 
 * Variant data type can be VT_I4, VT_I2, VT_UI4, VT_UI2, VT_INT, or VT_UINT.
     * @type {Integer (Int32)}
     */
    static GROUPPROP_NOTIFYFLAGS => 6

    /**
     * The 	CLSID to activate when an event specified by <b>GROUPPROP_NOTIFYFLAGS</b> occurs. For more details on CLSID activation, see <a href="https://docs.microsoft.com/windows/desktop/api/qmgr/nn-qmgr-ibackgroundcopycallback1">IBackgroundCopyCallback1</a>.
 * 
 * Variant data type is VT_BSTR.
     * @type {Integer (Int32)}
     */
    static GROUPPROP_NOTIFYCLSID => 7

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static GROUPPROP_PROGRESSSIZE => 8

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static GROUPPROP_PROGRESSPERCENT => 9

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static GROUPPROP_PROGRESSTIME => 10

    /**
     * Specifies a display name that can be used to identify the group in a user interface. The length of the string is limited to 256 characters, not including the null terminator.
 * 
 * Variant data type is VT_BSTR.
     * @type {Integer (Int32)}
     */
    static GROUPPROP_DISPLAYNAME => 11

    /**
     * Specifies a description to associate with the group. The length of the string is limited to 1,024 characters, not including the null terminator.
 * 
 * Variant data type is VT_BSTR.
     * @type {Integer (Int32)}
     */
    static GROUPPROP_DESCRIPTION => 12
}
