#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The TCI_CLIENT_FUNC_LIST structure is used by the traffic control interface to register and then access client-callback functions. Each member of TCI_CLIENT_FUNC_LIST is a pointer to the client provided�callback function.
 * @remarks
 * Any member of the 
 * <b>TCI_CLIENT_FUNC_LIST</b> structure can be <b>NULL</b> except <b>ClNotifyHandler</b>.
 * @see https://learn.microsoft.com/windows/win32/api/traffic/ns-traffic-tci_client_func_list
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct TCI_CLIENT_FUNC_LIST {
    #StructPack 8

    /**
     * Pointer to the client-callback function 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_notify_handler">ClNotifyHandler</a>.
     */
    ClNotifyHandler : IntPtr

    /**
     * Pointer to the client-callback function <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_add_flow_complete_handler">ClAddFlowComplete</a>.
     */
    ClAddFlowCompleteHandler : IntPtr

    /**
     * Pointer to the client-callback function <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_mod_flow_complete_handler">ClModifyFlowComplete</a>.
     */
    ClModifyFlowCompleteHandler : IntPtr

    /**
     * Pointer to the client-callback function <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_del_flow_complete_handler">ClDeleteFlowComplete</a>.
     */
    ClDeleteFlowCompleteHandler : IntPtr

}
