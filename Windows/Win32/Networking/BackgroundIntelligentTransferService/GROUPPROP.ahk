#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The GROUPPROP enumeration defines the constant values for retrieving and setting group property values.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/qmgr/ne-qmgr-groupprop
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
class GROUPPROP extends Win32Enum {

    /**
     * Determines when the QMGR processes the group relative to other groups in the queue.
     * 
     * There is only one priority. You must specify a value of 1 when setting this property. The property always returns a value of 1.
     * 
     * Variant data type can be VT_I4, VT_I2, VT_UI4, VT_UI2, VT_INT, or VT_UINT.
     * Native name: GROUPPROP_PRIORITY
     * @type {Integer (Int32)}
     */
    static PRIORITY => 0

    /**
     * Not supported.
     * Native name: GROUPPROP_REMOTEUSERID
     * @type {Integer (Int32)}
     */
    static REMOTEUSERID => 1

    /**
     * Not supported.
     * Native name: GROUPPROP_REMOTEUSERPWD
     * @type {Integer (Int32)}
     */
    static REMOTEUSERPWD => 2

    /**
     * Not supported.
     * Native name: GROUPPROP_LOCALUSERID
     * @type {Integer (Int32)}
     */
    static LOCALUSERID => 3

    /**
     * Not supported.
     * Native name: GROUPPROP_LOCALUSERPWD
     * @type {Integer (Int32)}
     */
    static LOCALUSERPWD => 4

    /**
     * Specifies the protocol to use for the download.
     * 
     * You must specify QM_PROTOCOL_HTTP when setting this property.
     * 
     * Variant data type can be VT_I4, VT_I2, VT_UI4, VT_UI2, VT_INT, or VT_UINT.
     * Native name: GROUPPROP_PROTOCOLFLAGS
     * @type {Integer (Int32)}
     */
    static PROTOCOLFLAGS => 5

    /**
     * Specifies the type of event notification to receive for the group. See Remarks.
     * 
     * Variant data type can be VT_I4, VT_I2, VT_UI4, VT_UI2, VT_INT, or VT_UINT.
     * Native name: GROUPPROP_NOTIFYFLAGS
     * @type {Integer (Int32)}
     */
    static NOTIFYFLAGS => 6

    /**
     * The 	CLSID to activate when an event specified by <b>GROUPPROP_NOTIFYFLAGS</b> occurs. For more details on CLSID activation, see <a href="https://docs.microsoft.com/windows/desktop/api/qmgr/nn-qmgr-ibackgroundcopycallback1">IBackgroundCopyCallback1</a>.
     * 
     * Variant data type is VT_BSTR.
     * Native name: GROUPPROP_NOTIFYCLSID
     * @type {Integer (Int32)}
     */
    static NOTIFYCLSID => 7

    /**
     * Not supported.
     * Native name: GROUPPROP_PROGRESSSIZE
     * @type {Integer (Int32)}
     */
    static PROGRESSSIZE => 8

    /**
     * Not supported.
     * Native name: GROUPPROP_PROGRESSPERCENT
     * @type {Integer (Int32)}
     */
    static PROGRESSPERCENT => 9

    /**
     * Not supported.
     * Native name: GROUPPROP_PROGRESSTIME
     * @type {Integer (Int32)}
     */
    static PROGRESSTIME => 10

    /**
     * Specifies a display name that can be used to identify the group in a user interface. The length of the string is limited to 256 characters, not including the null terminator.
     * 
     * Variant data type is VT_BSTR.
     * Native name: GROUPPROP_DISPLAYNAME
     * @type {Integer (Int32)}
     */
    static DISPLAYNAME => 11

    /**
     * Specifies a description to associate with the group. The length of the string is limited to 1,024 characters, not including the null terminator.
     * 
     * Variant data type is VT_BSTR.
     * Native name: GROUPPROP_DESCRIPTION
     * @type {Integer (Int32)}
     */
    static DESCRIPTION => 12
}
