#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_autopinger_destination_found_ptr.ahk" { alljoyn_autopinger_destination_found_ptr }
#Import ".\alljoyn_autopinger_destination_lost_ptr.ahk" { alljoyn_autopinger_destination_lost_ptr }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_pinglistener_callback {
    #StructPack 8

    destination_found : alljoyn_autopinger_destination_found_ptr

    destination_lost : alljoyn_autopinger_destination_lost_ptr

}
