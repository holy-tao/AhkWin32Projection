#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WIA_DATA_TRANSFER_INFO structure is used by applications to describe the buffer used to retrieve bands of data from Windows Image Acquisition (WIA) devices. It is primarily used in conjunction with the methods of the IWiaDataTransfer interface.
 * @see https://docs.microsoft.com/windows/win32/api//wia_xp/ns-wia_xp-wia_data_transfer_info
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class WIA_DATA_TRANSFER_INFO extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Type: <b>ULONG</b>
     * 
     * Contains the size of this structure. Must be set to <b>sizeof(WIA_DATA_TRANSFER_INFO)</b> before your application passes this structure to any WIA interface methods.
     * @type {Integer}
     */
    ulSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Specifies an optional handle to a shared section of memory allocated by the application. If this member is set to <b>NULL</b>, <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiadatatransfer-idtgetbandeddata">IWiaDataTransfer::idtGetBandedData</a> allocates the shared memory itself.
     * @type {Integer}
     */
    ulSection {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The size in bytes of the buffer that is used for the data transfer.
     * @type {Integer}
     */
    ulBufferSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Contains <b>TRUE</b> if the device is double buffered, <b>FALSE</b> if the device is not double buffered.
     * @type {BOOL}
     */
    bDoubleBuffer {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Reserved for use by the WIA system DLLs. Must be set to zero.
     * @type {Integer}
     */
    ulReserved1 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Reserved for use by the WIA system DLLs. Must be set to zero.
     * @type {Integer}
     */
    ulReserved2 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Reserved for use by the WIA system DLLs. Must be set to zero.
     * @type {Integer}
     */
    ulReserved3 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
