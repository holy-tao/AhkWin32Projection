#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\PROPERTYKEY.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class WindowsSync {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_VERSION_FLAG_FROM_FEED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_VERSION_FLAG_HAS_BY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_SERIALIZE_REPLICA_KEY_MAP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_FILTER_INFO_FLAG_ITEM_LIST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_FILTER_INFO_FLAG_CHANGE_UNIT_LIST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_FILTER_INFO_FLAG_CUSTOM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_FILTER_INFO_COMBINED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_CHANGE_FLAG_DELETED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_CHANGE_FLAG_DOES_NOT_EXIST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_CHANGE_FLAG_GHOST => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SCC_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SCC_CAN_CREATE_WITHOUT_UI => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCC_CAN_MODIFY_WITHOUT_UI => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCC_CREATE_NOT_SUPPORTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SCC_MODIFY_NOT_SUPPORTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SPC_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_PROVIDER_STATE_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_PROVIDER_STATE_DIRTY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_PROVIDER_CONFIGURATION_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_PROVIDER_CONFIGUI_CONFIGURATION_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_32_BIT_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_64_BIT_SUPPORTED => 2

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PROVIDER_INSTANCEID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{84179e61-60f6-4c1c-88ed-f1c531b32bda}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PROVIDER_CLSID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{84179e61-60f6-4c1c-88ed-f1c531b32bda}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PROVIDER_CONFIGUI {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{84179e61-60f6-4c1c-88ed-f1c531b32bda}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PROVIDER_CONTENTTYPE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{84179e61-60f6-4c1c-88ed-f1c531b32bda}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PROVIDER_CAPABILITIES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{84179e61-60f6-4c1c-88ed-f1c531b32bda}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PROVIDER_SUPPORTED_ARCHITECTURE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{84179e61-60f6-4c1c-88ed-f1c531b32bda}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PROVIDER_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{84179e61-60f6-4c1c-88ed-f1c531b32bda}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PROVIDER_DESCRIPTION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{84179e61-60f6-4c1c-88ed-f1c531b32bda}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PROVIDER_TOOLTIPS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{84179e61-60f6-4c1c-88ed-f1c531b32bda}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_PROVIDER_ICON {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{84179e61-60f6-4c1c-88ed-f1c531b32bda}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_CONFIGUI_INSTANCEID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{554b24ea-e8e3-45ba-9352-dfb561e171e4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_CONFIGUI_CLSID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{554b24ea-e8e3-45ba-9352-dfb561e171e4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_CONFIGUI_CONTENTTYPE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{554b24ea-e8e3-45ba-9352-dfb561e171e4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_CONFIGUI_CAPABILITIES {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{554b24ea-e8e3-45ba-9352-dfb561e171e4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_CONFIGUI_SUPPORTED_ARCHITECTURE {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{554b24ea-e8e3-45ba-9352-dfb561e171e4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_CONFIGUI_IS_GLOBAL {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{554b24ea-e8e3-45ba-9352-dfb561e171e4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_CONFIGUI_NAME {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{554b24ea-e8e3-45ba-9352-dfb561e171e4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_CONFIGUI_DESCRIPTION {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{554b24ea-e8e3-45ba-9352-dfb561e171e4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_CONFIGUI_TOOLTIPS {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{554b24ea-e8e3-45ba-9352-dfb561e171e4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 10
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_CONFIGUI_ICON {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{554b24ea-e8e3-45ba-9352-dfb561e171e4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 11
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_CONFIGUI_MENUITEM_NOUI {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{554b24ea-e8e3-45ba-9352-dfb561e171e4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 12
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_CONFIGUI_MENUITEM {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{554b24ea-e8e3-45ba-9352-dfb561e171e4}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 13
            return value
        }
    }
;@endregion Constants

;@region Methods
;@endregion Methods
}
