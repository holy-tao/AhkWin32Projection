#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TCI_CLIENT_FUNC_LIST structure is used by the traffic control interface to register and then access client-callback functions. Each member of TCI_CLIENT_FUNC_LIST is a pointer to the client provided�callback function.
 * @remarks
 * Any member of the 
  * <b>TCI_CLIENT_FUNC_LIST</b> structure can be <b>NULL</b> except <b>ClNotifyHandler</b>.
 * @see https://learn.microsoft.com/windows/win32/api/traffic/ns-traffic-tci_client_func_list
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class TCI_CLIENT_FUNC_LIST extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Pointer to the client-callback function 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_notify_handler">ClNotifyHandler</a>.
     * @type {Pointer<TCI_NOTIFY_HANDLER>}
     */
    ClNotifyHandler {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to the client-callback function <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_add_flow_complete_handler">ClAddFlowComplete</a>.
     * @type {Pointer<TCI_ADD_FLOW_COMPLETE_HANDLER>}
     */
    ClAddFlowCompleteHandler {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to the client-callback function <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_mod_flow_complete_handler">ClModifyFlowComplete</a>.
     * @type {Pointer<TCI_MOD_FLOW_COMPLETE_HANDLER>}
     */
    ClModifyFlowCompleteHandler {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to the client-callback function <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_del_flow_complete_handler">ClDeleteFlowComplete</a>.
     * @type {Pointer<TCI_DEL_FLOW_COMPLETE_HANDLER>}
     */
    ClDeleteFlowCompleteHandler {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
