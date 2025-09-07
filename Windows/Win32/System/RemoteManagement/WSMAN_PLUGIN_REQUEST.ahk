#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies information for a plug-in request.
 * @remarks
 * Operations must signal the callback for the operation to indicate it has been shut down. Operations are canceled in a hierarchical way to ensure that all follow-on operations are canceled before the top-level operations. A plug-in has two ways of handling the cancellation of an operation.   First, the plug-in can check the <b>shutdownNotification</b> Boolean value
  * if it iterates through a set of results.  Second, if the plug-in is more 
  * asynchronous in nature, the <b>shutdownNotificationHandle</b> can be used when queuing asynchronous notification threads.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_plugin_request
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_PLUGIN_REQUEST extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_sender_details">WSMAN_SENDER_DETAILS</a> structure that specifies details about the client that initiated the request.
     * @type {Pointer<WSMAN_SENDER_DETAILS>}
     */
    senderDetails {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies the locale that the user requested results to be in.  If the requested locale is not available, the following options are available:
     * 
     * <ul>
     * <li>The system locale is used.</li>
     * <li>The request is rejected with an invalid locale error.</li>
     * </ul>
     * Any call into the plug-in will have the locale on the thread set to the  locale that is specified in this member.  If the plug-in has other threads working on the request, the plug-in will need to set the locale accordingly on each thread that it uses.
     * @type {Pointer<Ptr>}
     */
    locale {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">resource URI</a> for this operation.
     * @type {Pointer<Ptr>}
     */
    resourceUri {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_operation_info">WSMAN_OPERATION_INFO</a> structure that contains extra information about the operation.  Some of the information in this structure will be <b>NULL</b> because not all of the parameters are relevant to all operations.
     * @type {Pointer<WSMAN_OPERATION_INFO>}
     */
    operationInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * If the operation is canceled, the <b>shutdownNotification</b> member is set to <b>TRUE</b>.
     * @type {Integer}
     */
    shutdownNotification {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * If the operation is canceled, <b>shutdownNotification</b> is signaled.
     * @type {Pointer<Ptr>}
     */
    shutdownNotificationHandle {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
     */
    dataLocale {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
