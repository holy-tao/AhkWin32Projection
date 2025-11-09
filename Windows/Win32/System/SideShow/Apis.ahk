#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\PROPERTYKEY.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 * @version v4.0.30319
 */
class SideShow {

;@region Constants

    /**
     * @type {Guid}
     */
    static SIDESHOW_ENDPOINT_SIMPLE_CONTENT_FORMAT => Guid("{a9a5353f-2d4b-47ce-93ee-759f3a7dda4f}")

    /**
     * @type {Guid}
     */
    static SIDESHOW_ENDPOINT_ICAL => Guid("{4dff36b5-9dde-4f76-9a2a-96435047063d}")

    /**
     * @type {Guid}
     */
    static SIDESHOW_CAPABILITY_DEVICE_PROPERTIES => Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}")

    /**
     * @type {PROPERTYKEY}
     */
    static SIDESHOW_CAPABILITY_DEVICE_ID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SIDESHOW_CAPABILITY_SCREEN_TYPE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SIDESHOW_CAPABILITY_SCREEN_WIDTH {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SIDESHOW_CAPABILITY_SCREEN_HEIGHT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SIDESHOW_CAPABILITY_COLOR_DEPTH {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SIDESHOW_CAPABILITY_COLOR_TYPE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SIDESHOW_CAPABILITY_DATA_CACHE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SIDESHOW_CAPABILITY_SUPPORTED_LANGUAGES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SIDESHOW_CAPABILITY_CURRENT_LANGUAGE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SIDESHOW_CAPABILITY_SUPPORTED_THEMES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SIDESHOW_CAPABILITY_SUPPORTED_IMAGE_FORMATS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 14
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SIDESHOW_CAPABILITY_CLIENT_AREA_WIDTH {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 15
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static SIDESHOW_CAPABILITY_CLIENT_AREA_HEIGHT {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_SIDESHOW => Guid("{152e5811-feb9-4b00-90f4-d32947ae1681}")

    /**
     * @type {Guid}
     */
    static SIDESHOW_CONTENT_MISSING_EVENT => Guid("{5007fba8-d313-439f-bea2-a50201d3e9a8}")

    /**
     * @type {Guid}
     */
    static SIDESHOW_APPLICATION_EVENT => Guid("{4cb572fa-1d3b-49b3-a17a-2e6bff052854}")

    /**
     * @type {Guid}
     */
    static SIDESHOW_USER_CHANGE_REQUEST_EVENT => Guid("{5009673c-3f7d-4c7e-9971-eaa2e91f1575}")

    /**
     * @type {Guid}
     */
    static SIDESHOW_NEW_EVENT_DATA_AVAILABLE => Guid("{57813854-2fc1-411c-a59f-f24927608804}")

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
