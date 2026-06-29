#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct MU_TELEMETRY_SECTION {
    #StructPack 8

    ComponentID : Guid

    SubComponentID : Guid

    Reserved : UInt32

    ErrorStatusValue : UInt32

    AdditionalInfo1 : Int64

    AdditionalInfo2 : Int64

}
