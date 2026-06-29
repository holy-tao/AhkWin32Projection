#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains fields that specify the information in an Endurance Group Information log page that indicates the amount of data being read from and written to an Endurance Group.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_endurance_group_log
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_ENDURANCE_GROUP_LOG {
    #StructPack 4

    Reserved0 : UInt32

    /**
     * The amount of spare capacity before the threshold is reached, expressed as a normalized percentage (0 to 100).
     */
    AvailableSpareThreshold : Int8

    /**
     * A vendor-specific estimate of the percentage of life used for the NVM set(s) in the Endurance Group, expressed in units of one billion.
     */
    PercentageUsed : Int8

    /**
     * A reserved field.
     */
    Reserved1 : Int8[26]

    /**
     * An estimate of the total number of data bytes written to NVM set(s) in the Endurance Group, expressed in units of one billion.
     */
    EnduranceEstimate : Int8[16]

    /**
     * The total number of data bytes read from NVM set(s) in the Endurance Group, expressed in units of one billion.
     */
    DataUnitsRead : Int8[16]

    /**
     * The total number of data bytes written to the NVM sets(s) in the Endurance Group, expressed in units of one billion.
     * 
     * This value only includes data written by the host.
     */
    DataUnitsWritten : Int8[16]

    /**
     * The total number of data bytes written to the NVM sets(s) in the Endurance Group, expressed in units of one billion.
     * 
     * This value includes data written by the host and the controller.
     */
    MediaUnitsWritten : Int8[16]

    /**
     * A reserved field.
     */
    Reserved2 : Int8[416]

}
