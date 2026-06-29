#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVPROPSTORE.ahk" { DEVPROPSTORE }
#Import "..\..\Foundation\DEVPROPKEY.ahk" { DEVPROPKEY }
#Import ".\DEVPROPCOMPKEY.ahk" { DEVPROPCOMPKEY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DEVPROPTYPE.ahk" { DEVPROPTYPE }

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
