#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct WPD_COMMAND_ACCESS_LOOKUP_ENTRY {
    #StructPack 4

    Command : PROPERTYKEY

    AccessType : UInt32

    AccessProperty : PROPERTYKEY

}
