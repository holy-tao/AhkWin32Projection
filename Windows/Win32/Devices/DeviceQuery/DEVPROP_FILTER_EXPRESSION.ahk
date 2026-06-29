#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Properties\DEVPROPSTORE.ahk" { DEVPROPSTORE }
#Import "..\Properties\DEVPROPCOMPKEY.ahk" { DEVPROPCOMPKEY }
#Import "..\Properties\DEVPROPTYPE.ahk" { DEVPROPTYPE }
#Import "..\Properties\DEVPROPERTY.ahk" { DEVPROPERTY }
#Import "..\..\Foundation\DEVPROPKEY.ahk" { DEVPROPKEY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DEVPROP_OPERATOR.ahk" { DEVPROP_OPERATOR }

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 */
export default struct DEVPROP_FILTER_EXPRESSION {
    #StructPack 8

    Operator : DEVPROP_OPERATOR

    Property : DEVPROPERTY

}
