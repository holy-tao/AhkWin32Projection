#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_applicationstatelistener_state_ptr.ahk" { alljoyn_applicationstatelistener_state_ptr }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_applicationstatelistener_callbacks {
    #StructPack 8

    state : alljoyn_applicationstatelistener_state_ptr

}
