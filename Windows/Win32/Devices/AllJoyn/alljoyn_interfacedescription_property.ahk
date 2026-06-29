#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_interfacedescription_property {
    #StructPack 8

    name : PSTR

    signature : PSTR

    access : Int8

    internal_property : IntPtr

}
