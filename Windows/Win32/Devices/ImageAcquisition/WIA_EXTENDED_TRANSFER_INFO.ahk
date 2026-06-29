#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WIA_EXTENDED_TRANSFER_INFO structure specifies extended transfer information for the IWiaDataTransfer::idtGetExtendedTransferInfo method.
 * @see https://learn.microsoft.com/windows/win32/api/wia_xp/ns-wia_xp-wia_extended_transfer_info
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct WIA_EXTENDED_TRANSFER_INFO {
    #StructPack 4

    /**
     * Type: <b>ULONG</b>
     * 
     * Size of this structure.
     */
    ulSize : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * Minimum buffer size the application should request in a call to <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiadatatransfer-idtgetbandeddata">IWiaDataTransfer::idtGetBandedData</a>.
     */
    ulMinBufferSize : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * Driver-recommended buffer size the application should request in a call to <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiadatatransfer-idtgetbandeddata">IWiaDataTransfer::idtGetBandedData</a>.
     */
    ulOptimalBufferSize : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * Driver-recommended maximum buffer size the application could request in a call to <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiadatatransfer-idtgetbandeddata">IWiaDataTransfer::idtGetBandedData</a>. Going over this limit is not detrimental, however, the driver can simply not use the whole buffer and limit each band of data to this maximum size.
     */
    ulMaxBufferSize : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * This value is not used and should be ignored.
     */
    ulNumBuffers : UInt32

}
