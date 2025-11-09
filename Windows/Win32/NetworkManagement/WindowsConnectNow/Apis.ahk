#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\PROPERTYKEY.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 * @version v4.0.30319
 */
class WindowsConnectNow {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static WCN_E_PEER_NOT_FOUND => -2147206143

    /**
     * @type {Integer (Int32)}
     */
    static WCN_E_AUTHENTICATION_FAILED => -2147206142

    /**
     * @type {Integer (Int32)}
     */
    static WCN_E_CONNECTION_REJECTED => -2147206141

    /**
     * @type {Integer (Int32)}
     */
    static WCN_E_SESSION_TIMEDOUT => -2147206140

    /**
     * @type {Integer (Int32)}
     */
    static WCN_E_PROTOCOL_ERROR => -2147206139

    /**
     * @type {String}
     */
    static WCN_QUERY_CONSTRAINT_USE_SOFTAP => "WCN.Discovery.SoftAP"

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_CATEGORY_COMPUTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_CATEGORY_INPUT_DEVICE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_CATEGORY_PRINTER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_CATEGORY_CAMERA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_CATEGORY_STORAGE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_CATEGORY_NETWORK_INFRASTRUCTURE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_CATEGORY_DISPLAY => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_CATEGORY_MULTIMEDIA_DEVICE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_CATEGORY_GAMING_DEVICE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_CATEGORY_TELEPHONE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_CATEGORY_AUDIO_DEVICE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_CATEGORY_OTHER => 255

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_WIFI_OUI => 5304836

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_COMPUTER__PC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_COMPUTER__SERVER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_COMPUTER__MEDIACENTER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_COMPUTER__ULTRAMOBILEPC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_COMPUTER__NOTEBOOK => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_COMPUTER__DESKTOP => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_COMPUTER__MID => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_COMPUTER__NETBOOK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE__KEYBOARD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE__MOUSE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE__JOYSTICK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE__TRACKBALL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE__GAMECONTROLLER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE__REMOTE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE__TOUCHSCREEN => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE__BIOMETRICREADER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE__BARCODEREADER => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_PRINTER__PRINTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_PRINTER__SCANNER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_PRINTER__FAX => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_PRINTER__COPIER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_PRINTER__ALLINONE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_CAMERA__STILL_CAMERA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_CAMERA__VIDEO_CAMERA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_CAMERA__WEB_CAMERA => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_CAMERA__SECURITY_CAMERA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_STORAGE__NAS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_NETWORK_INFRASTRUCUTURE__AP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_NETWORK_INFRASTRUCUTURE__ROUTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_NETWORK_INFRASTRUCUTURE__SWITCH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_NETWORK_INFRASTRUCUTURE__GATEWAY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_NETWORK_INFRASTRUCUTURE__BRIDGE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_DISPLAY__TELEVISION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_DISPLAY__PICTURE_FRAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_DISPLAY__PROJECTOR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_DISPLAY__MONITOR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_MULTIMEDIA_DEVICE__DAR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_MULTIMEDIA_DEVICE__PVR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_MULTIMEDIA_DEVICE__MCX => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_MULTIMEDIA_DEVICE__SETTOPBOX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_MULTIMEDIA_DEVICE__MEDIA_SERVER_ADAPT_EXT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_MULTIMEDIA_DEVICE__PVP => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_GAMING_DEVICE__XBOX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_GAMING_DEVICE__XBOX360 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_GAMING_DEVICE__PLAYSTATION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_GAMING_DEVICE__CONSOLE_ADAPT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_GAMING_DEVICE__PORTABLE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_TELEPHONE__WINDOWS_MOBILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_TELEPHONE__PHONE_SINGLEMODE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_TELEPHONE__PHONE_DUALMODE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_TELEPHONE__SMARTPHONE_SINGLEMODE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_TELEPHONE__SMARTPHONE_DUALMODE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE__TUNER_RECEIVER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE__SPEAKERS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE__PMP => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE__HEADSET => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE__HEADPHONES => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE__MICROPHONE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE__HOMETHEATER => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_API_MAX_BUFFER_SIZE => 2096

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_MICROSOFT_VENDOR_ID => 311

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_NO_SUBTYPE => 4294967294

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_FLAG_DISCOVERY_VE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_FLAG_AUTHENTICATED_VE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WCN_FLAG_ENCRYPTED_VE => 4

    /**
     * @type {Guid}
     */
    static SID_WcnProvider => Guid("{c100beca-d33a-4a4b-bf23-bbef4663d017}")

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WCN_DeviceType_Category {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{88190b8b-4684-11da-a26a-0002b3988e81}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 16
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WCN_DeviceType_SubCategoryOUI {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{88190b8b-4684-11da-a26a-0002b3988e81}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 17
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WCN_DeviceType_SubCategory {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{88190b8b-4684-11da-a26a-0002b3988e81}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 18
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static PKEY_WCN_SSID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{88190b8b-4684-11da-a26a-0002b3988e81}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 32
            return value
        }
    }
;@endregion Constants

;@region Methods
;@endregion Methods
}
