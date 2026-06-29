#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WMIREGGUIDW.ahk" { WMIREGGUIDW }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct WMIREGINFOW {
    #StructPack 8

    BufferSize : UInt32

    NextWmiRegInfo : UInt32

    RegistryPath : UInt32

    MofResourceName : UInt32

    GuidCount : UInt32

    WmiRegGuid : WMIREGGUIDW[1]

}
