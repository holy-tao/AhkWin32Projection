#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVPROPKEY.ahk" { DEVPROPKEY }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Properties\DEVPROPTYPE.ahk" { DEVPROPTYPE }

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 */
export default struct DEV_QUERY_PARAMETER {
    #StructPack 8

    Key : DEVPROPKEY

    Type : DEVPROPTYPE

    BufferSize : UInt32

    Buffer : IntPtr

}
