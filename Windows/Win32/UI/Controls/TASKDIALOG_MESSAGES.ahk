#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TASKDIALOG_MESSAGES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TDM_NAVIGATE_PAGE => 1125

    /**
     * @type {Integer (Int32)}
     */
    static TDM_CLICK_BUTTON => 1126

    /**
     * @type {Integer (Int32)}
     */
    static TDM_SET_MARQUEE_PROGRESS_BAR => 1127

    /**
     * @type {Integer (Int32)}
     */
    static TDM_SET_PROGRESS_BAR_STATE => 1128

    /**
     * @type {Integer (Int32)}
     */
    static TDM_SET_PROGRESS_BAR_RANGE => 1129

    /**
     * @type {Integer (Int32)}
     */
    static TDM_SET_PROGRESS_BAR_POS => 1130

    /**
     * @type {Integer (Int32)}
     */
    static TDM_SET_PROGRESS_BAR_MARQUEE => 1131

    /**
     * @type {Integer (Int32)}
     */
    static TDM_SET_ELEMENT_TEXT => 1132

    /**
     * @type {Integer (Int32)}
     */
    static TDM_CLICK_RADIO_BUTTON => 1134

    /**
     * @type {Integer (Int32)}
     */
    static TDM_ENABLE_BUTTON => 1135

    /**
     * @type {Integer (Int32)}
     */
    static TDM_ENABLE_RADIO_BUTTON => 1136

    /**
     * @type {Integer (Int32)}
     */
    static TDM_CLICK_VERIFICATION => 1137

    /**
     * @type {Integer (Int32)}
     */
    static TDM_UPDATE_ELEMENT_TEXT => 1138

    /**
     * @type {Integer (Int32)}
     */
    static TDM_SET_BUTTON_ELEVATION_REQUIRED_STATE => 1139

    /**
     * @type {Integer (Int32)}
     */
    static TDM_UPDATE_ICON => 1140
}
