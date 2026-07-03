#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_interfacedescription_member.ahk" { alljoyn_interfacedescription_member }
#Import ".\alljoyn_messagereceiver_methodhandler_ptr.ahk" { alljoyn_messagereceiver_methodhandler_ptr }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_busobject_methodentry {
    #StructPack 8

    member : alljoyn_interfacedescription_member.Ptr

    method_handler : alljoyn_messagereceiver_methodhandler_ptr

}
