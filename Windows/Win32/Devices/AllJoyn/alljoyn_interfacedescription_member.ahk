#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_interfacedescription.ahk" { alljoyn_interfacedescription }
#Import ".\alljoyn_messagetype.ahk" { alljoyn_messagetype }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_interfacedescription_member {
    #StructPack 8

    iface : alljoyn_interfacedescription

    memberType : alljoyn_messagetype

    name : PSTR

    signature : PSTR

    returnSignature : PSTR

    argNames : PSTR

    internal_member : IntPtr

}
