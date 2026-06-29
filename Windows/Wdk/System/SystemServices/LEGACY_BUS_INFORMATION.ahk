#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INTERFACE_TYPE.ahk" { INTERFACE_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct LEGACY_BUS_INFORMATION {
    #StructPack 4

    BusTypeGuid : Guid

    LegacyBusType : INTERFACE_TYPE

    BusNumber : UInt32

}
