#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct WPD_COMMAND_ACCESS_LOOKUP_ENTRY {
    #StructPack 4

    Command : PROPERTYKEY

    AccessType : UInt32

    AccessProperty : PROPERTYKEY

}
