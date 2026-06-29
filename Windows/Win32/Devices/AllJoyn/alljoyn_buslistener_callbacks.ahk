#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_buslistener_callbacks {
    #StructPack 8

    listener_registered : IntPtr

    listener_unregistered : IntPtr

    found_advertised_name : IntPtr

    lost_advertised_name : IntPtr

    name_owner_changed : IntPtr

    bus_stopping : IntPtr

    bus_disconnected : IntPtr

    property_changed : IntPtr

}
