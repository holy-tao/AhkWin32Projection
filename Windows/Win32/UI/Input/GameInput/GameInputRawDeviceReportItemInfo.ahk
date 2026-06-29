#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputRawDeviceItemCollectionInfo.ahk" { GameInputRawDeviceItemCollectionInfo }
#Import ".\GameInputRawDevicePhysicalUnitKind.ahk" { GameInputRawDevicePhysicalUnitKind }
#Import ".\GameInputString.ahk" { GameInputString }
#Import ".\GameInputUsage.ahk" { GameInputUsage }
#Import ".\GameInputRawDeviceReportItemFlags.ahk" { GameInputRawDeviceReportItemFlags }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputRawDeviceReportItemInfo {
    #StructPack 8

    bitOffset : UInt32

    bitSize : UInt32

    logicalMin : Int64

    logicalMax : Int64

    physicalMin : Float64

    physicalMax : Float64

    physicalUnits : GameInputRawDevicePhysicalUnitKind

    rawPhysicalUnits : UInt32

    rawPhysicalUnitsExponent : Int32

    flags : GameInputRawDeviceReportItemFlags

    usageCount : UInt32

    usages : GameInputUsage.Ptr

    collection : GameInputRawDeviceItemCollectionInfo.Ptr

    itemString : GameInputString.Ptr

}
