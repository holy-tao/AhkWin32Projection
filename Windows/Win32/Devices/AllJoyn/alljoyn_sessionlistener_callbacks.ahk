#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_sessionlistener_sessionmemberremoved_ptr.ahk" { alljoyn_sessionlistener_sessionmemberremoved_ptr }
#Import ".\alljoyn_sessionlistener_sessionlost_ptr.ahk" { alljoyn_sessionlistener_sessionlost_ptr }
#Import ".\alljoyn_sessionlistener_sessionmemberadded_ptr.ahk" { alljoyn_sessionlistener_sessionmemberadded_ptr }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_sessionlistener_callbacks {
    #StructPack 8

    session_lost : alljoyn_sessionlistener_sessionlost_ptr

    session_member_added : alljoyn_sessionlistener_sessionmemberadded_ptr

    session_member_removed : alljoyn_sessionlistener_sessionmemberremoved_ptr

}
