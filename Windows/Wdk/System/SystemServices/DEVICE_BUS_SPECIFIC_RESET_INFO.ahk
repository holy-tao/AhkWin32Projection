#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DEVICE_BUS_SPECIFIC_RESET_INFO {
    #StructPack 8

    BusTypeGuid : Guid

    ResetTypeSupported : IntPtr

}
