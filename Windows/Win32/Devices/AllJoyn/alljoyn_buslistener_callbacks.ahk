#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_buslistener_bus_disconnected_ptr.ahk" { alljoyn_buslistener_bus_disconnected_ptr }
#Import ".\alljoyn_buslistener_bus_prop_changed_ptr.ahk" { alljoyn_buslistener_bus_prop_changed_ptr }
#Import ".\alljoyn_buslistener_bus_stopping_ptr.ahk" { alljoyn_buslistener_bus_stopping_ptr }
#Import ".\alljoyn_buslistener_found_advertised_name_ptr.ahk" { alljoyn_buslistener_found_advertised_name_ptr }
#Import ".\alljoyn_buslistener_listener_registered_ptr.ahk" { alljoyn_buslistener_listener_registered_ptr }
#Import ".\alljoyn_buslistener_listener_unregistered_ptr.ahk" { alljoyn_buslistener_listener_unregistered_ptr }
#Import ".\alljoyn_buslistener_lost_advertised_name_ptr.ahk" { alljoyn_buslistener_lost_advertised_name_ptr }
#Import ".\alljoyn_buslistener_name_owner_changed_ptr.ahk" { alljoyn_buslistener_name_owner_changed_ptr }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_buslistener_callbacks {
    #StructPack 8

    listener_registered : alljoyn_buslistener_listener_registered_ptr

    listener_unregistered : alljoyn_buslistener_listener_unregistered_ptr

    found_advertised_name : alljoyn_buslistener_found_advertised_name_ptr

    lost_advertised_name : alljoyn_buslistener_lost_advertised_name_ptr

    name_owner_changed : alljoyn_buslistener_name_owner_changed_ptr

    bus_stopping : alljoyn_buslistener_bus_stopping_ptr

    bus_disconnected : alljoyn_buslistener_bus_disconnected_ptr

    property_changed : alljoyn_buslistener_bus_prop_changed_ptr

}
