#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The WiaTransferParams is transmitted to an application during a data transfer by the Windows Image Acquisition (WIA) run-time system to the IWiaTransferCallback::TransferCallback method.
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-wiatransferparams
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct WiaTransferParams {
    #StructPack 8

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
     */
    lMessage : Int32

    /**
     * Type: **LONG**
     * 
     * 
     * Indicates the progress of the data transfer as a percentage.
     */
    lPercentComplete : Int32

    /**
     * Type: **ULONG64**
     * 
     * 
     * Indicates the amount of data transferred.
     */
    ulTransferredBytes : Int64

    /**
     * Type: **HRESULT**
     * 
     * 
     * The status, or error state, of the device set by the driver; for example, "warming up".
     */
    hrErrorStatus : HRESULT

}
