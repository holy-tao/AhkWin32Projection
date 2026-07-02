#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_observer_object_lost_ptr.ahk" { alljoyn_observer_object_lost_ptr }
#Import ".\alljoyn_observer_object_discovered_ptr.ahk" { alljoyn_observer_object_discovered_ptr }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_observerlistener_callback {
    #StructPack 8

    object_discovered : alljoyn_observer_object_discovered_ptr

    object_lost : alljoyn_observer_object_lost_ptr

}
