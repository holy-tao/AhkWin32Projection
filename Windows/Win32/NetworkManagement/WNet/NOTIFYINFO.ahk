#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The NOTIFYINFO structure contains status information about a network connect or disconnect operation. It is used by the AddConnectNotify and CancelConnectNotify functions.
 * @see https://learn.microsoft.com/windows/win32/api/npapi/ns-npapi-notifyinfo
 * @namespace Windows.Win32.NetworkManagement.WNet
 * @version v4.0.30319
 */
class NOTIFYINFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * This will be either NOTIFY_PRE or NOTIFY_POST to indicate whether this notification is sent before or after the connection or disconnection is performed.
     * @type {Integer}
     */
    dwNotifyStatus {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This is set to WN_SUCCESS when <b>dwNotifyStatus</b> is NOTIFY_PRE. 
     * 
     * 
     * 
     * 
     * If <b>dwNotifyStatus</b> is set to NOTIFY_POST, <b>dwOperationStatus</b> contains the return status code from the function performing the operation: 
     * <a href="https://docs.microsoft.com/windows/desktop/api/npapi/nf-npapi-npaddconnection">NPAddConnection</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/npapi/nf-npapi-npcancelconnection">NPCancelConnection</a>.
     * @type {Integer}
     */
    dwOperationStatus {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Used by the application receiving the notification in order to keep a context for the operation between the pre-notification and the post-notification calls. In other words, it enables the notification application to match the advance notification call to the corresponding after-the-fact notification call for a particular event. The <b>lpContext</b> member is a <b>NULL</b> pointer when the notification function is called for advance notification. The notification function can return with <b>lpContext</b> still <b>NULL</b>, indicating that it is not interested in further notification for this specific operation. In this case, the notification function will not be called again with after-the-fact notification for this operation. If the advance notification function call returns a non-<b>NULL</b> value in <b>lpContext</b>, this value is passed in when the notification function is called for the after-the-fact notification for that same operation.
     * @type {Pointer<Void>}
     */
    lpContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
