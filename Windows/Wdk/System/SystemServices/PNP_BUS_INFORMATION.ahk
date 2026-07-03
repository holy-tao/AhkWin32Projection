#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\INTERFACE_TYPE.ahk" { INTERFACE_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PNP_BUS_INFORMATION {
    #StructPack 4

    BusTypeGuid : Guid

    LegacyBusType : INTERFACE_TYPE

    BusNumber : UInt32

}
