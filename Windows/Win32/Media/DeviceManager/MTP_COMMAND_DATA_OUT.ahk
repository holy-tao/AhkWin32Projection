#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MTP_COMMAND_DATA_OUT structure contains Media Transport Protocol (MTP) responses that are filled by the device driver on exiting a call to IWMDMDevice3::DeviceIoControl.
 * @remarks
 * The input buffer is expected to contain an appropriately filled out <a href="https://docs.microsoft.com/windows/desktop/api/mtpext/ns-mtpext-mtp_command_data_in">MTP_COMMAND_DATA_IN</a> structure. On exit, the device driver will fill out the <b>MTP_COMMAND_DATA_OUT</b> structure and save it to the output buffer. Therefore, any request must have an input buffer of at least SIZEOF_REQUIRED_COMMAND_DATA_IN bytes, which is defined as the following:
 * 
 * 
 * ``` syntax
 * @see https://learn.microsoft.com/windows/win32/api/mtpext/ns-mtpext-mtp_command_data_out
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct MTP_COMMAND_DATA_OUT {
    #StructPack 4

    /**
     * Response code.
     */
    ResponseCode : UInt16

    /**
     * Number of parameters for this response.
     */
    NumParams : UInt32

    /**
     * Parameters of the response. <b>MTP_RESPONSE_MAX_PARAMS</b> is a defined constant with a value of 5.
     */
    Params : UInt32[5]

    /**
     * Data size of <b>CommandReadData</b>[1], in bytes.
     */
    CommandReadDataSize : UInt32

    /**
     * Optional, first byte of data to read from the device if <b>MTP_COMMAND_DATA_IN.NextPhase</b> is MTP_NEXTPHASE_READ_DATA.
     */
    CommandReadData : Int8[1]

}
