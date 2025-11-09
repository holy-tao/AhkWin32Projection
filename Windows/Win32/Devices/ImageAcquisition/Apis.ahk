#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class ImageAcquisition {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DIP_DEV_ID => 2

    /**
     * @type {String}
     */
    static WIA_DIP_DEV_ID_STR => "Unique Device ID"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DIP_VEND_DESC => 3

    /**
     * @type {String}
     */
    static WIA_DIP_VEND_DESC_STR => "Manufacturer"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DIP_DEV_DESC => 4

    /**
     * @type {String}
     */
    static WIA_DIP_DEV_DESC_STR => "Description"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DIP_DEV_TYPE => 5

    /**
     * @type {String}
     */
    static WIA_DIP_DEV_TYPE_STR => "Type"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DIP_PORT_NAME => 6

    /**
     * @type {String}
     */
    static WIA_DIP_PORT_NAME_STR => "Port"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DIP_DEV_NAME => 7

    /**
     * @type {String}
     */
    static WIA_DIP_DEV_NAME_STR => "Name"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DIP_SERVER_NAME => 8

    /**
     * @type {String}
     */
    static WIA_DIP_SERVER_NAME_STR => "Server"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DIP_REMOTE_DEV_ID => 9

    /**
     * @type {String}
     */
    static WIA_DIP_REMOTE_DEV_ID_STR => "Remote Device ID"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DIP_UI_CLSID => 10

    /**
     * @type {String}
     */
    static WIA_DIP_UI_CLSID_STR => "UI Class ID"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DIP_HW_CONFIG => 11

    /**
     * @type {String}
     */
    static WIA_DIP_HW_CONFIG_STR => "Hardware Configuration"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DIP_BAUDRATE => 12

    /**
     * @type {String}
     */
    static WIA_DIP_BAUDRATE_STR => "BaudRate"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DIP_STI_GEN_CAPABILITIES => 13

    /**
     * @type {String}
     */
    static WIA_DIP_STI_GEN_CAPABILITIES_STR => "STI Generic Capabilities"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DIP_WIA_VERSION => 14

    /**
     * @type {String}
     */
    static WIA_DIP_WIA_VERSION_STR => "WIA Version"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DIP_DRIVER_VERSION => 15

    /**
     * @type {String}
     */
    static WIA_DIP_DRIVER_VERSION_STR => "Driver Version"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DIP_PNP_ID => 16

    /**
     * @type {String}
     */
    static WIA_DIP_PNP_ID_STR => "PnP ID String"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DIP_STI_DRIVER_VERSION => 17

    /**
     * @type {String}
     */
    static WIA_DIP_STI_DRIVER_VERSION_STR => "STI Driver Version"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPA_FIRMWARE_VERSION => 1026

    /**
     * @type {String}
     */
    static WIA_DPA_FIRMWARE_VERSION_STR => "Firmware Version"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPA_CONNECT_STATUS => 1027

    /**
     * @type {String}
     */
    static WIA_DPA_CONNECT_STATUS_STR => "Connect Status"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPA_DEVICE_TIME => 1028

    /**
     * @type {String}
     */
    static WIA_DPA_DEVICE_TIME_STR => "Device Time"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_PICTURES_TAKEN => 2050

    /**
     * @type {String}
     */
    static WIA_DPC_PICTURES_TAKEN_STR => "Pictures Taken"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_PICTURES_REMAINING => 2051

    /**
     * @type {String}
     */
    static WIA_DPC_PICTURES_REMAINING_STR => "Pictures Remaining"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_EXPOSURE_MODE => 2052

    /**
     * @type {String}
     */
    static WIA_DPC_EXPOSURE_MODE_STR => "Exposure Mode"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_EXPOSURE_COMP => 2053

    /**
     * @type {String}
     */
    static WIA_DPC_EXPOSURE_COMP_STR => "Exposure Compensation"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_EXPOSURE_TIME => 2054

    /**
     * @type {String}
     */
    static WIA_DPC_EXPOSURE_TIME_STR => "Exposure Time"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_FNUMBER => 2055

    /**
     * @type {String}
     */
    static WIA_DPC_FNUMBER_STR => "F Number"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_FLASH_MODE => 2056

    /**
     * @type {String}
     */
    static WIA_DPC_FLASH_MODE_STR => "Flash Mode"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_FOCUS_MODE => 2057

    /**
     * @type {String}
     */
    static WIA_DPC_FOCUS_MODE_STR => "Focus Mode"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_FOCUS_MANUAL_DIST => 2058

    /**
     * @type {String}
     */
    static WIA_DPC_FOCUS_MANUAL_DIST_STR => "Focus Manual Dist"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_ZOOM_POSITION => 2059

    /**
     * @type {String}
     */
    static WIA_DPC_ZOOM_POSITION_STR => "Zoom Position"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_PAN_POSITION => 2060

    /**
     * @type {String}
     */
    static WIA_DPC_PAN_POSITION_STR => "Pan Position"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_TILT_POSITION => 2061

    /**
     * @type {String}
     */
    static WIA_DPC_TILT_POSITION_STR => "Tilt Position"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_TIMER_MODE => 2062

    /**
     * @type {String}
     */
    static WIA_DPC_TIMER_MODE_STR => "Timer Mode"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_TIMER_VALUE => 2063

    /**
     * @type {String}
     */
    static WIA_DPC_TIMER_VALUE_STR => "Timer Value"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_POWER_MODE => 2064

    /**
     * @type {String}
     */
    static WIA_DPC_POWER_MODE_STR => "Power Mode"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_BATTERY_STATUS => 2065

    /**
     * @type {String}
     */
    static WIA_DPC_BATTERY_STATUS_STR => "Battery Status"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_THUMB_WIDTH => 2066

    /**
     * @type {String}
     */
    static WIA_DPC_THUMB_WIDTH_STR => "Thumbnail Width"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_THUMB_HEIGHT => 2067

    /**
     * @type {String}
     */
    static WIA_DPC_THUMB_HEIGHT_STR => "Thumbnail Height"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_PICT_WIDTH => 2068

    /**
     * @type {String}
     */
    static WIA_DPC_PICT_WIDTH_STR => "Picture Width"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_PICT_HEIGHT => 2069

    /**
     * @type {String}
     */
    static WIA_DPC_PICT_HEIGHT_STR => "Picture Height"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_DIMENSION => 2070

    /**
     * @type {String}
     */
    static WIA_DPC_DIMENSION_STR => "Dimension"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_COMPRESSION_SETTING => 2071

    /**
     * @type {String}
     */
    static WIA_DPC_COMPRESSION_SETTING_STR => "Compression Setting"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_FOCUS_METERING => 2072

    /**
     * @type {String}
     */
    static WIA_DPC_FOCUS_METERING_STR => "Focus Metering Mode"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_TIMELAPSE_INTERVAL => 2073

    /**
     * @type {String}
     */
    static WIA_DPC_TIMELAPSE_INTERVAL_STR => "Timelapse Interval"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_TIMELAPSE_NUMBER => 2074

    /**
     * @type {String}
     */
    static WIA_DPC_TIMELAPSE_NUMBER_STR => "Timelapse Number"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_BURST_INTERVAL => 2075

    /**
     * @type {String}
     */
    static WIA_DPC_BURST_INTERVAL_STR => "Burst Interval"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_BURST_NUMBER => 2076

    /**
     * @type {String}
     */
    static WIA_DPC_BURST_NUMBER_STR => "Burst Number"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_EFFECT_MODE => 2077

    /**
     * @type {String}
     */
    static WIA_DPC_EFFECT_MODE_STR => "Effect Mode"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_DIGITAL_ZOOM => 2078

    /**
     * @type {String}
     */
    static WIA_DPC_DIGITAL_ZOOM_STR => "Digital Zoom"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_SHARPNESS => 2079

    /**
     * @type {String}
     */
    static WIA_DPC_SHARPNESS_STR => "Sharpness"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_CONTRAST => 2080

    /**
     * @type {String}
     */
    static WIA_DPC_CONTRAST_STR => "Contrast"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_CAPTURE_MODE => 2081

    /**
     * @type {String}
     */
    static WIA_DPC_CAPTURE_MODE_STR => "Capture Mode"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_CAPTURE_DELAY => 2082

    /**
     * @type {String}
     */
    static WIA_DPC_CAPTURE_DELAY_STR => "Capture Delay"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_EXPOSURE_INDEX => 2083

    /**
     * @type {String}
     */
    static WIA_DPC_EXPOSURE_INDEX_STR => "Exposure Index"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_EXPOSURE_METERING_MODE => 2084

    /**
     * @type {String}
     */
    static WIA_DPC_EXPOSURE_METERING_MODE_STR => "Exposure Metering Mode"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_FOCUS_METERING_MODE => 2085

    /**
     * @type {String}
     */
    static WIA_DPC_FOCUS_METERING_MODE_STR => "Focus Metering Mode"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_FOCUS_DISTANCE => 2086

    /**
     * @type {String}
     */
    static WIA_DPC_FOCUS_DISTANCE_STR => "Focus Distance"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_FOCAL_LENGTH => 2087

    /**
     * @type {String}
     */
    static WIA_DPC_FOCAL_LENGTH_STR => "Focus Length"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_RGB_GAIN => 2088

    /**
     * @type {String}
     */
    static WIA_DPC_RGB_GAIN_STR => "RGB Gain"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_WHITE_BALANCE => 2089

    /**
     * @type {String}
     */
    static WIA_DPC_WHITE_BALANCE_STR => "White Balance"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_UPLOAD_URL => 2090

    /**
     * @type {String}
     */
    static WIA_DPC_UPLOAD_URL_STR => "Upload URL"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_ARTIST => 2091

    /**
     * @type {String}
     */
    static WIA_DPC_ARTIST_STR => "Artist"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPC_COPYRIGHT_INFO => 2092

    /**
     * @type {String}
     */
    static WIA_DPC_COPYRIGHT_INFO_STR => "Copyright Info"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_HORIZONTAL_BED_SIZE => 3074

    /**
     * @type {String}
     */
    static WIA_DPS_HORIZONTAL_BED_SIZE_STR => "Horizontal Bed Size"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_VERTICAL_BED_SIZE => 3075

    /**
     * @type {String}
     */
    static WIA_DPS_VERTICAL_BED_SIZE_STR => "Vertical Bed Size"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_HORIZONTAL_SHEET_FEED_SIZE => 3076

    /**
     * @type {String}
     */
    static WIA_DPS_HORIZONTAL_SHEET_FEED_SIZE_STR => "Horizontal Sheet Feed Size"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_VERTICAL_SHEET_FEED_SIZE => 3077

    /**
     * @type {String}
     */
    static WIA_DPS_VERTICAL_SHEET_FEED_SIZE_STR => "Vertical Sheet Feed Size"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_SHEET_FEEDER_REGISTRATION => 3078

    /**
     * @type {String}
     */
    static WIA_DPS_SHEET_FEEDER_REGISTRATION_STR => "Sheet Feeder Registration"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_HORIZONTAL_BED_REGISTRATION => 3079

    /**
     * @type {String}
     */
    static WIA_DPS_HORIZONTAL_BED_REGISTRATION_STR => "Horizontal Bed Registration"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_VERTICAL_BED_REGISTRATION => 3080

    /**
     * @type {String}
     */
    static WIA_DPS_VERTICAL_BED_REGISTRATION_STR => "Vertical Bed Registration"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_PLATEN_COLOR => 3081

    /**
     * @type {String}
     */
    static WIA_DPS_PLATEN_COLOR_STR => "Platen Color"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_PAD_COLOR => 3082

    /**
     * @type {String}
     */
    static WIA_DPS_PAD_COLOR_STR => "Pad Color"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_FILTER_SELECT => 3083

    /**
     * @type {String}
     */
    static WIA_DPS_FILTER_SELECT_STR => "Filter Select"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_DITHER_SELECT => 3084

    /**
     * @type {String}
     */
    static WIA_DPS_DITHER_SELECT_STR => "Dither Select"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_DITHER_PATTERN_DATA => 3085

    /**
     * @type {String}
     */
    static WIA_DPS_DITHER_PATTERN_DATA_STR => "Dither Pattern Data"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_DOCUMENT_HANDLING_CAPABILITIES => 3086

    /**
     * @type {String}
     */
    static WIA_DPS_DOCUMENT_HANDLING_CAPABILITIES_STR => "Document Handling Capabilities"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_DOCUMENT_HANDLING_STATUS => 3087

    /**
     * @type {String}
     */
    static WIA_DPS_DOCUMENT_HANDLING_STATUS_STR => "Document Handling Status"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_DOCUMENT_HANDLING_SELECT => 3088

    /**
     * @type {String}
     */
    static WIA_DPS_DOCUMENT_HANDLING_SELECT_STR => "Document Handling Select"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_DOCUMENT_HANDLING_CAPACITY => 3089

    /**
     * @type {String}
     */
    static WIA_DPS_DOCUMENT_HANDLING_CAPACITY_STR => "Document Handling Capacity"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_OPTICAL_XRES => 3090

    /**
     * @type {String}
     */
    static WIA_DPS_OPTICAL_XRES_STR => "Horizontal Optical Resolution"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_OPTICAL_YRES => 3091

    /**
     * @type {String}
     */
    static WIA_DPS_OPTICAL_YRES_STR => "Vertical Optical Resolution"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_ENDORSER_CHARACTERS => 3092

    /**
     * @type {String}
     */
    static WIA_DPS_ENDORSER_CHARACTERS_STR => "Endorser Characters"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_ENDORSER_STRING => 3093

    /**
     * @type {String}
     */
    static WIA_DPS_ENDORSER_STRING_STR => "Endorser String"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_SCAN_AHEAD_PAGES => 3094

    /**
     * @type {String}
     */
    static WIA_DPS_SCAN_AHEAD_PAGES_STR => "Scan Ahead Pages"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_MAX_SCAN_TIME => 3095

    /**
     * @type {String}
     */
    static WIA_DPS_MAX_SCAN_TIME_STR => "Max Scan Time"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_PAGES => 3096

    /**
     * @type {String}
     */
    static WIA_DPS_PAGES_STR => "Pages"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_PAGE_SIZE => 3097

    /**
     * @type {String}
     */
    static WIA_DPS_PAGE_SIZE_STR => "Page Size"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_PAGE_WIDTH => 3098

    /**
     * @type {String}
     */
    static WIA_DPS_PAGE_WIDTH_STR => "Page Width"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_PAGE_HEIGHT => 3099

    /**
     * @type {String}
     */
    static WIA_DPS_PAGE_HEIGHT_STR => "Page Height"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_PREVIEW => 3100

    /**
     * @type {String}
     */
    static WIA_DPS_PREVIEW_STR => "Preview"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_TRANSPARENCY => 3101

    /**
     * @type {String}
     */
    static WIA_DPS_TRANSPARENCY_STR => "Transparency Adapter"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_TRANSPARENCY_SELECT => 3102

    /**
     * @type {String}
     */
    static WIA_DPS_TRANSPARENCY_SELECT_STR => "Transparency Adapter Select"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_SHOW_PREVIEW_CONTROL => 3103

    /**
     * @type {String}
     */
    static WIA_DPS_SHOW_PREVIEW_CONTROL_STR => "Show preview control"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_MIN_HORIZONTAL_SHEET_FEED_SIZE => 3104

    /**
     * @type {String}
     */
    static WIA_DPS_MIN_HORIZONTAL_SHEET_FEED_SIZE_STR => "Minimum Horizontal Sheet Feed Size"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_MIN_VERTICAL_SHEET_FEED_SIZE => 3105

    /**
     * @type {String}
     */
    static WIA_DPS_MIN_VERTICAL_SHEET_FEED_SIZE_STR => "Minimum Vertical Sheet Feed Size"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_TRANSPARENCY_CAPABILITIES => 3106

    /**
     * @type {String}
     */
    static WIA_DPS_TRANSPARENCY_CAPABILITIES_STR => "Transparency Adapter Capabilities"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_TRANSPARENCY_STATUS => 3107

    /**
     * @type {String}
     */
    static WIA_DPS_TRANSPARENCY_STATUS_STR => "Transparency Adapter Status"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPF_MOUNT_POINT => 3330

    /**
     * @type {String}
     */
    static WIA_DPF_MOUNT_POINT_STR => "Directory mount point"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPV_LAST_PICTURE_TAKEN => 3586

    /**
     * @type {String}
     */
    static WIA_DPV_LAST_PICTURE_TAKEN_STR => "Last Picture Taken"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPV_IMAGES_DIRECTORY => 3587

    /**
     * @type {String}
     */
    static WIA_DPV_IMAGES_DIRECTORY_STR => "Images Directory"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPV_DSHOW_DEVICE_PATH => 3588

    /**
     * @type {String}
     */
    static WIA_DPV_DSHOW_DEVICE_PATH_STR => "Directshow Device Path"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_ITEM_NAME => 4098

    /**
     * @type {String}
     */
    static WIA_IPA_ITEM_NAME_STR => "Item Name"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_FULL_ITEM_NAME => 4099

    /**
     * @type {String}
     */
    static WIA_IPA_FULL_ITEM_NAME_STR => "Full Item Name"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_ITEM_TIME => 4100

    /**
     * @type {String}
     */
    static WIA_IPA_ITEM_TIME_STR => "Item Time Stamp"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_ITEM_FLAGS => 4101

    /**
     * @type {String}
     */
    static WIA_IPA_ITEM_FLAGS_STR => "Item Flags"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_ACCESS_RIGHTS => 4102

    /**
     * @type {String}
     */
    static WIA_IPA_ACCESS_RIGHTS_STR => "Access Rights"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_DATATYPE => 4103

    /**
     * @type {String}
     */
    static WIA_IPA_DATATYPE_STR => "Data Type"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_DEPTH => 4104

    /**
     * @type {String}
     */
    static WIA_IPA_DEPTH_STR => "Bits Per Pixel"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_PREFERRED_FORMAT => 4105

    /**
     * @type {String}
     */
    static WIA_IPA_PREFERRED_FORMAT_STR => "Preferred Format"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_FORMAT => 4106

    /**
     * @type {String}
     */
    static WIA_IPA_FORMAT_STR => "Format"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_COMPRESSION => 4107

    /**
     * @type {String}
     */
    static WIA_IPA_COMPRESSION_STR => "Compression"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_TYMED => 4108

    /**
     * @type {String}
     */
    static WIA_IPA_TYMED_STR => "Media Type"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_CHANNELS_PER_PIXEL => 4109

    /**
     * @type {String}
     */
    static WIA_IPA_CHANNELS_PER_PIXEL_STR => "Channels Per Pixel"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_BITS_PER_CHANNEL => 4110

    /**
     * @type {String}
     */
    static WIA_IPA_BITS_PER_CHANNEL_STR => "Bits Per Channel"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_PLANAR => 4111

    /**
     * @type {String}
     */
    static WIA_IPA_PLANAR_STR => "Planar"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_PIXELS_PER_LINE => 4112

    /**
     * @type {String}
     */
    static WIA_IPA_PIXELS_PER_LINE_STR => "Pixels Per Line"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_BYTES_PER_LINE => 4113

    /**
     * @type {String}
     */
    static WIA_IPA_BYTES_PER_LINE_STR => "Bytes Per Line"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_NUMBER_OF_LINES => 4114

    /**
     * @type {String}
     */
    static WIA_IPA_NUMBER_OF_LINES_STR => "Number of Lines"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_GAMMA_CURVES => 4115

    /**
     * @type {String}
     */
    static WIA_IPA_GAMMA_CURVES_STR => "Gamma Curves"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_ITEM_SIZE => 4116

    /**
     * @type {String}
     */
    static WIA_IPA_ITEM_SIZE_STR => "Item Size"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_COLOR_PROFILE => 4117

    /**
     * @type {String}
     */
    static WIA_IPA_COLOR_PROFILE_STR => "Color Profiles"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_MIN_BUFFER_SIZE => 4118

    /**
     * @type {String}
     */
    static WIA_IPA_MIN_BUFFER_SIZE_STR => "Buffer Size"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_BUFFER_SIZE => 4118

    /**
     * @type {String}
     */
    static WIA_IPA_BUFFER_SIZE_STR => "Buffer Size"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_REGION_TYPE => 4119

    /**
     * @type {String}
     */
    static WIA_IPA_REGION_TYPE_STR => "Region Type"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_ICM_PROFILE_NAME => 4120

    /**
     * @type {String}
     */
    static WIA_IPA_ICM_PROFILE_NAME_STR => "Color Profile Name"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_APP_COLOR_MAPPING => 4121

    /**
     * @type {String}
     */
    static WIA_IPA_APP_COLOR_MAPPING_STR => "Application Applies Color Mapping"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_PROP_STREAM_COMPAT_ID => 4122

    /**
     * @type {String}
     */
    static WIA_IPA_PROP_STREAM_COMPAT_ID_STR => "Stream Compatibility ID"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_FILENAME_EXTENSION => 4123

    /**
     * @type {String}
     */
    static WIA_IPA_FILENAME_EXTENSION_STR => "Filename extension"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_SUPPRESS_PROPERTY_PAGE => 4124

    /**
     * @type {String}
     */
    static WIA_IPA_SUPPRESS_PROPERTY_PAGE_STR => "Suppress a property page"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPC_THUMBNAIL => 5122

    /**
     * @type {String}
     */
    static WIA_IPC_THUMBNAIL_STR => "Thumbnail Data"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPC_THUMB_WIDTH => 5123

    /**
     * @type {String}
     */
    static WIA_IPC_THUMB_WIDTH_STR => "Thumbnail Width"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPC_THUMB_HEIGHT => 5124

    /**
     * @type {String}
     */
    static WIA_IPC_THUMB_HEIGHT_STR => "Thumbnail Height"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPC_AUDIO_AVAILABLE => 5125

    /**
     * @type {String}
     */
    static WIA_IPC_AUDIO_AVAILABLE_STR => "Audio Available"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPC_AUDIO_DATA_FORMAT => 5126

    /**
     * @type {String}
     */
    static WIA_IPC_AUDIO_DATA_FORMAT_STR => "Audio Format"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPC_AUDIO_DATA => 5127

    /**
     * @type {String}
     */
    static WIA_IPC_AUDIO_DATA_STR => "Audio Data"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPC_NUM_PICT_PER_ROW => 5128

    /**
     * @type {String}
     */
    static WIA_IPC_NUM_PICT_PER_ROW_STR => "Pictures per Row"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPC_SEQUENCE => 5129

    /**
     * @type {String}
     */
    static WIA_IPC_SEQUENCE_STR => "Sequence Number"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPC_TIMEDELAY => 5130

    /**
     * @type {String}
     */
    static WIA_IPC_TIMEDELAY_STR => "Time Delay"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_CUR_INTENT => 6146

    /**
     * @type {String}
     */
    static WIA_IPS_CUR_INTENT_STR => "Current Intent"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_XRES => 6147

    /**
     * @type {String}
     */
    static WIA_IPS_XRES_STR => "Horizontal Resolution"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_YRES => 6148

    /**
     * @type {String}
     */
    static WIA_IPS_YRES_STR => "Vertical Resolution"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_XPOS => 6149

    /**
     * @type {String}
     */
    static WIA_IPS_XPOS_STR => "Horizontal Start Position"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_YPOS => 6150

    /**
     * @type {String}
     */
    static WIA_IPS_YPOS_STR => "Vertical Start Position"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_XEXTENT => 6151

    /**
     * @type {String}
     */
    static WIA_IPS_XEXTENT_STR => "Horizontal Extent"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_YEXTENT => 6152

    /**
     * @type {String}
     */
    static WIA_IPS_YEXTENT_STR => "Vertical Extent"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PHOTOMETRIC_INTERP => 6153

    /**
     * @type {String}
     */
    static WIA_IPS_PHOTOMETRIC_INTERP_STR => "Photometric Interpretation"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_BRIGHTNESS => 6154

    /**
     * @type {String}
     */
    static WIA_IPS_BRIGHTNESS_STR => "Brightness"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_CONTRAST => 6155

    /**
     * @type {String}
     */
    static WIA_IPS_CONTRAST_STR => "Contrast"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_ORIENTATION => 6156

    /**
     * @type {String}
     */
    static WIA_IPS_ORIENTATION_STR => "Orientation"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_ROTATION => 6157

    /**
     * @type {String}
     */
    static WIA_IPS_ROTATION_STR => "Rotation"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_MIRROR => 6158

    /**
     * @type {String}
     */
    static WIA_IPS_MIRROR_STR => "Mirror"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_THRESHOLD => 6159

    /**
     * @type {String}
     */
    static WIA_IPS_THRESHOLD_STR => "Threshold"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_INVERT => 6160

    /**
     * @type {String}
     */
    static WIA_IPS_INVERT_STR => "Invert"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_WARM_UP_TIME => 6161

    /**
     * @type {String}
     */
    static WIA_IPS_WARM_UP_TIME_STR => "Lamp Warm up Time"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_USER_NAME => 3112

    /**
     * @type {String}
     */
    static WIA_DPS_USER_NAME_STR => "User Name"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_SERVICE_ID => 3113

    /**
     * @type {String}
     */
    static WIA_DPS_SERVICE_ID_STR => "Service ID"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_DEVICE_ID => 3114

    /**
     * @type {String}
     */
    static WIA_DPS_DEVICE_ID_STR => "Device ID"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_GLOBAL_IDENTITY => 3115

    /**
     * @type {String}
     */
    static WIA_DPS_GLOBAL_IDENTITY_STR => "Global Identity"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_SCAN_AVAILABLE_ITEM => 3116

    /**
     * @type {String}
     */
    static WIA_DPS_SCAN_AVAILABLE_ITEM_STR => "Scan Available Item"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_DESKEW_X => 6162

    /**
     * @type {String}
     */
    static WIA_IPS_DESKEW_X_STR => "DeskewX"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_DESKEW_Y => 6163

    /**
     * @type {String}
     */
    static WIA_IPS_DESKEW_Y_STR => "DeskewY"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_SEGMENTATION => 6164

    /**
     * @type {String}
     */
    static WIA_IPS_SEGMENTATION_STR => "Segmentation"

    /**
     * @type {String}
     */
    static WIA_SEGMENTATION_FILTER_STR => "SegmentationFilter"

    /**
     * @type {String}
     */
    static WIA_IMAGEPROC_FILTER_STR => "ImageProcessingFilter"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_MAX_HORIZONTAL_SIZE => 6165

    /**
     * @type {String}
     */
    static WIA_IPS_MAX_HORIZONTAL_SIZE_STR => "Maximum Horizontal Scan Size"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_MAX_VERTICAL_SIZE => 6166

    /**
     * @type {String}
     */
    static WIA_IPS_MAX_VERTICAL_SIZE_STR => "Maximum Vertical Scan Size"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_MIN_HORIZONTAL_SIZE => 6167

    /**
     * @type {String}
     */
    static WIA_IPS_MIN_HORIZONTAL_SIZE_STR => "Minimum Horizontal Scan Size"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_MIN_VERTICAL_SIZE => 6168

    /**
     * @type {String}
     */
    static WIA_IPS_MIN_VERTICAL_SIZE_STR => "Minimum Vertical Scan Size"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_TRANSFER_CAPABILITIES => 6169

    /**
     * @type {String}
     */
    static WIA_IPS_TRANSFER_CAPABILITIES_STR => "Transfer Capabilities"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_SHEET_FEEDER_REGISTRATION => 3078

    /**
     * @type {String}
     */
    static WIA_IPS_SHEET_FEEDER_REGISTRATION_STR => "Sheet Feeder Registration"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_DOCUMENT_HANDLING_SELECT => 3088

    /**
     * @type {String}
     */
    static WIA_IPS_DOCUMENT_HANDLING_SELECT_STR => "Document Handling Select"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_OPTICAL_XRES => 3090

    /**
     * @type {String}
     */
    static WIA_IPS_OPTICAL_XRES_STR => "Horizontal Optical Resolution"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_OPTICAL_YRES => 3091

    /**
     * @type {String}
     */
    static WIA_IPS_OPTICAL_YRES_STR => "Vertical Optical Resolution"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PAGES => 3096

    /**
     * @type {String}
     */
    static WIA_IPS_PAGES_STR => "Pages"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PAGE_SIZE => 3097

    /**
     * @type {String}
     */
    static WIA_IPS_PAGE_SIZE_STR => "Page Size"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PAGE_WIDTH => 3098

    /**
     * @type {String}
     */
    static WIA_IPS_PAGE_WIDTH_STR => "Page Width"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PAGE_HEIGHT => 3099

    /**
     * @type {String}
     */
    static WIA_IPS_PAGE_HEIGHT_STR => "Page Height"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PREVIEW => 3100

    /**
     * @type {String}
     */
    static WIA_IPS_PREVIEW_STR => "Preview"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_SHOW_PREVIEW_CONTROL => 3103

    /**
     * @type {String}
     */
    static WIA_IPS_SHOW_PREVIEW_CONTROL_STR => "Show preview control"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_FILM_SCAN_MODE => 3104

    /**
     * @type {String}
     */
    static WIA_IPS_FILM_SCAN_MODE_STR => "Film Scan Mode"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_LAMP => 3105

    /**
     * @type {String}
     */
    static WIA_IPS_LAMP_STR => "Lamp"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_LAMP_AUTO_OFF => 3106

    /**
     * @type {String}
     */
    static WIA_IPS_LAMP_AUTO_OFF_STR => "Lamp Auto Off"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_AUTO_DESKEW => 3107

    /**
     * @type {String}
     */
    static WIA_IPS_AUTO_DESKEW_STR => "Automatic Deskew"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_SUPPORTS_CHILD_ITEM_CREATION => 3108

    /**
     * @type {String}
     */
    static WIA_IPS_SUPPORTS_CHILD_ITEM_CREATION_STR => "Supports Child Item Creation"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_XSCALING => 3109

    /**
     * @type {String}
     */
    static WIA_IPS_XSCALING_STR => "Horizontal Scaling"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_YSCALING => 3110

    /**
     * @type {String}
     */
    static WIA_IPS_YSCALING_STR => "Vertical Scaling"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PREVIEW_TYPE => 3111

    /**
     * @type {String}
     */
    static WIA_IPS_PREVIEW_TYPE_STR => "Preview Type"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_ITEM_CATEGORY => 4125

    /**
     * @type {String}
     */
    static WIA_IPA_ITEM_CATEGORY_STR => "Item Category"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_UPLOAD_ITEM_SIZE => 4126

    /**
     * @type {String}
     */
    static WIA_IPA_UPLOAD_ITEM_SIZE_STR => "Upload Item Size"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_ITEMS_STORED => 4127

    /**
     * @type {String}
     */
    static WIA_IPA_ITEMS_STORED_STR => "Items Stored"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_RAW_BITS_PER_CHANNEL => 4128

    /**
     * @type {String}
     */
    static WIA_IPA_RAW_BITS_PER_CHANNEL_STR => "Raw Bits Per Channel"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_FILM_NODE_NAME => 4129

    /**
     * @type {String}
     */
    static WIA_IPS_FILM_NODE_NAME_STR => "Film Node Name"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER => 4130

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_STR => "Printer/Endorser"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_ORDER => 4131

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_ORDER_STR => "Printer/Endorser Order"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_COUNTER => 4132

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_COUNTER_STR => "Printer/Endorser Counter"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_STEP => 4133

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_STEP_STR => "Printer/Endorser Step"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_XOFFSET => 4134

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_XOFFSET_STR => "Printer/Endorser Horizontal Offset"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_YOFFSET => 4135

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_YOFFSET_STR => "Printer/Endorser Vertical Offset"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_NUM_LINES => 4136

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_NUM_LINES_STR => "Printer/Endorser Lines"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_STRING => 4137

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_STRING_STR => "Printer/Endorser String"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_VALID_CHARACTERS => 4138

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_VALID_CHARACTERS_STR => "Printer/Endorser Valid Characters"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_VALID_FORMAT_SPECIFIERS => 4139

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_VALID_FORMAT_SPECIFIERS_STR => "Printer/Endorser Valid Format Specifiers"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_TEXT_UPLOAD => 4140

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_TEXT_UPLOAD_STR => "Printer/Endorser Text Upload"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_TEXT_DOWNLOAD => 4141

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_TEXT_DOWNLOAD_STR => "Printer/Endorser Text Download"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_GRAPHICS => 4142

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_GRAPHICS_STR => "Printer/Endorser Graphics"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_GRAPHICS_POSITION => 4143

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_GRAPHICS_POSITION_STR => "Printer/Endorser Graphics Position"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_GRAPHICS_MIN_WIDTH => 4144

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_GRAPHICS_MIN_WIDTH_STR => "Printer/Endorser Graphics Minimum Width"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_GRAPHICS_MAX_WIDTH => 4145

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_GRAPHICS_MAX_WIDTH_STR => "Printer/Endorser Graphics Maximum Width"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_GRAPHICS_MIN_HEIGHT => 4146

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_GRAPHICS_MIN_HEIGHT_STR => "Printer/Endorser Graphics Minimum Height"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_GRAPHICS_MAX_HEIGHT => 4147

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_GRAPHICS_MAX_HEIGHT_STR => "Printer/Endorser Graphics Maximum Height"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_GRAPHICS_UPLOAD => 4148

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_GRAPHICS_UPLOAD_STR => "Printer/Endorser Graphics Upload"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_GRAPHICS_DOWNLOAD => 4149

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_GRAPHICS_DOWNLOAD_STR => "Printer/Endorser Graphics Download"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_BARCODE_READER => 4150

    /**
     * @type {String}
     */
    static WIA_IPS_BARCODE_READER_STR => "Barcode Reader"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_MAXIMUM_BARCODES_PER_PAGE => 4151

    /**
     * @type {String}
     */
    static WIA_IPS_MAXIMUM_BARCODES_PER_PAGE_STR => "Maximum Barcodes Per Page"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_BARCODE_SEARCH_DIRECTION => 4152

    /**
     * @type {String}
     */
    static WIA_IPS_BARCODE_SEARCH_DIRECTION_STR => "Barcode Search Direction"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_MAXIMUM_BARCODE_SEARCH_RETRIES => 4153

    /**
     * @type {String}
     */
    static WIA_IPS_MAXIMUM_BARCODE_SEARCH_RETRIES_STR => "Barcode Search Retries"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_BARCODE_SEARCH_TIMEOUT => 4154

    /**
     * @type {String}
     */
    static WIA_IPS_BARCODE_SEARCH_TIMEOUT_STR => "Barcode Search Timeout"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_SUPPORTED_BARCODE_TYPES => 4155

    /**
     * @type {String}
     */
    static WIA_IPS_SUPPORTED_BARCODE_TYPES_STR => "Supported Barcode Types"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_ENABLED_BARCODE_TYPES => 4156

    /**
     * @type {String}
     */
    static WIA_IPS_ENABLED_BARCODE_TYPES_STR => "Enabled Barcode Types"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PATCH_CODE_READER => 4157

    /**
     * @type {String}
     */
    static WIA_IPS_PATCH_CODE_READER_STR => "Patch Code Reader"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_SUPPORTED_PATCH_CODE_TYPES => 4162

    /**
     * @type {String}
     */
    static WIA_IPS_SUPPORTED_PATCH_CODE_TYPES_STR => "Supported Patch Code Types"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_ENABLED_PATCH_CODE_TYPES => 4163

    /**
     * @type {String}
     */
    static WIA_IPS_ENABLED_PATCH_CODE_TYPES_STR => "Enabled Path Code Types"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_MICR_READER => 4164

    /**
     * @type {String}
     */
    static WIA_IPS_MICR_READER_STR => "MICR Reader"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_JOB_SEPARATORS => 4165

    /**
     * @type {String}
     */
    static WIA_IPS_JOB_SEPARATORS_STR => "Job Separators"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_LONG_DOCUMENT => 4166

    /**
     * @type {String}
     */
    static WIA_IPS_LONG_DOCUMENT_STR => "Long Document"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_BLANK_PAGES => 4167

    /**
     * @type {String}
     */
    static WIA_IPS_BLANK_PAGES_STR => "Blank Pages"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_MULTI_FEED => 4168

    /**
     * @type {String}
     */
    static WIA_IPS_MULTI_FEED_STR => "Multi-Feed"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_MULTI_FEED_SENSITIVITY => 4169

    /**
     * @type {String}
     */
    static WIA_IPS_MULTI_FEED_SENSITIVITY_STR => "Multi-Feed Sensitivity"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_AUTO_CROP => 4170

    /**
     * @type {String}
     */
    static WIA_IPS_AUTO_CROP_STR => "Auto-Crop"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_OVER_SCAN => 4171

    /**
     * @type {String}
     */
    static WIA_IPS_OVER_SCAN_STR => "Overscan"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_OVER_SCAN_LEFT => 4172

    /**
     * @type {String}
     */
    static WIA_IPS_OVER_SCAN_LEFT_STR => "Overscan Left"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_OVER_SCAN_RIGHT => 4173

    /**
     * @type {String}
     */
    static WIA_IPS_OVER_SCAN_RIGHT_STR => "Overscan Right"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_OVER_SCAN_TOP => 4174

    /**
     * @type {String}
     */
    static WIA_IPS_OVER_SCAN_TOP_STR => "Overscan Top"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_OVER_SCAN_BOTTOM => 4175

    /**
     * @type {String}
     */
    static WIA_IPS_OVER_SCAN_BOTTOM_STR => "Overscan Bottom"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_COLOR_DROP => 4176

    /**
     * @type {String}
     */
    static WIA_IPS_COLOR_DROP_STR => "Color Drop"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_COLOR_DROP_RED => 4177

    /**
     * @type {String}
     */
    static WIA_IPS_COLOR_DROP_RED_STR => "Color Drop Red"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_COLOR_DROP_GREEN => 4178

    /**
     * @type {String}
     */
    static WIA_IPS_COLOR_DROP_GREEN_STR => "Color Drop Green"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_COLOR_DROP_BLUE => 4179

    /**
     * @type {String}
     */
    static WIA_IPS_COLOR_DROP_BLUE_STR => "Color Drop Blue"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_SCAN_AHEAD => 4180

    /**
     * @type {String}
     */
    static WIA_IPS_SCAN_AHEAD_STR => "Scan Ahead"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_SCAN_AHEAD_CAPACITY => 4181

    /**
     * @type {String}
     */
    static WIA_IPS_SCAN_AHEAD_CAPACITY_STR => "Scan Ahead Capacity"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_FEEDER_CONTROL => 4182

    /**
     * @type {String}
     */
    static WIA_IPS_FEEDER_CONTROL_STR => "Feeder Control"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_PADDING => 4183

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_PADDING_STR => "Printer/Endorser Padding"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_FONT_TYPE => 4184

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_FONT_TYPE_STR => "Printer/Endorser Font Type"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_ALARM => 4185

    /**
     * @type {String}
     */
    static WIA_IPS_ALARM_STR => "Alarm"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_INK => 4186

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_INK_STR => "Printer/Endorser Ink"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_CHARACTER_ROTATION => 4187

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_CHARACTER_ROTATION_STR => "Printer/Endorser Character Rotation"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_MAX_CHARACTERS => 4188

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_MAX_CHARACTERS_STR => "Printer/Endorser Maximum Characters"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_MAX_GRAPHICS => 4189

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_MAX_GRAPHICS_STR => "Printer/Endorser Maximum Graphics"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_PRINTER_ENDORSER_COUNTER_DIGITS => 4190

    /**
     * @type {String}
     */
    static WIA_IPS_PRINTER_ENDORSER_COUNTER_DIGITS_STR => "Printer/Endorser Counter Digits"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_COLOR_DROP_MULTI => 4191

    /**
     * @type {String}
     */
    static WIA_IPS_COLOR_DROP_MULTI_STR => "Color Drop Multiple"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_BLANK_PAGES_SENSITIVITY => 4192

    /**
     * @type {String}
     */
    static WIA_IPS_BLANK_PAGES_SENSITIVITY_STR => "Blank Pages Sensitivity"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_MULTI_FEED_DETECT_METHOD => 4193

    /**
     * @type {String}
     */
    static WIA_IPS_MULTI_FEED_DETECT_METHOD_STR => "Multi-Feed Detection Method"

    /**
     * @type {Guid}
     */
    static WIA_CATEGORY_FINISHED_FILE => Guid("{ff2b77ca-cf84-432b-a735-3a130dde2a88}")

    /**
     * @type {Guid}
     */
    static WIA_CATEGORY_FLATBED => Guid("{fb607b1f-43f3-488b-855b-fb703ec342a6}")

    /**
     * @type {Guid}
     */
    static WIA_CATEGORY_FEEDER => Guid("{fe131934-f84c-42ad-8da4-6129cddd7288}")

    /**
     * @type {Guid}
     */
    static WIA_CATEGORY_FILM => Guid("{fcf65be7-3ce3-4473-af85-f5d37d21b68a}")

    /**
     * @type {Guid}
     */
    static WIA_CATEGORY_ROOT => Guid("{f193526f-59b8-4a26-9888-e16e4f97ce10}")

    /**
     * @type {Guid}
     */
    static WIA_CATEGORY_FOLDER => Guid("{c692a446-6f5a-481d-85bb-92e2e86fd30a}")

    /**
     * @type {Guid}
     */
    static WIA_CATEGORY_FEEDER_FRONT => Guid("{4823175c-3b28-487b-a7e6-eebc17614fd1}")

    /**
     * @type {Guid}
     */
    static WIA_CATEGORY_FEEDER_BACK => Guid("{61ca74d4-39db-42aa-89b1-8c19c9cd4c23}")

    /**
     * @type {Guid}
     */
    static WIA_CATEGORY_AUTO => Guid("{defe5fd8-6c97-4dde-b11e-cb509b270e11}")

    /**
     * @type {Guid}
     */
    static WIA_CATEGORY_IMPRINTER => Guid("{fc65016d-9202-43dd-91a7-64c2954cfb8b}")

    /**
     * @type {Guid}
     */
    static WIA_CATEGORY_ENDORSER => Guid("{47102cc3-127f-4771-adfc-991ab8ee1e97}")

    /**
     * @type {Guid}
     */
    static WIA_CATEGORY_BARCODE_READER => Guid("{36e178a0-473f-494b-af8f-6c3f6d7486fc}")

    /**
     * @type {Guid}
     */
    static WIA_CATEGORY_PATCH_CODE_READER => Guid("{8faa1a6d-9c8a-42cd-98b3-ee9700cbc74f}")

    /**
     * @type {Guid}
     */
    static WIA_CATEGORY_MICR_READER => Guid("{3b86c1ec-71bc-4645-b4d5-1b19da2be978}")

    /**
     * @type {Guid}
     */
    static CLSID_WiaDefaultSegFilter => Guid("{d4f4d30b-0b29-4508-8922-0c5797d42765}")

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_TRANSFER_CHILDREN_SINGLE_SCAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_USE_SEGMENTATION_FILTER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DONT_USE_SEGMENTATION_FILTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_FILM_COLOR_SLIDE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_FILM_COLOR_NEGATIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_FILM_BW_NEGATIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_LAMP_ON => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_LAMP_OFF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_AUTO_DESKEW_ON => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_AUTO_DESKEW_OFF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_ADVANCED_PREVIEW => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BASIC_PREVIEW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINTER_ENDORSER_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINTER_ENDORSER_AUTO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINTER_ENDORSER_FLATBED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINTER_ENDORSER_FEEDER_FRONT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINTER_ENDORSER_FEEDER_BACK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINTER_ENDORSER_FEEDER_DUPLEX => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINTER_ENDORSER_DIGITAL => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINTER_ENDORSER_BEFORE_SCAN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINTER_ENDORSER_AFTER_SCAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_DATE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_YEAR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_MONTH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_DAY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_WEEK_DAY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_TIME_24H => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_TIME_12H => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_HOUR_24H => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_HOUR_12H => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_AM_PM => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_MINUTE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_SECOND => 11

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_PAGE_COUNT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_IMAGE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_MILLISECOND => 14

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_MONTH_NAME => 15

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_MONTH_SHORT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_WEEK_DAY_SHORT => 17

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINTER_ENDORSER_GRAPHICS_LEFT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINTER_ENDORSER_GRAPHICS_RIGHT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINTER_ENDORSER_GRAPHICS_TOP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINTER_ENDORSER_GRAPHICS_BOTTOM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINTER_ENDORSER_GRAPHICS_TOP_LEFT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINTER_ENDORSER_GRAPHICS_TOP_RIGHT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINTER_ENDORSER_GRAPHICS_BOTTOM_LEFT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINTER_ENDORSER_GRAPHICS_BOTTOM_RIGHT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINTER_ENDORSER_GRAPHICS_BACKGROUND => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINTER_ENDORSER_GRAPHICS_DEVICE_DEFAULT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_READER_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_READER_AUTO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_READER_FLATBED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_READER_FEEDER_FRONT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_READER_FEEDER_BACK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_READER_FEEDER_DUPLEX => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_HORIZONTAL_SEARCH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_VERTICAL_SEARCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_HORIZONTAL_VERTICAL_SEARCH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_VERTICAL_HORIZONTAL_SEARCH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_AUTO_SEARCH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_UPCA => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_UPCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_CODABAR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_NONINTERLEAVED_2OF5 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_INTERLEAVED_2OF5 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_CODE39 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_CODE39_MOD43 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_CODE39_FULLASCII => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_CODE93 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_CODE128 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_CODE128A => 10

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_CODE128B => 11

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_CODE128C => 12

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_GS1128 => 13

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_GS1DATABAR => 14

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_ITF14 => 15

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_EAN8 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_EAN13 => 17

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_POSTNETA => 18

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_POSTNETB => 19

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_POSTNETC => 20

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_POSTNET_DPBC => 21

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_PLANET => 22

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_INTELLIGENT_MAIL => 23

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_POSTBAR => 24

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_RM4SCC => 25

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_HIGH_CAPACITY_COLOR => 26

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_MAXICODE => 27

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_PDF417 => 28

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_CPCBINARY => 29

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_FIM => 30

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_PHARMACODE => 31

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_PLESSEY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_MSI => 33

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_JAN => 34

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_TELEPEN => 35

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_AZTEC => 36

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_SMALLAZTEC => 37

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_DATAMATRIX => 38

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_DATASTRIP => 39

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_EZCODE => 40

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_QRCODE => 41

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_SHOTCODE => 42

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_SPARQCODE => 43

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BARCODE_CUSTOMBASE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PATCH_CODE_READER_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PATCH_CODE_READER_AUTO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PATCH_CODE_READER_FLATBED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PATCH_CODE_READER_FEEDER_FRONT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PATCH_CODE_READER_FEEDER_BACK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PATCH_CODE_READER_FEEDER_DUPLEX => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PATCH_CODE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PATCH_CODE_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PATCH_CODE_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PATCH_CODE_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PATCH_CODE_4 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PATCH_CODE_T => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PATCH_CODE_6 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PATCH_CODE_7 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PATCH_CODE_8 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PATCH_CODE_9 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PATCH_CODE_10 => 10

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PATCH_CODE_11 => 11

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PATCH_CODE_12 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PATCH_CODE_13 => 13

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PATCH_CODE_14 => 14

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PATCH_CODE_CUSTOM_BASE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_MICR_READER_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_MICR_READER_AUTO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_MICR_READER_FLATBED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_MICR_READER_FEEDER_FRONT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_MICR_READER_FEEDER_BACK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_MICR_READER_FEEDER_DUPLEX => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_SEPARATOR_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_SEPARATOR_DETECT_SCAN_CONTINUE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_SEPARATOR_DETECT_SCAN_STOP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_SEPARATOR_DETECT_NOSCAN_CONTINUE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_SEPARATOR_DETECT_NOSCAN_STOP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_LONG_DOCUMENT_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_LONG_DOCUMENT_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_LONG_DOCUMENT_SPLIT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BLANK_PAGE_DETECTION_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BLANK_PAGE_DISCARD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_BLANK_PAGE_JOB_SEPARATOR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_MULTI_FEED_DETECT_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_MULTI_FEED_DETECT_STOP_ERROR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_MULTI_FEED_DETECT_STOP_SUCCESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_MULTI_FEED_DETECT_CONTINUE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_MULTI_FEED_DETECT_METHOD_LENGTH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_MULTI_FEED_DETECT_METHOD_OVERLAP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_AUTO_CROP_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_AUTO_CROP_SINGLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_AUTO_CROP_MULTI => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_OVER_SCAN_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_OVER_SCAN_TOP_BOTTOM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_OVER_SCAN_LEFT_RIGHT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_OVER_SCAN_ALL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_COLOR_DROP_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_COLOR_DROP_RED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_COLOR_DROP_GREEN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_COLOR_DROP_BLUE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_COLOR_DROP_RGB => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_SCAN_AHEAD_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_SCAN_AHEAD_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_FEEDER_CONTROL_AUTO => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_FEEDER_CONTROL_MANUAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_PADDING_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_PADDING_ZERO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_PADDING_BLANK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_FONT_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_FONT_BOLD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_FONT_EXTRA_BOLD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_FONT_ITALIC_BOLD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_FONT_ITALIC_EXTRA_BOLD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_FONT_ITALIC => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_FONT_SMALL => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_FONT_SMALL_BOLD => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_FONT_SMALL_EXTRA_BOLD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_FONT_SMALL_ITALIC_BOLD => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_FONT_SMALL_ITALIC_EXTRA_BOLD => 10

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_FONT_SMALL_ITALIC => 11

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_FONT_LARGE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_FONT_LARGE_BOLD => 13

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_FONT_LARGE_EXTRA_BOLD => 14

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_FONT_LARGE_ITALIC_BOLD => 15

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_FONT_LARGE_ITALIC_EXTRA_BOLD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRINT_FONT_LARGE_ITALIC => 17

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_ALARM_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_ALARM_BEEP1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_ALARM_BEEP2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_ALARM_BEEP3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_ALARM_BEEP4 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_ALARM_BEEP5 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_ALARM_BEEP6 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_ALARM_BEEP7 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_ALARM_BEEP8 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_ALARM_BEEP9 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_ALARM_BEEP10 => 10

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRIVATE_DEVPROP => 38914

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PRIVATE_ITEMPROP => 71682

    /**
     * @type {Guid}
     */
    static WiaImgFmt_UNDEFINED => Guid("{b96b3ca9-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_RAWRGB => Guid("{bca48b55-f272-4371-b0f1-4a150d057bb4}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_MEMORYBMP => Guid("{b96b3caa-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_BMP => Guid("{b96b3cab-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_EMF => Guid("{b96b3cac-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_WMF => Guid("{b96b3cad-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_JPEG => Guid("{b96b3cae-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_PNG => Guid("{b96b3caf-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_GIF => Guid("{b96b3cb0-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_TIFF => Guid("{b96b3cb1-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_EXIF => Guid("{b96b3cb2-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_PHOTOCD => Guid("{b96b3cb3-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_FLASHPIX => Guid("{b96b3cb4-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_ICO => Guid("{b96b3cb5-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_CIFF => Guid("{9821a8ab-3a7e-4215-94e0-d27a460c03b2}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_PICT => Guid("{a6bc85d8-6b3e-40ee-a95c-25d482e41adc}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_JPEG2K => Guid("{344ee2b2-39db-4dde-8173-c4b75f8f1e49}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_JPEG2KX => Guid("{43e14614-c80a-4850-baf3-4b152dc8da27}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_RAW => Guid("{6f120719-f1a8-4e07-9ade-9b64c63a3dcc}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_JBIG => Guid("{41e8dd92-2f0a-43d4-8636-f1614ba11e46}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_JBIG2 => Guid("{bb8e7e67-283c-4235-9e59-0b9bf94ca687}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_RTF => Guid("{573dd6a3-4834-432d-a9b5-e198dd9e890d}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_XML => Guid("{b9171457-dac8-4884-b393-15b471d5f07e}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_HTML => Guid("{c99a4e62-99de-4a94-acca-71956ac2977d}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_TXT => Guid("{fafd4d82-723f-421f-9318-30501ac44b59}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_PDFA => Guid("{9980bd5b-3463-43c7-bdca-3caa146f229f}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_XPS => Guid("{700b4a0f-2011-411c-b430-d1e0b2e10b28}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_OXPS => Guid("{2c7b1240-c14d-4109-9755-04b89025153a}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_CSV => Guid("{355bda24-5a9f-4494-80dc-be752cecbc8c}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_MPG => Guid("{ecd757e4-d2ec-4f57-955d-bcf8a97c4e52}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_AVI => Guid("{32f8ca14-087c-4908-b7c4-6757fe7e90ab}")

    /**
     * @type {Guid}
     */
    static WiaAudFmt_WAV => Guid("{f818e146-07af-40ff-ae55-be8f2c065dbe}")

    /**
     * @type {Guid}
     */
    static WiaAudFmt_MP3 => Guid("{0fbc71fb-43bf-49f2-9190-e6fecff37e54}")

    /**
     * @type {Guid}
     */
    static WiaAudFmt_AIFF => Guid("{66e2bf4f-b6fc-443f-94c8-2f33c8a65aaf}")

    /**
     * @type {Guid}
     */
    static WiaAudFmt_WMA => Guid("{d61d6413-8bc2-438f-93ad-21bd484db6a1}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_ASF => Guid("{8d948ee9-d0aa-4a12-9d9a-9cc5de36199b}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_SCRIPT => Guid("{fe7d6c53-2dac-446a-b0bd-d73e21e924c9}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_EXEC => Guid("{485da097-141e-4aa5-bb3b-a5618d95d02b}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_UNICODE16 => Guid("{1b7639b6-6357-47d1-9a07-12452dc073e9}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_DPOF => Guid("{369eeeab-a0e8-45ca-86a6-a83ce5697e28}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_XMLBAR => Guid("{6235701c-3a98-484c-b2a8-fdffd87e6b16}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_RAWBAR => Guid("{da63f833-d26e-451e-90d2-ea55a1365d62}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_XMLPAT => Guid("{f8986f55-f052-460d-9523-3a7dfedbb33c}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_RAWPAT => Guid("{7760507c-5064-400c-9a17-575624d8824b}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_XMLMIC => Guid("{2d164c61-b9ae-4b23-8973-c7067e1fbd31}")

    /**
     * @type {Guid}
     */
    static WiaImgFmt_RAWMIC => Guid("{22c4f058-0d88-409c-ac1c-eec12b0ea680}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_DEVICE_DISCONNECTED => Guid("{143e4e83-6497-11d2-a231-00c04fa31809}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_DEVICE_CONNECTED => Guid("{a28bbade-64b6-11d2-a231-00c04fa31809}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_ITEM_DELETED => Guid("{1d22a559-e14f-11d2-b326-00c04f68ce61}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_ITEM_CREATED => Guid("{4c8f4ef5-e14f-11d2-b326-00c04f68ce61}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_TREE_UPDATED => Guid("{c9859b91-4ab2-4cd6-a1fc-582eec55e585}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_VOLUME_INSERT => Guid("{9638bbfd-d1bd-11d2-b31f-00c04f68ce61}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_SCAN_IMAGE => Guid("{a6c5a715-8c6e-11d2-977a-0000f87a926f}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_SCAN_PRINT_IMAGE => Guid("{b441f425-8c6e-11d2-977a-0000f87a926f}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_SCAN_FAX_IMAGE => Guid("{c00eb793-8c6e-11d2-977a-0000f87a926f}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_SCAN_OCR_IMAGE => Guid("{9d095b89-37d6-4877-afed-62a297dc6dbe}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_SCAN_EMAIL_IMAGE => Guid("{c686dcee-54f2-419e-9a27-2fc7f2e98f9e}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_SCAN_FILM_IMAGE => Guid("{9b2b662c-6185-438c-b68b-e39ee25e71cb}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_SCAN_IMAGE2 => Guid("{fc4767c1-c8b3-48a2-9cfa-2e90cb3d3590}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_SCAN_IMAGE3 => Guid("{154e27be-b617-4653-acc5-0fd7bd4c65ce}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_SCAN_IMAGE4 => Guid("{a65b704a-7f3c-4447-a75d-8a26dfca1fdf}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_STORAGE_CREATED => Guid("{353308b2-fe73-46c8-895e-fa4551ccc85a}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_STORAGE_DELETED => Guid("{5e41e75e-9390-44c5-9a51-e47019e390cf}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_STI_PROXY => Guid("{d711f81f-1f0d-422d-8641-927d1b93e5e5}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_CANCEL_IO => Guid("{c860f7b8-9ccd-41ea-bbbf-4dd09c5b1795}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_POWER_SUSPEND => Guid("{a0922ff9-c3b4-411c-9e29-03a66993d2be}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_POWER_RESUME => Guid("{618f153e-f686-4350-9634-4115a304830c}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_HANDLER_NO_ACTION => Guid("{e0372b7d-e115-4525-bc55-b629e68c745a}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_HANDLER_PROMPT => Guid("{5f4baad0-4d59-4fcd-b213-783ce7a92f22}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_DEVICE_NOT_READY => Guid("{d8962d7e-e4dc-4b4d-ba29-668a87f42e6f}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_DEVICE_READY => Guid("{7523ec6c-988b-419e-9a0a-425ac31b37dc}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_FLATBED_LID_OPEN => Guid("{ba0a0623-437d-4f03-a97d-7793b123113c}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_FLATBED_LID_CLOSED => Guid("{f879af0f-9b29-4283-ad95-d412164d39a9}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_FEEDER_LOADED => Guid("{cc8d701e-9aba-481d-bf74-78f763dc342a}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_FEEDER_EMPTIED => Guid("{e70b4b82-6dda-46bb-8ff9-53ceb1a03e35}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_COVER_OPEN => Guid("{19a12136-fa1c-4f66-900f-8f914ec74ec9}")

    /**
     * @type {Guid}
     */
    static WIA_EVENT_COVER_CLOSED => Guid("{6714a1e6-e285-468c-9b8c-da7dc4cbaa05}")

    /**
     * @type {Guid}
     */
    static WIA_CMD_SYNCHRONIZE => Guid("{9b26b7b2-acad-11d2-a093-00c04f72dc3c}")

    /**
     * @type {Guid}
     */
    static WIA_CMD_TAKE_PICTURE => Guid("{af933cac-acad-11d2-a093-00c04f72dc3c}")

    /**
     * @type {Guid}
     */
    static WIA_CMD_DELETE_ALL_ITEMS => Guid("{e208c170-acad-11d2-a093-00c04f72dc3c}")

    /**
     * @type {Guid}
     */
    static WIA_CMD_CHANGE_DOCUMENT => Guid("{04e725b0-acae-11d2-a093-00c04f72dc3c}")

    /**
     * @type {Guid}
     */
    static WIA_CMD_UNLOAD_DOCUMENT => Guid("{1f3b3d8e-acae-11d2-a093-00c04f72dc3c}")

    /**
     * @type {Guid}
     */
    static WIA_CMD_DIAGNOSTIC => Guid("{10ff52f5-de04-4cf0-a5ad-691f8dce0141}")

    /**
     * @type {Guid}
     */
    static WIA_CMD_FORMAT => Guid("{c3a693aa-f788-4d34-a5b0-be7190759a24}")

    /**
     * @type {Guid}
     */
    static WIA_CMD_DELETE_DEVICE_TREE => Guid("{73815942-dbea-11d2-8416-00c04fa36145}")

    /**
     * @type {Guid}
     */
    static WIA_CMD_BUILD_DEVICE_TREE => Guid("{9cba5ce0-dbea-11d2-8416-00c04fa36145}")

    /**
     * @type {Guid}
     */
    static WIA_CMD_START_FEEDER => Guid("{5a9df6c9-5f2d-4a39-9d6c-00456d047f00}")

    /**
     * @type {Guid}
     */
    static WIA_CMD_STOP_FEEDER => Guid("{d847b06d-3905-459c-9509-9b29cdb691e7}")

    /**
     * @type {Guid}
     */
    static WIA_CMD_PAUSE_FEEDER => Guid("{50985e4d-a5b2-4b71-9c95-6d7d7c469a43}")

    /**
     * @type {Integer (UInt32)}
     */
    static BASE_VAL_WIA_ERROR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BASE_VAL_WIA_SUCCESS => 0

    /**
     * @type {Integer (Int32)}
     */
    static WIA_ERROR_GENERAL_ERROR => -2145320959

    /**
     * @type {Integer (Int32)}
     */
    static WIA_ERROR_PAPER_JAM => -2145320958

    /**
     * @type {Integer (Int32)}
     */
    static WIA_ERROR_PAPER_EMPTY => -2145320957

    /**
     * @type {Integer (Int32)}
     */
    static WIA_ERROR_PAPER_PROBLEM => -2145320956

    /**
     * @type {Integer (Int32)}
     */
    static WIA_ERROR_OFFLINE => -2145320955

    /**
     * @type {Integer (Int32)}
     */
    static WIA_ERROR_BUSY => -2145320954

    /**
     * @type {Integer (Int32)}
     */
    static WIA_ERROR_WARMING_UP => -2145320953

    /**
     * @type {Integer (Int32)}
     */
    static WIA_ERROR_USER_INTERVENTION => -2145320952

    /**
     * @type {Integer (Int32)}
     */
    static WIA_ERROR_ITEM_DELETED => -2145320951

    /**
     * @type {Integer (Int32)}
     */
    static WIA_ERROR_DEVICE_COMMUNICATION => -2145320950

    /**
     * @type {Integer (Int32)}
     */
    static WIA_ERROR_INVALID_COMMAND => -2145320949

    /**
     * @type {Integer (Int32)}
     */
    static WIA_ERROR_INCORRECT_HARDWARE_SETTING => -2145320948

    /**
     * @type {Integer (Int32)}
     */
    static WIA_ERROR_DEVICE_LOCKED => -2145320947

    /**
     * @type {Integer (Int32)}
     */
    static WIA_ERROR_EXCEPTION_IN_DRIVER => -2145320946

    /**
     * @type {Integer (Int32)}
     */
    static WIA_ERROR_INVALID_DRIVER_RESPONSE => -2145320945

    /**
     * @type {Integer (Int32)}
     */
    static WIA_ERROR_COVER_OPEN => -2145320944

    /**
     * @type {Integer (Int32)}
     */
    static WIA_ERROR_LAMP_OFF => -2145320943

    /**
     * @type {Integer (Int32)}
     */
    static WIA_ERROR_DESTINATION => -2145320942

    /**
     * @type {Integer (Int32)}
     */
    static WIA_ERROR_NETWORK_RESERVATION_FAILED => -2145320941

    /**
     * @type {Integer (Int32)}
     */
    static WIA_ERROR_MULTI_FEED => -2145320940

    /**
     * @type {Integer (Int32)}
     */
    static WIA_ERROR_MAXIMUM_PRINTER_ENDORSER_COUNTER => -2145320939

    /**
     * @type {Integer (Int32)}
     */
    static WIA_STATUS_END_OF_MEDIA => 2162689

    /**
     * @type {Integer (Int32)}
     */
    static WIA_STATUS_WARMING_UP => 2162690

    /**
     * @type {Integer (Int32)}
     */
    static WIA_STATUS_CALIBRATING => 2162691

    /**
     * @type {Integer (Int32)}
     */
    static WIA_STATUS_RESERVING_NETWORK_DEVICE => 2162694

    /**
     * @type {Integer (Int32)}
     */
    static WIA_STATUS_NETWORK_DEVICE_RESERVED => 2162695

    /**
     * @type {Integer (Int32)}
     */
    static WIA_STATUS_CLEAR => 2162696

    /**
     * @type {Integer (Int32)}
     */
    static WIA_STATUS_SKIP_ITEM => 2162697

    /**
     * @type {Integer (Int32)}
     */
    static WIA_STATUS_NOT_HANDLED => 2162698

    /**
     * @type {Integer (Int32)}
     */
    static WIA_S_CHANGE_DEVICE => 2162699

    /**
     * @type {Integer (Int32)}
     */
    static WIA_S_NO_DEVICE_AVAILABLE => -2145320939

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_SELECT_DEVICE_NODEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DEVICE_DIALOG_SINGLE_IMAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DEVICE_DIALOG_USE_COMMON_UI => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_REGISTER_EVENT_CALLBACK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_UNREGISTER_EVENT_CALLBACK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_SET_DEFAULT_HANDLER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_NOTIFICATION_EVENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_ACTION_EVENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_LINE_ORDER_TOP_TO_BOTTOM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_LINE_ORDER_BOTTOM_TO_TOP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IS_DEFAULT_HANDLER => 1

    /**
     * @type {String}
     */
    static WIA_EVENT_DEVICE_DISCONNECTED_STR => "Device Disconnected"

    /**
     * @type {String}
     */
    static WIA_EVENT_DEVICE_CONNECTED_STR => "Device Connected"

    /**
     * @type {Integer (UInt32)}
     */
    static TYMED_CALLBACK => 128

    /**
     * @type {Integer (UInt32)}
     */
    static TYMED_MULTIPAGE_FILE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static TYMED_MULTIPAGE_CALLBACK => 512

    /**
     * @type {Integer (UInt32)}
     */
    static IT_MSG_DATA_HEADER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IT_MSG_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IT_MSG_STATUS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IT_MSG_TERMINATION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IT_MSG_NEW_PAGE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IT_MSG_FILE_PREVIEW_DATA => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IT_MSG_FILE_PREVIEW_DATA_HEADER => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IT_STATUS_TRANSFER_FROM_DEVICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IT_STATUS_PROCESSING_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IT_STATUS_TRANSFER_TO_CLIENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IT_STATUS_MASK => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_TRANSFER_ACQUIRE_CHILDREN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_TRANSFER_MSG_STATUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_TRANSFER_MSG_END_OF_STREAM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_TRANSFER_MSG_END_OF_TRANSFER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_TRANSFER_MSG_DEVICE_STATUS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_TRANSFER_MSG_NEW_PAGE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_MAJOR_EVENT_DEVICE_CONNECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_MAJOR_EVENT_DEVICE_DISCONNECT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_MAJOR_EVENT_PICTURE_TAKEN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_MAJOR_EVENT_PICTURE_DELETED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DEVICE_NOT_CONNECTED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DEVICE_CONNECTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DEVICE_COMMANDS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DEVICE_EVENTS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DEVINFO_ENUM_ALL => 15

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DEVINFO_ENUM_LOCAL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WiaItemTypeFree => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WiaItemTypeImage => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WiaItemTypeFile => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WiaItemTypeFolder => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WiaItemTypeRoot => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WiaItemTypeAnalyze => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WiaItemTypeAudio => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WiaItemTypeDevice => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WiaItemTypeDeleted => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WiaItemTypeDisconnected => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WiaItemTypeHPanorama => 512

    /**
     * @type {Integer (UInt32)}
     */
    static WiaItemTypeVPanorama => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static WiaItemTypeBurst => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static WiaItemTypeStorage => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static WiaItemTypeTransfer => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static WiaItemTypeGenerated => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static WiaItemTypeHasAttachments => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static WiaItemTypeVideo => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static WiaItemTypeRemoved => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static WiaItemTypeDocument => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static WiaItemTypeProgrammableDataSource => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static WiaItemTypeMask => 2148532223

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_MAX_CTX_SIZE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PROP_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PROP_WRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PROP_SYNC_REQUIRED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PROP_NONE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PROP_RANGE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PROP_LIST => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PROP_FLAG => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PROP_CACHEABLE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static COPY_PARENT_PROPERTY_VALUES => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_ITEM_CAN_BE_DELETED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_ITEM_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_ITEM_WRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_RANGE_MIN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_RANGE_NOM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_RANGE_MAX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_RANGE_STEP => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_RANGE_NUM_ELEMS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_LIST_COUNT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_LIST_NOM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_LIST_VALUES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_LIST_NUM_ELEMS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_FLAG_NOM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_FLAG_VALUES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_FLAG_NUM_ELEMS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DIP_FIRST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPA_FIRST => 4098

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPF_FIRST => 3330

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPS_FIRST => 6146

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DPS_FIRST => 3074

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_IPC_FIRST => 5122

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_NUM_IPC => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_RESERVED_FOR_NEW_PROPS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static WHITEBALANCE_MANUAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WHITEBALANCE_AUTO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WHITEBALANCE_ONEPUSH_AUTO => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WHITEBALANCE_DAYLIGHT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WHITEBALANCE_FLORESCENT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WHITEBALANCE_TUNGSTEN => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WHITEBALANCE_FLASH => 7

    /**
     * @type {Integer (UInt32)}
     */
    static FOCUSMODE_MANUAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FOCUSMODE_AUTO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FOCUSMODE_MACROAUTO => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EXPOSUREMETERING_AVERAGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EXPOSUREMETERING_CENTERWEIGHT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EXPOSUREMETERING_MULTISPOT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EXPOSUREMETERING_CENTERSPOT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FLASHMODE_AUTO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLASHMODE_OFF => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLASHMODE_FILL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FLASHMODE_REDEYE_AUTO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FLASHMODE_REDEYE_FILL => 5

    /**
     * @type {Integer (UInt32)}
     */
    static FLASHMODE_EXTERNALSYNC => 6

    /**
     * @type {Integer (UInt32)}
     */
    static EXPOSUREMODE_MANUAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EXPOSUREMODE_AUTO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EXPOSUREMODE_APERTURE_PRIORITY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EXPOSUREMODE_SHUTTER_PRIORITY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EXPOSUREMODE_PROGRAM_CREATIVE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static EXPOSUREMODE_PROGRAM_ACTION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static EXPOSUREMODE_PORTRAIT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CAPTUREMODE_NORMAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CAPTUREMODE_BURST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CAPTUREMODE_TIMELAPSE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EFFECTMODE_STANDARD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EFFECTMODE_BW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EFFECTMODE_SEPIA => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FOCUSMETERING_CENTERSPOT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FOCUSMETERING_MULTISPOT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static POWERMODE_LINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POWERMODE_BATTERY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LEFT_JUSTIFIED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CENTERED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RIGHT_JUSTIFIED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TOP_JUSTIFIED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BOTTOM_JUSTIFIED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PORTRAIT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LANSCAPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LANDSCAPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ROT180 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ROT270 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MIRRORED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FEED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLAT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DUP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DETECT_FLAT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DETECT_SCAN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DETECT_FEED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DETECT_DUP => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DETECT_FEED_AVAIL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DETECT_DUP_AVAIL => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FILM_TPA => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DETECT_FILM_TPA => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static STOR => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DETECT_STOR => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static ADVANCED_DUP => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static AUTO_SOURCE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static IMPRINTER => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static ENDORSER => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static BARCODE_READER => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static PATCH_CODE_READER => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static MICR_READER => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static FEED_READY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLAT_READY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DUP_READY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FLAT_COVER_UP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PATH_COVER_UP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PAPER_JAM => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FILM_TPA_READY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_READY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_FULL => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MULTIPLE_FEED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_ATTENTION => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static LAMP_ERR => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static IMPRINTER_READY => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static ENDORSER_READY => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static BARCODE_READER_READY => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static PATCH_CODE_READER_READY => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static MICR_READER_READY => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static FEEDER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLATBED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DUPLEX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FRONT_FIRST => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BACK_FIRST => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FRONT_ONLY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static BACK_ONLY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NEXT_PAGE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PREFEED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static AUTO_ADVANCE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static ADVANCED_DUPLEX => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static LIGHT_SOURCE_PRESENT_DETECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LIGHT_SOURCE_PRESENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LIGHT_SOURCE_DETECT_READY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LIGHT_SOURCE_READY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TRANSPARENCY_DYNAMIC_FRAME_SUPPORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TRANSPARENCY_STATIC_FRAME_SUPPORT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LIGHT_SOURCE_SELECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LIGHT_SOURCE_POSITIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LIGHT_SOURCE_NEGATIVE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_SCAN_AHEAD_ALL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ALL_PAGES => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_FINAL_SCAN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PREVIEW_SCAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_SHOW_PREVIEW_CONTROL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DONT_SHOW_PREVIEW_CONTROL => 1

    /**
     * @type {String}
     */
    static WIA_ENDORSER_TOK_DATE => "$DATE$"

    /**
     * @type {String}
     */
    static WIA_ENDORSER_TOK_TIME => "$TIME$"

    /**
     * @type {String}
     */
    static WIA_ENDORSER_TOK_PAGE_COUNT => "$PAGE_COUNT$"

    /**
     * @type {String}
     */
    static WIA_ENDORSER_TOK_DAY => "$DAY$"

    /**
     * @type {String}
     */
    static WIA_ENDORSER_TOK_MONTH => "$MONTH$"

    /**
     * @type {String}
     */
    static WIA_ENDORSER_TOK_YEAR => "$YEAR$"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_A4 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_LETTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_CUSTOM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_USLEGAL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_USLETTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_USLEDGER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_USSTATEMENT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_BUSINESSCARD => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_A0 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_A1 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_A2 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_A3 => 10

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_A4 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_A5 => 11

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_A6 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_A7 => 13

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_A8 => 14

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_A9 => 15

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_A10 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_B0 => 17

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_B1 => 18

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_B2 => 19

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_B3 => 20

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_B4 => 21

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_B5 => 22

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_B6 => 23

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_B7 => 24

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_B8 => 25

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_B9 => 26

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_B10 => 27

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_C0 => 28

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_C1 => 29

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_C2 => 30

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_C3 => 31

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_C4 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_C5 => 33

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_C6 => 34

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_C7 => 35

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_C8 => 36

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_C9 => 37

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_ISO_C10 => 38

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_JIS_B0 => 39

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_JIS_B1 => 40

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_JIS_B2 => 41

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_JIS_B3 => 42

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_JIS_B4 => 43

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_JIS_B5 => 44

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_JIS_B6 => 45

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_JIS_B7 => 46

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_JIS_B8 => 47

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_JIS_B9 => 48

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_JIS_B10 => 49

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_JIS_2A => 50

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_JIS_4A => 51

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_DIN_2B => 52

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_DIN_4B => 53

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_AUTO => 100

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PAGE_CUSTOM_BASE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_COMPRESSION_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_COMPRESSION_BI_RLE4 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_COMPRESSION_BI_RLE8 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_COMPRESSION_G3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_COMPRESSION_G4 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_COMPRESSION_JPEG => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_COMPRESSION_JBIG => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_COMPRESSION_JPEG2K => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_COMPRESSION_PNG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_COMPRESSION_AUTO => 100

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PACKED_PIXEL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PLANAR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DATA_THRESHOLD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DATA_DITHER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DATA_GRAYSCALE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DATA_COLOR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DATA_COLOR_THRESHOLD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DATA_COLOR_DITHER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DATA_RAW_RGB => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DATA_RAW_BGR => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DATA_RAW_YUV => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DATA_RAW_YUVK => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DATA_RAW_CMY => 10

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DATA_RAW_CMYK => 11

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DATA_AUTO => 100

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_DEPTH_AUTO => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PHOTO_WHITE_1 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PHOTO_WHITE_0 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PROPPAGE_SCANNER_ITEM_GENERAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PROPPAGE_CAMERA_ITEM_GENERAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_PROPPAGE_DEVICE_GENERAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_INTENT_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_INTENT_IMAGE_TYPE_COLOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_INTENT_IMAGE_TYPE_GRAYSCALE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_INTENT_IMAGE_TYPE_TEXT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_INTENT_IMAGE_TYPE_MASK => 15

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_INTENT_MINIMIZE_SIZE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_INTENT_MAXIMIZE_QUALITY => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_INTENT_BEST_PREVIEW => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_INTENT_SIZE_MASK => 983040

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_NUM_DIP => 16

    /**
     * @type {String}
     */
    static SHELLEX_WIAUIEXTENSION_NAME => "WiaDialogExtensionHandlers"

    /**
     * @type {String}
     */
    static CFSTR_WIAITEMNAMES => "WIAItemNames"

    /**
     * @type {String}
     */
    static CFSTR_WIAITEMPTR => "WIAItemPointer"

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_IMAGE => Guid("{6bdd1fc6-810f-11d0-bec7-08002be2092f}")

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_IO_HANDLES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_RESERVED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_ANSI_CHAR => 255

    /**
     * @type {Integer (UInt32)}
     */
    static BUS_TYPE_SCSI => 200

    /**
     * @type {Integer (UInt32)}
     */
    static BUS_TYPE_USB => 201

    /**
     * @type {Integer (UInt32)}
     */
    static BUS_TYPE_PARALLEL => 202

    /**
     * @type {Integer (UInt32)}
     */
    static BUS_TYPE_FIREWIRE => 203

    /**
     * @type {Integer (UInt32)}
     */
    static SCAN_FIRST => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SCAN_NEXT => 20

    /**
     * @type {Integer (UInt32)}
     */
    static SCAN_FINISHED => 30

    /**
     * @type {Integer (UInt32)}
     */
    static SCANMODE_FINALSCAN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SCANMODE_PREVIEWSCAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_INITIALIZE => 100

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_UNINITIALIZE => 101

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_SETXRESOLUTION => 102

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_SETYRESOLUTION => 103

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_SETCONTRAST => 104

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_SETINTENSITY => 105

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_SETDATATYPE => 106

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_SETDITHER => 107

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_SETMIRROR => 108

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_SETNEGATIVE => 109

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_SETTONEMAP => 110

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_SETCOLORDITHER => 111

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_SETMATRIX => 112

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_SETSPEED => 113

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_SETFILTER => 114

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_LOAD_ADF => 115

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_UNLOAD_ADF => 116

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_GETADFAVAILABLE => 117

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_GETADFOPEN => 118

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_GETADFREADY => 119

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_GETADFHASPAPER => 120

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_GETADFSTATUS => 121

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_GETADFUNLOADREADY => 122

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_GETTPAAVAILABLE => 123

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_GETTPAOPENED => 124

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_TPAREADY => 125

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_SETLAMP => 126

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_SENDSCSICOMMAND => 127

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_STI_DEVICERESET => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_STI_GETSTATUS => 129

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_STI_DIAGNOSTIC => 130

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_RESETSCANNER => 131

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_GETCAPABILITIES => 132

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_GET_INTERRUPT_EVENT => 133

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_SETGSDNAME => 134

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_SETSCANMODE => 135

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_SETSTIDEVICEHKEY => 136

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_GETSUPPORTEDFILEFORMATS => 138

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_GETSUPPORTEDMEMORYFORMATS => 139

    /**
     * @type {Integer (UInt32)}
     */
    static CMD_SETFORMAT => 140

    /**
     * @type {Integer (UInt32)}
     */
    static SUPPORT_COLOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUPPORT_BW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUPPORT_GRAYSCALE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MCRO_ERROR_GENERAL_ERROR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MCRO_STATUS_OK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MCRO_ERROR_PAPER_JAM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MCRO_ERROR_PAPER_PROBLEM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MCRO_ERROR_PAPER_EMPTY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MCRO_ERROR_OFFLINE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MCRO_ERROR_USER_INTERVENTION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_ORDER_RGB => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_ORDER_BGR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WiaItemTypeTwainCapabilityPassThrough => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static ESC_TWAIN_CAPABILITY => 2001

    /**
     * @type {Integer (UInt32)}
     */
    static ESC_TWAIN_PRIVATE_SUPPORTED_CAPS => 2002

    /**
     * @type {String}
     */
    static WIAU_DEBUG_TSTR => "S"

    /**
     * @type {Integer (UInt32)}
     */
    static g_dwDebugFlags => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_WSD_MANUFACTURER => 38914

    /**
     * @type {String}
     */
    static WIA_WSD_MANUFACTURER_STR => "Device manufacturer"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_WSD_MANUFACTURER_URL => 38915

    /**
     * @type {String}
     */
    static WIA_WSD_MANUFACTURER_URL_STR => "Manufacurer URL"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_WSD_MODEL_NAME => 38916

    /**
     * @type {String}
     */
    static WIA_WSD_MODEL_NAME_STR => "Model name"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_WSD_MODEL_NUMBER => 38917

    /**
     * @type {String}
     */
    static WIA_WSD_MODEL_NUMBER_STR => "Model number"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_WSD_MODEL_URL => 38918

    /**
     * @type {String}
     */
    static WIA_WSD_MODEL_URL_STR => "Model URL"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_WSD_PRESENTATION_URL => 38919

    /**
     * @type {String}
     */
    static WIA_WSD_PRESENTATION_URL_STR => "Presentation URL"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_WSD_FRIENDLY_NAME => 38920

    /**
     * @type {String}
     */
    static WIA_WSD_FRIENDLY_NAME_STR => "Friendly name"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_WSD_SERIAL_NUMBER => 38921

    /**
     * @type {String}
     */
    static WIA_WSD_SERIAL_NUMBER_STR => "Serial number"

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_WSD_SCAN_AVAILABLE_ITEM => 38922

    /**
     * @type {String}
     */
    static WIA_WSD_SCAN_AVAILABLE_ITEM_STR => "Scan Available Item"
;@endregion Constants

;@region Methods
;@endregion Methods
}
