#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_sessionportlistener_acceptsessionjoiner_ptr.ahk" { alljoyn_sessionportlistener_acceptsessionjoiner_ptr }
#Import ".\alljoyn_sessionportlistener_sessionjoined_ptr.ahk" { alljoyn_sessionportlistener_sessionjoined_ptr }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_sessionportlistener_callbacks {
    #StructPack 8

    accept_session_joiner : alljoyn_sessionportlistener_acceptsessionjoiner_ptr

    session_joined : alljoyn_sessionportlistener_sessionjoined_ptr

}
