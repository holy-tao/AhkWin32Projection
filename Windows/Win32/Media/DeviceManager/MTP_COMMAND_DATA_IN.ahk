#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MTP_COMMAND_DATA_IN structure contains Media Transport Protocol (MTP) custom commands that are sent to the device by using the IWMDMDevice3::DeviceIoControl method.
 * @remarks
 * The input buffer is expected to contain an appropriately filled out <b>MTP_COMMAND_DATA_IN</b> structure. On exit, the device driver will fill out the <b>MTP_COMMAND_DATA_OUT</b> structure and save it to the output buffer. Therefore, any request must have an input buffer of at least SIZEOF_REQUIRED_COMMAND_DATA_IN bytes, which is defined as
  * 
  * 
  * ``` syntax
 * @see https://learn.microsoft.com/windows/win32/api/mtpext/ns-mtpext-mtp_command_data_in
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class MTP_COMMAND_DATA_IN extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * Operation code.
     * @type {Integer}
     */
    OpCode {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Number of parameters passed in.
     * @type {Integer}
     */
    NumParams {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Parameters to the command. <b>MTP_COMMAND_MAX_PARAMS</b> is a defined constant with a value of 5.
     * @type {Array<UInt32>}
     */
    Params{
        get {
            if(!this.HasProp("__ParamsProxyArray"))
                this.__ParamsProxyArray := Win32FixedArray(this.ptr + 8, 5, Primitive, "uint")
            return this.__ParamsProxyArray
        }
    }

    /**
     * Indicates whether the command has a read data phase, a write data phase, or no data phase. The valid values are defined in the following table.
     * @type {Integer}
     */
    NextPhase {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Data size of <b>CommandWriteData</b>[1], in bytes.
     * @type {Integer}
     */
    CommandWriteDataSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Optional, first byte of data to write to the device if <b>NextPhase</b> is MTP_NEXTPHASE_WRITE_DATA.
     * @type {Array<Byte>}
     */
    CommandWriteData{
        get {
            if(!this.HasProp("__CommandWriteDataProxyArray"))
                this.__CommandWriteDataProxyArray := Win32FixedArray(this.ptr + 36, 1, Primitive, "char")
            return this.__CommandWriteDataProxyArray
        }
    }
}
