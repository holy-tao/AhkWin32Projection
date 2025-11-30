#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DEVICE_SELECTION_DEVICE_TYPE enumeration type indicates the type of a selected device.
 * @remarks
 * 
 * This enumeration type is pointed to by the <i>pnDeviceType</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquiredeviceselectiondialog-domodal">IPhotoAcquireDeviceSelectionDialog::DoModal</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//photoacquire/ne-photoacquire-device_selection_device_type
 * @namespace Windows.Win32.Media.PictureAcquisition
 * @version v4.0.30319
 */
class DEVICE_SELECTION_DEVICE_TYPE extends Win32Enum{

    /**
     * Specifies that the type of the selected device is unknown.
     * @type {Integer (Int32)}
     */
    static DST_UNKNOWN_DEVICE => 0

    /**
     * Specifies that the type of the selected device is Windows Portable Devices (WPD).
     * @type {Integer (Int32)}
     */
    static DST_WPD_DEVICE => 1

    /**
     * Specifies that the type of the selected device is Windows Image Acquisition (WIA).
     * @type {Integer (Int32)}
     */
    static DST_WIA_DEVICE => 2

    /**
     * Specifies that the type of the selected device is Still Image Architecture (STI).
     * @type {Integer (Int32)}
     */
    static DST_STI_DEVICE => 3

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static DSF_TWAIN_DEVICE => 4

    /**
     * Specifies that the selected device is a removable drive in the file system.
     * @type {Integer (Int32)}
     */
    static DST_FS_DEVICE => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DST_DV_DEVICE => 6
}
