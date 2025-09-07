#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MTP_COMMAND_DATA_OUT structure contains Media Transport Protocol (MTP) responses that are filled by the device driver on exiting a call to IWMDMDevice3::DeviceIoControl.
 * @remarks
 * The input buffer is expected to contain an appropriately filled out <a href="https://docs.microsoft.com/windows/desktop/api/mtpext/ns-mtpext-mtp_command_data_in">MTP_COMMAND_DATA_IN</a> structure. On exit, the device driver will fill out the <b>MTP_COMMAND_DATA_OUT</b> structure and save it to the output buffer. Therefore, any request must have an input buffer of at least SIZEOF_REQUIRED_COMMAND_DATA_IN bytes, which is defined as the following:
  * 
  * 
  * ``` syntax
 * @see https://learn.microsoft.com/windows/win32/api/mtpext/ns-mtpext-mtp_command_data_out
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class MTP_COMMAND_DATA_OUT extends Win32Struct
{
    static sizeof => 31

    static packingSize => 1

    /**
     * Response code.
     * @type {Integer}
     */
    ResponseCode {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Number of parameters for this response.
     * @type {Integer}
     */
    NumParams {
        get => NumGet(this, 2, "uint")
        set => NumPut("uint", value, this, 2)
    }

    /**
     * Parameters of the response. <b>MTP_RESPONSE_MAX_PARAMS</b> is a defined constant with a value of 5.
     * @type {Array<UInt32>}
     */
    Params{
        get {
            if(!this.HasProp("__ParamsProxyArray"))
                this.__ParamsProxyArray := Win32FixedArray(this.ptr + 6, 4, Primitive, "uint")
            return this.__ParamsProxyArray
        }
    }

    /**
     * Data size of <b>CommandReadData</b>[1], in bytes.
     * @type {Integer}
     */
    CommandReadDataSize {
        get => NumGet(this, 26, "uint")
        set => NumPut("uint", value, this, 26)
    }

    /**
     * Optional, first byte of data to read from the device if <b>MTP_COMMAND_DATA_IN.NextPhase</b> is MTP_NEXTPHASE_READ_DATA.
     * @type {Array<Byte>}
     */
    CommandReadData{
        get {
            if(!this.HasProp("__CommandReadDataProxyArray"))
                this.__CommandReadDataProxyArray := Win32FixedArray(this.ptr + 30, 1, Primitive, "char")
            return this.__CommandReadDataProxyArray
        }
    }
}
