#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVPROPCOMPKEY.ahk" { DEVPROPCOMPKEY }
#Import ".\DEVPROPSTORE.ahk" { DEVPROPSTORE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DEVPROPTYPE.ahk" { DEVPROPTYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\DEVPROPKEY.ahk" { DEVPROPKEY }

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
