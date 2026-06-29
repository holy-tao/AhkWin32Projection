#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_TELEMETRY_CONTROLLER_INITIATED_LOG {
    #StructPack 4

    LogIdentifier : Int8

    Reserved0 : Int8[4]

    OrganizationID : Int8[3]

    Area1LastBlock : UInt16

    Area2LastBlock : UInt16

    Area3LastBlock : UInt16

    Reserved1 : Int8[2]

    Area4LastBlock : UInt32

    Reserved2 : Int8[362]

    ControllerInitiatedDataAvailable : Int8

    ControllerInitiatedDataGenerationNumber : Int8

    ReasonIdentifier : Int8[128]

}
