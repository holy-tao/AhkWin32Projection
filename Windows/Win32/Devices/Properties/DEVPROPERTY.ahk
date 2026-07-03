#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DEVPROPCOMPKEY.ahk" { DEVPROPCOMPKEY }
#Import ".\DEVPROPSTORE.ahk" { DEVPROPSTORE }
#Import ".\DEVPROPTYPE.ahk" { DEVPROPTYPE }
#Import "..\..\Foundation\DEVPROPKEY.ahk" { DEVPROPKEY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Devices.Properties
 */
export default struct DEVPROPERTY {
    #StructPack 8

    CompKey : DEVPROPCOMPKEY

    Type : DEVPROPTYPE

    BufferSize : UInt32

    Buffer : IntPtr

}
