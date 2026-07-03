#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\DEVPROP_OPERATOR.ahk" { DEVPROP_OPERATOR }
#Import "..\Properties\DEVPROPCOMPKEY.ahk" { DEVPROPCOMPKEY }
#Import "..\Properties\DEVPROPERTY.ahk" { DEVPROPERTY }
#Import "..\Properties\DEVPROPSTORE.ahk" { DEVPROPSTORE }
#Import "..\Properties\DEVPROPTYPE.ahk" { DEVPROPTYPE }
#Import "..\..\Foundation\DEVPROPKEY.ahk" { DEVPROPKEY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 */
export default struct DEVPROP_FILTER_EXPRESSION {
    #StructPack 8

    Operator : DEVPROP_OPERATOR

    Property : DEVPROPERTY

}
