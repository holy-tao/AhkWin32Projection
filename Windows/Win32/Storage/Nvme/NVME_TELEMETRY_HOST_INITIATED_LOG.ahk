#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains fields that specify the information in a Telemetry Host-Initiated Log page.
 * @remarks
 * All NVMe Telemetry Data Blocks are 512 bytes in size.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_telemetry_host_initiated_log
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_TELEMETRY_HOST_INITIATED_LOG {
    #StructPack 4

    /**
     * Indicates the log identifier.
     */
    LogIdentifier : Int8

    /**
     * Bytes 1-4 are reserved.
     */
    Reserved0 : Int8[4]

    /**
     * Indicates an IEEE Organizationally Unique Identifier (OUI) that is the Organization ID.
     */
    OrganizationID : Int8[3]

    /**
     * Bytes 8-9 indicate the last block of Area 1.
     */
    Area1LastBlock : UInt16

    /**
     * Bytes 10-11 indicate the last block of Area 2.
     */
    Area2LastBlock : UInt16

    /**
     * Bytes 12-13 indicate the last block of Area 3.
     */
    Area3LastBlock : UInt16

    /**
     * Bytes 14-381 are reserved.
     */
    Reserved1 : Int8[2]

    Area4LastBlock : UInt32

    Reserved2 : Int8[361]

    HostInitiatedDataGenerationNumber : Int8

    /**
     * Byte 382 indicates whether controller initiated data is available.
     */
    ControllerInitiatedDataAvailable : Int8

    /**
     * Byte 383 indicates the generation number of controller initiated data when it is available.
     */
    ControllerInitiatedDataGenerationNumber : Int8

    /**
     * Bytes 384-511 indicate the reason identifier.
     */
    ReasonIdentifier : Int8[128]

}
