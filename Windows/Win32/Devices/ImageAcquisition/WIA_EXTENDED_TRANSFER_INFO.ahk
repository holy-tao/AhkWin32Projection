#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WIA_EXTENDED_TRANSFER_INFO structure specifies extended transfer information for the IWiaDataTransfer::idtGetExtendedTransferInfo method.
 * @see https://docs.microsoft.com/windows/win32/api//wia_xp/ns-wia_xp-wia_extended_transfer_info
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class WIA_EXTENDED_TRANSFER_INFO extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Type: <b>ULONG</b>
     * 
     * Size of this structure.
     * @type {Integer}
     */
    ulSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Minimum buffer size the application should request in a call to <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiadatatransfer-idtgetbandeddata">IWiaDataTransfer::idtGetBandedData</a>.
     * @type {Integer}
     */
    ulMinBufferSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Driver-recommended buffer size the application should request in a call to <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiadatatransfer-idtgetbandeddata">IWiaDataTransfer::idtGetBandedData</a>.
     * @type {Integer}
     */
    ulOptimalBufferSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Driver-recommended maximum buffer size the application could request in a call to <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiadatatransfer-idtgetbandeddata">IWiaDataTransfer::idtGetBandedData</a>. Going over this limit is not detrimental, however, the driver can simply not use the whole buffer and limit each band of data to this maximum size.
     * @type {Integer}
     */
    ulMaxBufferSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * This value is not used and should be ignored.
     * @type {Integer}
     */
    ulNumBuffers {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
