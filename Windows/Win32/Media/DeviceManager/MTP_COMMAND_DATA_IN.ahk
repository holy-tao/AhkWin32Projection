#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MTP_COMMAND_DATA_IN structure contains Media Transport Protocol (MTP) custom commands that are sent to the device by using the IWMDMDevice3::DeviceIoControl method.
 * @remarks
 * The input buffer is expected to contain an appropriately filled out <b>MTP_COMMAND_DATA_IN</b> structure. On exit, the device driver will fill out the <b>MTP_COMMAND_DATA_OUT</b> structure and save it to the output buffer. Therefore, any request must have an input buffer of at least SIZEOF_REQUIRED_COMMAND_DATA_IN bytes, which is defined as
 * 
 * 
 * ``` syntax
 * @see https://learn.microsoft.com/windows/win32/api/mtpext/ns-mtpext-mtp_command_data_in
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct MTP_COMMAND_DATA_IN {
    #StructPack 4

    /**
     * Operation code.
     */
    OpCode : UInt16

    /**
     * Number of parameters passed in.
     */
    NumParams : UInt32

    /**
     * Parameters to the command. <b>MTP_COMMAND_MAX_PARAMS</b> is a defined constant with a value of 5.
     */
    Params : UInt32[5]

    /**
     * Indicates whether the command has a read data phase, a write data phase, or no data phase. The valid values are defined in the following table.
     */
    NextPhase : UInt32

    /**
     * Data size of <b>CommandWriteData</b>[1], in bytes.
     */
    CommandWriteDataSize : UInt32

    /**
     * Optional, first byte of data to write to the device if <b>NextPhase</b> is MTP_NEXTPHASE_WRITE_DATA.
     */
    CommandWriteData : Int8[1]

}
