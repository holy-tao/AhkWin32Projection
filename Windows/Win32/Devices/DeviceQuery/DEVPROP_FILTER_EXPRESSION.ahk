#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Properties\DEVPROPSTORE.ahk" { DEVPROPSTORE }
#Import "..\..\Foundation\DEVPROPKEY.ahk" { DEVPROPKEY }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Properties\DEVPROPTYPE.ahk" { DEVPROPTYPE }
#Import "..\Properties\DEVPROPERTY.ahk" { DEVPROPERTY }
#Import ".\DEVPROP_OPERATOR.ahk" { DEVPROP_OPERATOR }
#Import "..\Properties\DEVPROPCOMPKEY.ahk" { DEVPROPCOMPKEY }

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 */
export default struct DEVPROP_FILTER_EXPRESSION {
    #StructPack 8

    Operator : DEVPROP_OPERATOR

    Property : DEVPROPERTY

}
