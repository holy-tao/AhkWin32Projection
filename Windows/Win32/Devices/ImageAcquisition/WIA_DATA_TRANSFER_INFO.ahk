#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The WIA_DATA_TRANSFER_INFO structure is used by applications to describe the buffer used to retrieve bands of data from Windows Image Acquisition (WIA) devices. It is primarily used in conjunction with the methods of the IWiaDataTransfer interface.
 * @see https://learn.microsoft.com/windows/win32/api/wia_xp/ns-wia_xp-wia_data_transfer_info
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct WIA_DATA_TRANSFER_INFO {
    #StructPack 4

    /**
     * Type: <b>ULONG</b>
     * 
     * Contains the size of this structure. Must be set to <b>sizeof(WIA_DATA_TRANSFER_INFO)</b> before your application passes this structure to any WIA interface methods.
     */
    ulSize : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * Specifies an optional handle to a shared section of memory allocated by the application. If this member is set to <b>NULL</b>, <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiadatatransfer-idtgetbandeddata">IWiaDataTransfer::idtGetBandedData</a> allocates the shared memory itself.
     */
    ulSection : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * The size in bytes of the buffer that is used for the data transfer.
     */
    ulBufferSize : UInt32

    /**
     * Type: <b>BOOL</b>
     * 
     * Contains <b>TRUE</b> if the device is double buffered, <b>FALSE</b> if the device is not double buffered.
     */
    bDoubleBuffer : BOOL

    /**
     * Type: <b>ULONG</b>
     * 
     * Reserved for use by the WIA system DLLs. Must be set to zero.
     */
    ulReserved1 : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * Reserved for use by the WIA system DLLs. Must be set to zero.
     */
    ulReserved2 : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * Reserved for use by the WIA system DLLs. Must be set to zero.
     */
    ulReserved3 : UInt32

}
