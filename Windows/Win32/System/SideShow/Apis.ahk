#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.System.SideShow
 * @version v4.0.30319
 */
class SideShow {

;@region Constants

    /**
     * @type {String}
     */
    static SIDESHOW_ENDPOINT_SIMPLE_CONTENT_FORMAT => "{a9a5353f-2d4b-47ce-93ee-759f3a7dda4f}"

    /**
     * @type {String}
     */
    static SIDESHOW_ENDPOINT_ICAL => "{4dff36b5-9dde-4f76-9a2a-96435047063d}"

    /**
     * @type {String}
     */
    static SIDESHOW_CAPABILITY_DEVICE_PROPERTIES => "{8abc88a8-857b-4ad7-a35a-b5942f492b99}"

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_SIDESHOW => "{152e5811-feb9-4b00-90f4-d32947ae1681}"

    /**
     * @type {String}
     */
    static SIDESHOW_CONTENT_MISSING_EVENT => "{5007fba8-d313-439f-bea2-a50201d3e9a8}"

    /**
     * @type {String}
     */
    static SIDESHOW_APPLICATION_EVENT => "{4cb572fa-1d3b-49b3-a17a-2e6bff052854}"

    /**
     * @type {String}
     */
    static SIDESHOW_USER_CHANGE_REQUEST_EVENT => "{5009673c-3f7d-4c7e-9971-eaa2e91f1575}"

    /**
     * @type {String}
     */
    static SIDESHOW_NEW_EVENT_DATA_AVAILABLE => "{57813854-2fc1-411c-a59f-f24927608804}"

    /**
     * @type {Integer (UInt32)}
     */
    static CONTENT_ID_GLANCE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SIDESHOW_EVENTID_APPLICATION_ENTER => 4294901760

    /**
     * @type {Integer (UInt32)}
     */
    static SIDESHOW_EVENTID_APPLICATION_EXIT => 4294901761

    /**
     * @type {Integer (UInt32)}
     */
    static CONTENT_ID_HOME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VERSION_1_WINDOWS_7 => 0
;@endregion Constants

;@region Methods
;@endregion Methods
}
