#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WiaTransferParams is transmitted to an application during a data transfer by the Windows Image Acquisition (WIA) run-time system to the IWiaTransferCallback::TransferCallback method.
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-wiatransferparams
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class WiaTransferParams extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: **LONG**
     * 
     * 
     * Indicates the status of the data transfer.
     * 
     * 
     * <span id="WIA_TRANSFER_MSG_STATUS"></span><span id="wia_transfer_msg_status"></span>
     * 
     * <span id="WIA_TRANSFER_MSG_STATUS"></span><span id="wia_transfer_msg_status"></span>**WIA\_TRANSFER\_MSG\_STATUS**
     * 
     * 
     * 
     * <span id="WIA_TRANSFER_MSG_END_OF_STREAM"></span><span id="wia_transfer_msg_end_of_stream"></span>
     * 
     * <span id="WIA_TRANSFER_MSG_END_OF_STREAM"></span><span id="wia_transfer_msg_end_of_stream"></span>**WIA\_TRANSFER\_MSG\_END\_OF\_STREAM**
     * 
     * 
     * 
     * <span id="WIA_TRANSFER_MSG_END_OF_TRANSFER"></span><span id="wia_transfer_msg_end_of_transfer"></span>
     * 
     * <span id="WIA_TRANSFER_MSG_END_OF_TRANSFER"></span><span id="wia_transfer_msg_end_of_transfer"></span>**WIA\_TRANSFER\_MSG\_END\_OF\_TRANSFER**
     * 
     * 
     * 
     * <span id="WIA_TRANSFER_MSG_DEVICE_STATUS"></span><span id="wia_transfer_msg_device_status"></span>
     * 
     * <span id="WIA_TRANSFER_MSG_DEVICE_STATUS"></span><span id="wia_transfer_msg_device_status"></span>**WIA\_TRANSFER\_MSG\_DEVICE\_STATUS**
     * 
     * 
     * 
     * <span id="WIA_TRANSFER_MSG_NEW_PAGE"></span><span id="wia_transfer_msg_new_page"></span>
     * 
     * <span id="WIA_TRANSFER_MSG_NEW_PAGE"></span><span id="wia_transfer_msg_new_page"></span>**WIA\_TRANSFER\_MSG\_NEW\_PAGE**
     * @type {Integer}
     */
    lMessage {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: **LONG**
     * 
     * 
     * Indicates the progress of the data transfer as a percentage.
     * @type {Integer}
     */
    lPercentComplete {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: **ULONG64**
     * 
     * 
     * Indicates the amount of data transferred.
     * @type {Integer}
     */
    ulTransferredBytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **HRESULT**
     * 
     * 
     * The status, or error state, of the device set by the driver; for example, "warming up".
     * @type {Integer}
     */
    hrErrorStatus {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
