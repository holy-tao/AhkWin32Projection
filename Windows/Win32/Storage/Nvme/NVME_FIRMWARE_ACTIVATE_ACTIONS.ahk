#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate the action that is taken on the image downloaded by the Firmware Image Download command or on a previously downloaded and placed image.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_firmware_activate_actions
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_FIRMWARE_ACTIVATE_ACTIONS extends Win32Enum {

    /**
     * The downloaded image replaces the image specified by the Firmware Slot field. This image is not activated.
     * Native name: NVME_FIRMWARE_ACTIVATE_ACTION_DOWNLOAD_TO_SLOT
     * @type {Integer (Int32)}
     */
    static ACTION_DOWNLOAD_TO_SLOT => 0

    /**
     * The downloaded image replaces the image specified by the Firmware Slot field. This image is activated at the next reset.
     * Native name: NVME_FIRMWARE_ACTIVATE_ACTION_DOWNLOAD_TO_SLOT_AND_ACTIVATE
     * @type {Integer (Int32)}
     */
    static ACTION_DOWNLOAD_TO_SLOT_AND_ACTIVATE => 1

    /**
     * The image specified by the Firmware Slot field is activated at the next reset.
     * Native name: NVME_FIRMWARE_ACTIVATE_ACTION_ACTIVATE
     * @type {Integer (Int32)}
     */
    static ACTION_ACTIVATE => 2

    /**
     * The image specified by the Firmware Slot field is requested to be activated immediately without reset.
     * Native name: NVME_FIRMWARE_ACTIVATE_ACTION_DOWNLOAD_TO_SLOT_AND_ACTIVATE_IMMEDIATE
     * @type {Integer (Int32)}
     */
    static ACTION_DOWNLOAD_TO_SLOT_AND_ACTIVATE_IMMEDIATE => 3
}
