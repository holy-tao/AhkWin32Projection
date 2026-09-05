#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PROGRESS_DIALOG_IMAGE_TYPE enumeration type indicates the image type set in IPhotoProgressDialog::SetImage.
 * @see https://learn.microsoft.com/windows/win32/api/photoacquire/ne-photoacquire-progress_dialog_image_type
 * @namespace Windows.Win32.Media.PictureAcquisition
 */
class PROGRESS_DIALOG_IMAGE_TYPE extends Win32Enum {

    /**
     * Specifies the small icon used in the title bar (normally 16 x 16 pixels).
     * Native name: PROGRESS_DIALOG_ICON_SMALL
     * @type {Integer (Int32)}
     */
    static ICON_SMALL => 0

    /**
     * Specifies the icon used to represent the progress dialog box in ALT+TAB key combination windows (normally 32 x 32 pixels).
     * Native name: PROGRESS_DIALOG_ICON_LARGE
     * @type {Integer (Int32)}
     */
    static ICON_LARGE => 1

    /**
     * Specifies an icon used in place of the thumbnail (up to 128 x 128 pixels).
     * Native name: PROGRESS_DIALOG_ICON_THUMBNAIL
     * @type {Integer (Int32)}
     */
    static ICON_THUMBNAIL => 2

    /**
     * Specifies a bitmap thumbnail (up to 128 x 128 pixels, although it will be scaled to fit if it is too large).
     * Native name: PROGRESS_DIALOG_BITMAP_THUMBNAIL
     * @type {Integer (Int32)}
     */
    static BITMAP_THUMBNAIL => 3
}
