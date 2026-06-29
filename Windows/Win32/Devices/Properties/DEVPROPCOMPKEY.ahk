#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVPROPSTORE.ahk" { DEVPROPSTORE }
#Import "..\..\Foundation\DEVPROPKEY.ahk" { DEVPROPKEY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Devices.Properties
 */
export default struct DEVPROPCOMPKEY {
    #StructPack 8

    Key : DEVPROPKEY

    Store : DEVPROPSTORE

    LocaleName : PWSTR

}
