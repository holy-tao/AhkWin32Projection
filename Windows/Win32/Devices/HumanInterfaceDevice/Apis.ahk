#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class HumanInterfaceDevice {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static DIRECTINPUT_VERSION => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_HW_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_HW_CUSTOM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_HW_2A_2B_GENERIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_HW_2A_4B_GENERIC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_HW_2B_GAMEPAD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_HW_2B_FLIGHTYOKE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_HW_2B_FLIGHTYOKETHROTTLE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_HW_3A_2B_GENERIC => 7

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_HW_3A_4B_GENERIC => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_HW_4B_GAMEPAD => 9

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_HW_4B_FLIGHTYOKE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_HW_4B_FLIGHTYOKETHROTTLE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_HW_TWO_2A_2B_WITH_Y => 12

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_HW_LASTENTRY => 13

    /**
     * @type {Integer (Int32)}
     */
    static JOY_ISCAL_XY => 1

    /**
     * @type {Integer (Int32)}
     */
    static JOY_ISCAL_Z => 2

    /**
     * @type {Integer (Int32)}
     */
    static JOY_ISCAL_R => 4

    /**
     * @type {Integer (Int32)}
     */
    static JOY_ISCAL_U => 8

    /**
     * @type {Integer (Int32)}
     */
    static JOY_ISCAL_V => 16

    /**
     * @type {Integer (Int32)}
     */
    static JOY_ISCAL_POV => 32

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_POV_NUMDIRS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_POVVAL_FORWARD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_POVVAL_BACKWARD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_POVVAL_LEFT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_POVVAL_RIGHT => 3

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_HASZ => 1

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_HASPOV => 2

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_POVISBUTTONCOMBOS => 4

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_POVISPOLL => 8

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_ISYOKE => 16

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_ISGAMEPAD => 32

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_ISCARCTRL => 64

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_XISJ1Y => 128

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_XISJ2X => 256

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_XISJ2Y => 512

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_YISJ1X => 1024

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_YISJ2X => 2048

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_YISJ2Y => 4096

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_ZISJ1X => 8192

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_ZISJ1Y => 16384

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_ZISJ2X => 32768

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_POVISJ1X => 65536

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_POVISJ1Y => 131072

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_POVISJ2X => 262144

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_HASR => 524288

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_RISJ1X => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_RISJ1Y => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_RISJ2Y => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_HASU => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_HASV => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static JOY_US_HASRUDDER => 1

    /**
     * @type {Integer (Int32)}
     */
    static JOY_US_PRESENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static JOY_US_ISOEM => 4

    /**
     * @type {Integer (Int32)}
     */
    static JOY_US_RESERVED => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static JOYTYPE_ZEROGAMEENUMOEMDATA => 1

    /**
     * @type {Integer (Int32)}
     */
    static JOYTYPE_NOAUTODETECTGAMEPORT => 2

    /**
     * @type {Integer (Int32)}
     */
    static JOYTYPE_NOHIDDIRECT => 4

    /**
     * @type {Integer (Int32)}
     */
    static JOYTYPE_ANALOGCOMPAT => 8

    /**
     * @type {Integer (Int32)}
     */
    static JOYTYPE_DEFAULTPROPSHEET => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static JOYTYPE_DEVICEHIDE => 65536

    /**
     * @type {Integer (Int32)}
     */
    static JOYTYPE_MOUSEHIDE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static JOYTYPE_KEYBHIDE => 262144

    /**
     * @type {Integer (Int32)}
     */
    static JOYTYPE_GAMEHIDE => 524288

    /**
     * @type {Integer (Int32)}
     */
    static JOYTYPE_HIDEACTIVE => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static JOYTYPE_INFOMASK => 14680064

    /**
     * @type {Integer (Int32)}
     */
    static JOYTYPE_INFODEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static JOYTYPE_INFOYYPEDALS => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static JOYTYPE_INFOZYPEDALS => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static JOYTYPE_INFOYRPEDALS => 6291456

    /**
     * @type {Integer (Int32)}
     */
    static JOYTYPE_INFOZRPEDALS => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static JOYTYPE_INFOZISSLIDER => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static JOYTYPE_INFOZISZ => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static JOYTYPE_ENABLEINPUTREPORT => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_JOYSTRING => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_JOYSTICKOEMVXDNAME => 260

    /**
     * @type {Integer (UInt32)}
     */
    static DITC_REGHWSETTINGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DITC_CLSIDCONFIG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DITC_DISPLAYNAME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DITC_CALLOUT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DITC_HARDWAREID => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DITC_FLAGS1 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DITC_FLAGS2 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DITC_MAPFILE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DIJC_GUIDINSTANCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIJC_REGHWCONFIGTYPE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIJC_GAIN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DIJC_CALLOUT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DIJC_WDMGAMEPORT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DIJU_USERVALUES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIJU_GLOBALDRIVER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIJU_GAMEPORTEMULATOR => 4

    /**
     * @type {String}
     */
    static GUID_KeyboardClass => "{4d36e96b-e325-11ce-bfc1-08002be10318}"

    /**
     * @type {String}
     */
    static GUID_MediaClass => "{4d36e96c-e325-11ce-bfc1-08002be10318}"

    /**
     * @type {String}
     */
    static GUID_MouseClass => "{4d36e96f-e325-11ce-bfc1-08002be10318}"

    /**
     * @type {String}
     */
    static GUID_HIDClass => "{745a17a0-74d3-11d0-b6fe-00a0c90f57da}"

    /**
     * @type {String}
     */
    static DIRECTINPUT_NOTIFICATION_MSGSTRINGA => "DIRECTINPUT_NOTIFICATION_MSGSTRING"

    /**
     * @type {String}
     */
    static DIRECTINPUT_NOTIFICATION_MSGSTRINGW => "DIRECTINPUT_NOTIFICATION_MSGSTRING"

    /**
     * @type {String}
     */
    static DIRECTINPUT_NOTIFICATION_MSGSTRING => "DIRECTINPUT_NOTIFICATION_MSGSTRING"

    /**
     * @type {Integer (UInt32)}
     */
    static DIMSGWP_NEWAPPSTART => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIMSGWP_DX8APPSTART => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIMSGWP_DX8MAPPERAPPSTART => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DIAPPIDFLAG_NOTIME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIAPPIDFLAG_NOSIZE => 2

    /**
     * @type {String}
     */
    static DIRECTINPUT_REGSTR_VAL_APPIDFLAGA => "AppIdFlag"

    /**
     * @type {String}
     */
    static DIRECTINPUT_REGSTR_KEY_LASTAPPA => "MostRecentApplication"

    /**
     * @type {String}
     */
    static DIRECTINPUT_REGSTR_KEY_LASTMAPAPPA => "MostRecentMapperApplication"

    /**
     * @type {String}
     */
    static DIRECTINPUT_REGSTR_VAL_VERSIONA => "Version"

    /**
     * @type {String}
     */
    static DIRECTINPUT_REGSTR_VAL_NAMEA => "Name"

    /**
     * @type {String}
     */
    static DIRECTINPUT_REGSTR_VAL_IDA => "Id"

    /**
     * @type {String}
     */
    static DIRECTINPUT_REGSTR_VAL_MAPPERA => "UsesMapper"

    /**
     * @type {String}
     */
    static DIRECTINPUT_REGSTR_VAL_LASTSTARTA => "MostRecentStart"

    /**
     * @type {String}
     */
    static DIRECTINPUT_REGSTR_VAL_APPIDFLAGW => "AppIdFlag"

    /**
     * @type {String}
     */
    static DIRECTINPUT_REGSTR_KEY_LASTAPPW => "MostRecentApplication"

    /**
     * @type {String}
     */
    static DIRECTINPUT_REGSTR_KEY_LASTMAPAPPW => "MostRecentMapperApplication"

    /**
     * @type {String}
     */
    static DIRECTINPUT_REGSTR_VAL_VERSIONW => "Version"

    /**
     * @type {String}
     */
    static DIRECTINPUT_REGSTR_VAL_NAMEW => "Name"

    /**
     * @type {String}
     */
    static DIRECTINPUT_REGSTR_VAL_IDW => "Id"

    /**
     * @type {String}
     */
    static DIRECTINPUT_REGSTR_VAL_MAPPERW => "UsesMapper"

    /**
     * @type {String}
     */
    static DIRECTINPUT_REGSTR_VAL_LASTSTARTW => "MostRecentStart"

    /**
     * @type {String}
     */
    static DIRECTINPUT_REGSTR_VAL_APPIDFLAG => "AppIdFlag"

    /**
     * @type {String}
     */
    static DIRECTINPUT_REGSTR_KEY_LASTAPP => "MostRecentApplication"

    /**
     * @type {String}
     */
    static DIRECTINPUT_REGSTR_KEY_LASTMAPAPP => "MostRecentMapperApplication"

    /**
     * @type {String}
     */
    static DIRECTINPUT_REGSTR_VAL_VERSION => "Version"

    /**
     * @type {String}
     */
    static DIRECTINPUT_REGSTR_VAL_NAME => "Name"

    /**
     * @type {String}
     */
    static DIRECTINPUT_REGSTR_VAL_ID => "Id"

    /**
     * @type {String}
     */
    static DIRECTINPUT_REGSTR_VAL_MAPPER => "UsesMapper"

    /**
     * @type {String}
     */
    static DIRECTINPUT_REGSTR_VAL_LASTSTART => "MostRecentStart"

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_NOMOREITEMS => -2147024637

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_DRIVERFIRST => -2147220736

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_DRIVERLAST => -2147220481

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_INVALIDCLASSINSTALLER => -2147220480

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_CANCELLED => -2147220479

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_BADINF => -2147220478

    /**
     * @type {Integer (UInt32)}
     */
    static DIDIFT_DELETE => 16777216

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_HID => "{4d1e55b2-f16f-11cf-88cb-001111000030}"

    /**
     * @type {String}
     */
    static GUID_HID_INTERFACE_NOTIFY => "{2c4e2e88-25e6-4c33-882f-3d82e6073681}"

    /**
     * @type {String}
     */
    static GUID_HID_INTERFACE_HIDPARSE => "{f5c315a5-69ac-4bc2-9279-d0b64576f44b}"

    /**
     * @type {Integer (UInt32)}
     */
    static HID_REVISION => 1

    /**
     * @type {Integer (Int32)}
     */
    static HIDP_STATUS_SUCCESS => 1114112

    /**
     * @type {Integer (Int32)}
     */
    static HIDP_STATUS_NULL => -2146369535

    /**
     * @type {Integer (Int32)}
     */
    static HIDP_STATUS_INVALID_PREPARSED_DATA => -1072627711

    /**
     * @type {Integer (Int32)}
     */
    static HIDP_STATUS_INVALID_REPORT_TYPE => -1072627710

    /**
     * @type {Integer (Int32)}
     */
    static HIDP_STATUS_INVALID_REPORT_LENGTH => -1072627709

    /**
     * @type {Integer (Int32)}
     */
    static HIDP_STATUS_USAGE_NOT_FOUND => -1072627708

    /**
     * @type {Integer (Int32)}
     */
    static HIDP_STATUS_VALUE_OUT_OF_RANGE => -1072627707

    /**
     * @type {Integer (Int32)}
     */
    static HIDP_STATUS_BAD_LOG_PHY_VALUES => -1072627706

    /**
     * @type {Integer (Int32)}
     */
    static HIDP_STATUS_BUFFER_TOO_SMALL => -1072627705

    /**
     * @type {Integer (Int32)}
     */
    static HIDP_STATUS_INTERNAL_ERROR => -1072627704

    /**
     * @type {Integer (Int32)}
     */
    static HIDP_STATUS_I8042_TRANS_UNKNOWN => -1072627703

    /**
     * @type {Integer (Int32)}
     */
    static HIDP_STATUS_INCOMPATIBLE_REPORT_ID => -1072627702

    /**
     * @type {Integer (Int32)}
     */
    static HIDP_STATUS_NOT_VALUE_ARRAY => -1072627701

    /**
     * @type {Integer (Int32)}
     */
    static HIDP_STATUS_IS_VALUE_ARRAY => -1072627700

    /**
     * @type {Integer (Int32)}
     */
    static HIDP_STATUS_DATA_INDEX_NOT_FOUND => -1072627699

    /**
     * @type {Integer (Int32)}
     */
    static HIDP_STATUS_DATA_INDEX_OUT_OF_RANGE => -1072627698

    /**
     * @type {Integer (Int32)}
     */
    static HIDP_STATUS_BUTTON_NOT_PRESSED => -1072627697

    /**
     * @type {Integer (Int32)}
     */
    static HIDP_STATUS_REPORT_DOES_NOT_EXIST => -1072627696

    /**
     * @type {Integer (Int32)}
     */
    static HIDP_STATUS_NOT_IMPLEMENTED => -1072627680

    /**
     * @type {Integer (Int32)}
     */
    static HIDP_STATUS_NOT_BUTTON_ARRAY => -1072627679

    /**
     * @type {Integer (Int32)}
     */
    static HIDP_STATUS_I8242_TRANS_UNKNOWN => -1072627703

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_UNDEFINED => 0

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_ARCADE => 145

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_ALPHANUMERIC => 20

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_BARCODE_SCANNER => 140

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_BATTERY_SYSTEM => 133

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_BRAILLE_DISPLAY => 65

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_BUTTON => 9

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_CAMERA_CONTROL => 144

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_CONSUMER => 12

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_DIGITIZER => 13

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_EYE_AND_HEAD_TRACKERS => 18

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_FIDO_ALLIANCE => 61904

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_GAME => 5

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_GAMING_DEVICE => 146

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_GENERIC => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_GENERIC_DEVICE => 6

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_HAPTICS => 14

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_KEYBOARD => 7

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_LED => 8

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_LIGHTING_ILLUMINATION => 89

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_MAGNETIC_STRIPE_READER => 142

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_MEDICAL_INSTRUMENT => 64

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_MICROSOFT_BLUETOOTH_HANDSFREE => 65523

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_MONITOR => 128

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_MONITOR_ENUMERATED => 129

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_ORDINAL => 10

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_PID => 15

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_POWER => 132

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_WEIGHING_DEVICE => 141

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_SENSOR => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_SIMULATION => 2

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_SOC => 17

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_SPORT => 4

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_TELEPHONY => 11

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_UNICODE => 16

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_VESA_VIRTUAL_CONTROLS => 130

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_VR => 3

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_VENDOR_DEFINED_BEGIN => 65280

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_VENDOR_DEFINED_END => 65535

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_UNDEFINED => 0

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_GENERAL_PURPOSE_IO_CARD => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_COIN_DOOR => 2

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_WATCHDOG_TIMER => 3

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_GENERAL_PURPOSE_ANALOG_INPUT_STATE => 48

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_GENERAL_PURPOSE_DIGITAL_INPUT_STATE => 49

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_GENERAL_PURPOSE_OPTICAL_INPUT_STATE => 50

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_GENERAL_PURPOSE_DIGITAL_OUTPUT_STATE => 51

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_NUMBER_OF_COIN_DOORS => 52

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_COIN_DRAWER_DROP_COUNT => 53

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_COIN_DRAWER_START => 54

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_COIN_DRAWER_SERVICE => 55

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_COIN_DRAWER_TILT => 56

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_COIN_DOOR_TEST => 57

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_COIN_DOOR_LOCKOUT => 64

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_WATCHDOG_TIMEOUT => 65

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_WATCHDOG_ACTION => 66

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_WATCHDOG_REBOOT => 67

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_WATCHDOG_RESTART => 68

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_ALARM_INPUT => 69

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_COIN_DOOR_COUNTER => 70

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_IO_DIRECTION_MAPPING => 71

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_SET_IO_DIRECTION_MAPPING => 72

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_EXTENDED_OPTICAL_INPUT_STATE => 73

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_PIN_PAD_INPUT_STATE => 74

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_PIN_PAD_STATUS => 75

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_PIN_PAD_OUTPUT => 76

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ARCADE_PIN_PAD_COMMAND => 77

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_ALPHANUMERIC_DISPLAY => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_BITMAPPED_DISPLAY => 2

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_DISPLAY_ATTRIBUTES_REPORT => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_ASCII_CHARACTER_SET => 33

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_DATA_READ_BACK => 34

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_FONT_READ_BACK => 35

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_DISPLAY_CONTROL_REPORT => 36

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_CLEAR_DISPLAY => 37

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_DISPLAY_ENABLE => 38

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_SCREEN_SAVER_DELAY => 39

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_SCREEN_SAVER_ENABLE => 40

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_VERTICAL_SCROLL => 41

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_HORIZONTAL_SCROLL => 42

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_CHARACTER_REPORT => 43

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_DISPLAY_DATA => 44

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_DISPLAY_STATUS => 45

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_STATUS_NOT_READY => 46

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_STATUS_READY => 47

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_ERR_NOT_A_LOADABLE_CHARACTER => 48

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_ERR_FONT_DATA_CANNOT_BE_READ => 49

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_CURSOR_POSITION_REPORT => 50

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_ROW => 51

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_COLUMN => 52

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_ROWS => 53

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_COLUMNS => 54

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_CURSOR_PIXEL_POSITIONING => 55

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_CURSOR_MODE => 56

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_CURSOR_ENABLE => 57

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_CURSOR_BLINK => 58

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_FONT_REPORT => 59

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_FONT_DATA => 60

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_CHAR_WIDTH => 61

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_CHAR_HEIGHT => 62

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_CHAR_SPACING_HORIZONTAL => 63

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_CHAR_SPACING_VERTICAL => 64

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_UNICODE_CHAR_SET => 65

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_FONT_7_SEGMENT => 66

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_7_SEGMENT_DIRECT_MAP => 67

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_FONT_14_SEGMENT => 68

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_14_SEGMENT_DIRECT_MAP => 69

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_DISPLAY_BRIGHTNESS => 70

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_DISPLAY_CONTRAST => 71

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_CHARACTER_ATTRIBUTE => 72

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_ATTRIBUTE_READBACK => 73

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_ATTRIBUTE_DATA => 74

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_CHAR_ATTR_ENHANCE => 75

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_CHAR_ATTR_UNDERLINE => 76

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_CHAR_ATTR_BLINK => 77

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_BITMAP_SIZE_X => 128

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_BITMAP_SIZE_Y => 129

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_MAX_BLIT_SIZE => 130

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_BIT_DEPTH_FORMAT => 131

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_DISPLAY_ORIENTATION => 132

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_PALETTE_REPORT => 133

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_PALETTE_DATA_SIZE => 134

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_PALETTE_DATA_OFFSET => 135

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_PALETTE_DATA => 136

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_BLIT_REPORT => 138

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_BLIT_RECTANGLE_X1 => 139

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_BLIT_RECTANGLE_Y1 => 140

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_BLIT_RECTANGLE_X2 => 141

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_BLIT_RECTANGLE_Y2 => 142

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_BLIT_DATA => 143

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_SOFT_BUTTON => 144

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_SOFT_BUTTON_ID => 145

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_SOFT_BUTTON_SIDE => 146

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_SOFT_BUTTON_OFFSET1 => 147

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_SOFT_BUTTON_OFFSET2 => 148

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_SOFT_BUTTON_REPORT => 149

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_SOFT_KEYS => 194

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_DISPLAY_DATA_EXTENSIONS => 204

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_CHARACTER_MAPPING => 207

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_UNICODE_EQUIVALENT => 221

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_CHARACTER_PAGE_MAPPING => 223

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_REQUEST_REPORT => 255

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_BARCODE_BADGE_READER => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_BARCODE_SCANNER => 2

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_DUMB_BAR_CODE_SCANNER => 3

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CORDLESS_SCANNER_BASE => 4

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_BAR_CODE_SCANNER_CRADLE => 5

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_ATTRIBUTE_REPORT => 16

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_SETTINGS_REPORT => 17

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_SCANNED_DATA_REPORT => 18

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_RAW_SCANNED_DATA_REPORT => 19

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_TRIGGER_REPORT => 20

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_STATUS_REPORT => 21

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_UPCEAN_CONTROL_REPORT => 22

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_EAN_23_LABEL_CONTROL_REPORT => 23

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CODE_39_CONTROL_REPORT => 24

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_INTERLEAVED_2_OF_5_CONTROL_REPORT => 25

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_STANDARD_2_OF_5_CONTROL_REPORT => 26

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_MSI_PLESSEY_CONTROL_REPORT => 27

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CODABAR_CONTROL_REPORT => 28

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CODE_128_CONTROL_REPORT => 29

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_MISC_1D_CONTROL_REPORT => 30

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_2D_CONTROL_REPORT => 31

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_AIMINGPOINTER_MODE => 48

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_BAR_CODE_PRESENT_SENSOR => 49

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CLASS_1A_LASER => 50

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CLASS_2_LASER => 51

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_HEATER_PRESENT => 52

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CONTACT_SCANNER => 53

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_ELECTRONIC_ARTICLE_SURVEILLANCE_NOTIFICATION => 54

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CONSTANT_ELECTRONIC_ARTICLE_SURVEILLANCE => 55

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_ERROR_INDICATION => 56

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_FIXED_BEEPER => 57

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_GOOD_DECODE_INDICATION => 58

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_HANDS_FREE_SCANNING => 59

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_INTRINSICALLY_SAFE => 60

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_KLASSE_EINS_LASER => 61

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_LONG_RANGE_SCANNER => 62

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_MIRROR_SPEED_CONTROL => 63

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_NOT_ON_FILE_INDICATION => 64

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_PROGRAMMABLE_BEEPER => 65

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_TRIGGERLESS => 66

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_WAND => 67

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_WATER_RESISTANT => 68

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_MULTIRANGE_SCANNER => 69

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_PROXIMITY_SENSOR => 70

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_FRAGMENT_DECODING => 77

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_SCANNER_READ_CONFIDENCE => 78

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_DATA_PREFIX => 79

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_PREFIX_AIMI => 80

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_PREFIX_NONE => 81

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_PREFIX_PROPRIETARY => 82

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_ACTIVE_TIME => 85

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_AIMING_LASER_PATTERN => 86

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_BAR_CODE_PRESENT => 87

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_BEEPER_STATE => 88

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_LASER_ON_TIME => 89

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_LASER_STATE => 90

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_LOCKOUT_TIME => 91

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_MOTOR_STATE => 92

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_MOTOR_TIMEOUT => 93

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_POWER_ON_RESET_SCANNER => 94

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_PREVENT_READ_OF_BARCODES => 95

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_INITIATE_BARCODE_READ => 96

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_TRIGGER_STATE => 97

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_TRIGGER_MODE => 98

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_TRIGGER_MODE_BLINKING_LASER_ON => 99

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_TRIGGER_MODE_CONTINUOUS_LASER_ON => 100

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_TRIGGER_MODE_LASER_ON_WHILE_PULLED => 101

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_TRIGGER_MODE_LASER_STAYS_ON_AFTER_RELEASE => 102

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_COMMIT_PARAMETERS_TO_NVM => 109

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_PARAMETER_SCANNING => 110

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_PARAMETERS_CHANGED => 111

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_SET_PARAMETER_DEFAULT_VALUES => 112

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_SCANNER_IN_CRADLE => 117

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_SCANNER_IN_RANGE => 118

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_AIM_DURATION => 122

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_GOOD_READ_LAMP_DURATION => 123

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_GOOD_READ_LAMP_INTENSITY => 124

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_GOOD_READ_LED => 125

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_GOOD_READ_TONE_FREQUENCY => 126

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_GOOD_READ_TONE_LENGTH => 127

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_GOOD_READ_TONE_VOLUME => 128

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_NO_READ_MESSAGE => 130

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_NOT_ON_FILE_VOLUME => 131

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_POWERUP_BEEP => 132

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_SOUND_ERROR_BEEP => 133

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_SOUND_GOOD_READ_BEEP => 134

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_SOUND_NOT_ON_FILE_BEEP => 135

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_GOOD_READ_WHEN_TO_WRITE => 136

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_GRWTI_AFTER_DECODE => 137

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_GRWTI_BEEPLAMP_AFTER_TRANSMIT => 138

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_GRWTI_NO_BEEPLAMP_USE_AT_ALL => 139

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_BOOKLAND_EAN => 145

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CONVERT_EAN_8_TO_13_TYPE => 146

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CONVERT_UPC_A_TO_EAN13 => 147

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CONVERT_UPCE_TO_A => 148

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_EAN13 => 149

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_EAN8 => 150

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_EAN99_128_MANDATORY => 151

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_EAN99_P5128_OPTIONAL => 152

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_ENABLE_EAN_TWO_LABEL => 153

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_UPCEAN => 154

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_UPCEAN_COUPON_CODE => 155

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_UPCEAN_PERIODICALS => 156

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_UPCA => 157

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_UPCA_WITH_128_MANDATORY => 158

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_UPCA_WITH_128_OPTIONAL => 159

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_UPCA_WITH_P5_OPTIONAL => 160

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_UPCE => 161

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_UPCE1 => 162

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_PERIODICAL => 169

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_PERIODICAL_AUTODISCRIMINATE_2 => 170

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_PERIODICAL_ONLY_DECODE_WITH_2 => 171

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_PERIODICAL_IGNORE_2 => 172

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_PERIODICAL_AUTODISCRIMINATE_5 => 173

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_PERIODICAL_ONLY_DECODE_WITH_5 => 174

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_PERIODICAL_IGNORE_5 => 175

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CHECK => 176

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CHECK_DISABLE_PRICE => 177

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CHECK_ENABLE_4_DIGIT_PRICE => 178

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CHECK_ENABLE_5_DIGIT_PRICE => 179

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CHECK_ENABLE_EUROPEAN_4_DIGIT_PRICE => 180

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CHECK_ENABLE_EUROPEAN_5_DIGIT_PRICE => 181

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_EAN_TWO_LABEL => 183

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_EAN_THREE_LABEL => 184

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_EAN_8_FLAG_DIGIT_1 => 185

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_EAN_8_FLAG_DIGIT_2 => 186

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_EAN_8_FLAG_DIGIT_3 => 187

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_EAN_13_FLAG_DIGIT_1 => 188

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_EAN_13_FLAG_DIGIT_2 => 189

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_EAN_13_FLAG_DIGIT_3 => 190

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_ADD_EAN_23_LABEL_DEFINITION => 191

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CLEAR_ALL_EAN_23_LABEL_DEFINITIONS => 192

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CODABAR => 195

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CODE_128 => 196

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CODE_39 => 199

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CODE_93 => 200

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_FULL_ASCII_CONVERSION => 201

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_INTERLEAVED_2_OF_5 => 202

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_ITALIAN_PHARMACY_CODE => 203

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_MSIPLESSEY => 204

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_STANDARD_2_OF_5_IATA => 205

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_STANDARD_2_OF_5 => 206

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_TRANSMIT_STARTSTOP => 211

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_TRIOPTIC => 212

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_UCCEAN128 => 213

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CHECK_DIGIT => 214

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CHECK_DIGIT_DISABLE => 215

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CHECK_DIGIT_ENABLE_INTERLEAVED_2_OF_5_OPCC => 216

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CHECK_DIGIT_ENABLE_INTERLEAVED_2_OF_5_USS => 217

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CHECK_DIGIT_ENABLE_STANDARD_2_OF_5_OPCC => 218

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CHECK_DIGIT_ENABLE_STANDARD_2_OF_5_USS => 219

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CHECK_DIGIT_ENABLE_ONE_MSI_PLESSEY => 220

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CHECK_DIGIT_ENABLE_TWO_MSI_PLESSEY => 221

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CHECK_DIGIT_CODABAR_ENABLE => 222

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CHECK_DIGIT_CODE_39_ENABLE => 223

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_TRANSMIT_CHECK_DIGIT => 240

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_DISABLE_CHECK_DIGIT_TRANSMIT => 241

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_ENABLE_CHECK_DIGIT_TRANSMIT => 242

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_SYMBOLOGY_IDENTIFIER_1 => 251

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_SYMBOLOGY_IDENTIFIER_2 => 252

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_SYMBOLOGY_IDENTIFIER_3 => 253

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_DECODED_DATA => 254

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_DECODE_DATA_CONTINUED => 255

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_BAR_SPACE_DATA => 256

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_SCANNER_DATA_ACCURACY => 257

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_RAW_DATA_POLARITY => 258

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_POLARITY_INVERTED_BAR_CODE => 259

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_POLARITY_NORMAL_BAR_CODE => 260

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_MINIMUM_LENGTH_TO_DECODE => 262

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_MAXIMUM_LENGTH_TO_DECODE => 263

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_DISCRETE_LENGTH_TO_DECODE_1 => 264

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_DISCRETE_LENGTH_TO_DECODE_2 => 265

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_DATA_LENGTH_METHOD => 266

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_DL_METHOD_READ_ANY => 267

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_DL_METHOD_CHECK_IN_RANGE => 268

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_DL_METHOD_CHECK_FOR_DISCRETE => 269

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_AZTEC_CODE => 272

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_BC412 => 273

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CHANNEL_CODE => 274

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CODE_16 => 275

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CODE_32 => 276

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CODE_49 => 277

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_CODE_ONE => 278

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_COLORCODE => 279

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_DATA_MATRIX => 280

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_MAXICODE => 281

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_MICROPDF => 282

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_PDF417 => 283

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_POSICODE => 284

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_QR_CODE => 285

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_SUPERCODE => 286

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_ULTRACODE => 287

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_USD5_SLUG_CODE => 288

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BARCODE_SCANNER_VERICODE => 289

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_SMART_BATTERY_BATTERY_MODE => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_SMART_BATTERY_BATTERY_STATUS => 2

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_SMART_BATTERY_ALARM_WARNING => 3

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_SMART_BATTERY_CHARGER_MODE => 4

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_SMART_BATTERY_CHARGER_STATUS => 5

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_SMART_BATTERY_CHARGER_SPEC_INFO => 6

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_SMART_BATTERY_SELECTOR_STATE => 7

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_SMART_BATTERY_SELECTOR_PRESETS => 8

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_SMART_BATTERY_SELECTOR_INFO => 9

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_OPTIONAL_MFG_FUNCTION_1 => 16

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_OPTIONAL_MFG_FUNCTION_2 => 17

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_OPTIONAL_MFG_FUNCTION_3 => 18

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_OPTIONAL_MFG_FUNCTION_4 => 19

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_OPTIONAL_MFG_FUNCTION_5 => 20

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_CONNECTION_TO_SM_BUS => 21

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_OUTPUT_CONNECTION => 22

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_CHARGER_CONNECTION => 23

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_BATTERY_INSERTION => 24

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_USE_NEXT => 25

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_OK_TO_USE => 26

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_BATTERY_SUPPORTED => 27

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_SELECTOR_REVISION => 28

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_CHARGING_INDICATOR => 29

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_MANUFACTURER_ACCESS => 40

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_REMAINING_CAPACITY_LIMIT => 41

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_REMAINING_TIME_LIMIT => 42

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_AT_RATE => 43

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_CAPACITY_MODE => 44

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_BROADCAST_TO_CHARGER => 45

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_PRIMARY_BATTERY => 46

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_CHARGE_CONTROLLER => 47

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_TERMINATE_CHARGE => 64

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_TERMINATE_DISCHARGE => 65

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_BELOW_REMAINING_CAPACITY_LIMIT => 66

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_REMAINING_TIME_LIMIT_EXPIRED => 67

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_CHARGING => 68

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_DISCHARGING => 69

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_FULLY_CHARGED => 70

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_FULLY_DISCHARGED => 71

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_CONDITIONING_FLAG => 72

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_AT_RATE_OK => 73

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_SMART_BATTERY_ERROR_CODE => 74

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_NEED_REPLACEMENT => 75

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_AT_RATE_TIME_TO_FULL => 96

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_AT_RATE_TIME_TO_EMPTY => 97

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_AVERAGE_CURRENT => 98

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_MAX_ERROR => 99

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_RELATIVE_STATE_OF_CHARGE => 100

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_ABSOLUTE_STATE_OF_CHARGE => 101

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_REMAINING_CAPACITY => 102

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_FULL_CHARGE_CAPACITY => 103

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_RUN_TIME_TO_EMPTY => 104

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_AVERAGE_TIME_TO_EMPTY => 105

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_AVERAGE_TIME_TO_FULL => 106

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_CYCLE_COUNT => 107

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_BATTERY_PACK_MODEL_LEVEL => 128

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_INTERNAL_CHARGE_CONTROLLER => 129

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_PRIMARY_BATTERY_SUPPORT => 130

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_DESIGN_CAPACITY => 131

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_SPECIFICATION_INFO => 132

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_MANUFACTURE_DATE => 133

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_SERIAL_NUMBER => 134

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_IMANUFACTURER_NAME => 135

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_IDEVICE_NAME => 136

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_IDEVICE_CHEMISTRY => 137

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_MANUFACTURER_DATA => 138

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_RECHARGABLE => 139

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_WARNING_CAPACITY_LIMIT => 140

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_CAPACITY_GRANULARITY_1 => 141

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_CAPACITY_GRANULARITY_2 => 142

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_IOEM_INFORMATION => 143

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_INHIBIT_CHARGE => 192

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_ENABLE_POLLING => 193

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_RESET_TO_ZERO => 194

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_AC_PRESENT => 208

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_BATTERY_PRESENT => 209

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_POWER_FAIL => 210

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_ALARM_INHIBITED => 211

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_THERMISTOR_UNDER_RANGE => 212

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_THERMISTOR_HOT => 213

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_THERMISTOR_COLD => 214

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_THERMISTOR_OVER_RANGE => 215

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_VOLTAGE_OUT_OF_RANGE => 216

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_CURRENT_OUT_OF_RANGE => 217

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_CURRENT_NOT_REGULATED => 218

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_VOLTAGE_NOT_REGULATED => 219

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_MASTER_MODE => 220

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_CHARGER_SELECTOR_SUPPORT => 240

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_CHARGER_SPEC => 241

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_LEVEL_2 => 242

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BATTERY_SYSTEM_LEVEL_3 => 243

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_DISPLAY => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_ROW => 2

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_8_DOT_BRAILLE_CELL => 3

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_6_DOT_BRAILLE_CELL => 4

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_NUMBER_OF_BRAILLE_CELLS => 5

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_SCREEN_READER_CONTROL => 6

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_SCREEN_READER_IDENTIFIER => 7

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_ROUTER_SET_1 => 250

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_ROUTER_SET_2 => 251

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_ROUTER_SET_3 => 252

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_ROUTER_KEY => 256

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_ROW_ROUTER_KEY => 257

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_BUTTONS => 512

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_KEYBOARD_DOT_1 => 513

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_KEYBOARD_DOT_2 => 514

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_KEYBOARD_DOT_3 => 515

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_KEYBOARD_DOT_4 => 516

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_KEYBOARD_DOT_5 => 517

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_KEYBOARD_DOT_6 => 518

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_KEYBOARD_DOT_7 => 519

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_KEYBOARD_DOT_8 => 520

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_KEYBOARD_SPACE => 521

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_KEYBOARD_LEFT_SPACE => 522

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_KEYBOARD_RIGHT_SPACE => 523

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_FACE_CONTROLS => 524

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_LEFT_CONTROLS => 525

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_RIGHT_CONTROLS => 526

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_TOP_CONTROLS => 527

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_JOYSTICK_CENTER => 528

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_JOYSTICK_UP => 529

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_JOYSTICK_DOWN => 530

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_JOYSTICK_LEFT => 531

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_JOYSTICK_RIGHT => 532

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_DPAD_CENTER => 533

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_DPAD_UP => 534

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_DPAD_DOWN => 535

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_DPAD_LEFT => 536

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_DPAD_RIGHT => 537

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_PAN_LEFT => 538

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_PAN_RIGHT => 539

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_ROCKER_UP => 540

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_ROCKER_DOWN => 541

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_BRAILLE_DISPLAY_BRAILLE_ROCKER_PRESS => 542

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CAMERA_AUTO_FOCUS => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CAMERA_SHUTTER => 33

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMERCTRL => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_NUMERIC_KEY_PAD => 2

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_PROGRAMMABLE_BUTTONS => 3

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MICROPHONE => 4

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_HEADPHONE => 5

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_GRAPHIC_EQUALIZER => 6

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_10 => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_100 => 33

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AMPM => 34

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_POWER => 48

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_RESET => 49

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_SLEEP => 50

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_SLEEP_AFTER => 51

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_SLEEP_MODE => 52

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_ILLUMINATION => 53

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_FUNCTION_BUTTONS => 54

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MENU => 64

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MENU_PICK => 65

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MENU_UP => 66

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MENU_DOWN => 67

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MENU_LEFT => 68

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MENU_RIGHT => 69

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MENU_ESCAPE => 70

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MENU_VALUE_INCREASE => 71

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MENU_VALUE_DECREASE => 72

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_DATA_ON_SCREEN => 96

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CLOSED_CAPTION => 97

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CLOSED_CAPTION_SELECT => 98

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_VCRTV => 99

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_BROADCAST_MODE => 100

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_SNAPSHOT => 101

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_STILL => 102

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_PICTUREINPICTURE_TOGGLE => 103

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_PICTUREINPICTURE_SWAP => 104

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_RED_MENU_BUTTON => 105

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_GREEN_MENU_BUTTON => 106

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_BLUE_MENU_BUTTON => 107

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_YELLOW_MENU_BUTTON => 108

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_ASPECT => 109

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_3D_MODE_SELECT => 110

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_DISPLAY_BRIGHTNESS_INCREMENT => 111

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_DISPLAY_BRIGHTNESS_DECREMENT => 112

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_DISPLAY_BRIGHTNESS => 113

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_DISPLAY_BACKLIGHT_TOGGLE => 114

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_DISPLAY_SET_BRIGHTNESS_TO_MINIMUM => 115

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_DISPLAY_SET_BRIGHTNESS_TO_MAXIMUM => 116

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_DISPLAY_SET_AUTO_BRIGHTNESS => 117

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CAMERA_ACCESS_ENABLED => 118

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CAMERA_ACCESS_DISABLED => 119

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CAMERA_ACCESS_TOGGLE => 120

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_KEYBOARD_BRIGHTNESS_INCREMENT => 121

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_KEYBOARD_BRIGHTNESS_DECREMENT => 122

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_KEYBOARD_BACKLIGHT_SET_LEVEL => 123

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_KEYBOARD_BACKLIGHT_OOC => 124

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_KEYBOARD_BACKLIGHT_SET_MINIMUM => 125

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_KEYBOARD_BACKLIGHT_SET_MAXIMUM => 126

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_KEYBOARD_BACKLIGHT_AUTO => 127

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_SELECTION => 128

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_ASSIGN_SELECTION => 129

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MODE_STEP => 130

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_RECALL_LAST => 131

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_ENTER_CHANNEL => 132

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_ORDER_MOVIE => 133

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CHANNEL => 134

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MEDIA_SELECTION => 135

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MEDIA_SELECT_COMPUTER => 136

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MEDIA_SELECT_TV => 137

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MEDIA_SELECT_WWW => 138

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MEDIA_SELECT_DVD => 139

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MEDIA_SELECT_TELEPHONE => 140

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MEDIA_SELECT_PROGRAM_GUIDE => 141

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MEDIA_SELECT_VIDEO_PHONE => 142

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MEDIA_SELECT_GAMES => 143

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MEDIA_SELECT_MESSAGES => 144

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MEDIA_SELECT_CD => 145

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MEDIA_SELECT_VCR => 146

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MEDIA_SELECT_TUNER => 147

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_QUIT => 148

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_HELP => 149

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MEDIA_SELECT_TAPE => 150

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MEDIA_SELECT_CABLE => 151

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MEDIA_SELECT_SATELLITE => 152

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MEDIA_SELECT_SECURITY => 153

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MEDIA_SELECT_HOME => 154

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MEDIA_SELECT_CALL => 155

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CHANNEL_INCREMENT => 156

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CHANNEL_DECREMENT => 157

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MEDIA_SELECT_SAP => 158

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_VCR_PLUS => 160

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_ONCE => 161

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_DAILY => 162

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_WEEKLY => 163

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MONTHLY => 164

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_PLAY => 176

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_PAUSE => 177

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_RECORD => 178

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_FAST_FORWARD => 179

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_REWIND => 180

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_SCAN_NEXT_TRACK => 181

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_SCAN_PREV_TRACK => 182

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_STOP => 183

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_EJECT => 184

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_RANDOM_PLAY => 185

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_SELECT_DISC => 186

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_ENTER_DISC => 187

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_REPEAT => 188

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_TRACKING => 189

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_TRACK_NORMAL => 190

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_SLOW_TRACKING => 191

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_FRAME_FORWARD => 192

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_FRAME_BACK => 193

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MARK => 194

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CLEAR_MARK => 195

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_REPEAT_FROM_MARK => 196

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_RETURN_TO_MARK => 197

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_SEARCH_MARK_FORWARD => 198

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_SEARCH_MARK_BACKWARDS => 199

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_COUNTER_RESET => 200

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_SHOW_COUNTER => 201

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_TRACKING_INCREMENT => 202

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_TRACKING_DECREMENT => 203

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_STOPEJECT => 204

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_PLAY_PAUSE => 205

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_PLAYSKIP => 206

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_VOICE_COMMAND => 207

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_GAMEDVR_OPEN_GAMEBAR => 208

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_GAMEDVR_TOGGLE_RECORD => 209

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_GAMEDVR_RECORD_CLIP => 210

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_GAMEDVR_SCREENSHOT => 211

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_GAMEDVR_TOGGLE_INDICATOR => 212

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_GAMEDVR_TOGGLE_MICROPHONE => 213

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_GAMEDVR_TOGGLE_CAMERA => 214

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_GAMEDVR_TOGGLE_BROADCAST => 215

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_START_OR_STOP_VOICE_DICTATION_SESSION => 216

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_INVOKEDISMISS_EMOJI_PICKER => 217

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_VOLUME => 224

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_BALANCE => 225

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MUTE => 226

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_BASS => 227

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_TREBLE => 228

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_BASS_BOOST => 229

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_SURROUND_MODE => 230

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_LOUDNESS => 231

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MPX => 232

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_VOLUME_INCREMENT => 233

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_VOLUME_DECREMENT => 234

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_SPEED_SELECT => 240

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_PLAYBACK_SPEED => 241

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_STANDARD_PLAY => 242

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_LONG_PLAY => 243

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_EXTENDED_PLAY => 244

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_SLOW => 245

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_FAN_ENABLE => 256

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_FAN_SPEED => 257

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_LIGHT_ENABLE => 258

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_LIGHT_ILLUMINATION_LEVEL => 259

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CLIMATE_CONTROL_ENABLE => 260

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_ROOM_TEMPERATURE => 261

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_SECURITY_ENABLE => 262

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_FIRE_ALARM => 263

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_POLICE_ALARM => 264

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_PROXIMITY => 265

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MOTION => 266

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_DURESS_ALARM => 267

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_HOLDUP_ALARM => 268

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_MEDICAL_ALARM => 269

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_BALANCE_RIGHT => 336

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_BALANCE_LEFT => 337

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_BASS_INCREMENT => 338

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_BASS_DECREMENT => 339

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_TREBLE_INCREMENT => 340

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_TREBLE_DECREMENT => 341

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_SPEAKER_SYSTEM => 352

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CHANNEL_LEFT => 353

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CHANNEL_RIGHT => 354

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CHANNEL_CENTER => 355

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CHANNEL_FRONT => 356

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CHANNEL_CENTER_FRONT => 357

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CHANNEL_SIDE => 358

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CHANNEL_SURROUND => 359

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CHANNEL_LOW_FREQUENCY_ENHANCEMENT => 360

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CHANNEL_TOP => 361

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CHANNEL_UNKNOWN => 362

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_SUBCHANNEL => 368

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_SUBCHANNEL_INCREMENT => 369

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_SUBCHANNEL_DECREMENT => 370

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_ALTERNATE_AUDIO_INCREMENT => 371

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_ALTERNATE_AUDIO_DECREMENT => 372

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_APPLICATION_LAUNCH_BUTTONS => 384

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_LAUNCH_BUTTON_CONFIGURATION_TOOL => 385

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_PROGRAMMABLE_BUTTON_CONFIGURATION => 386

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_CONFIGURATION => 387

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_WORD_PROCESSOR => 388

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_TEXT_EDITOR => 389

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_SPREADSHEET => 390

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_GRAPHICS_EDITOR => 391

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_PRESENTATION_APP => 392

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_DATABASE_APP => 393

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_EMAIL => 394

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_NEWSREADER => 395

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_VOICEMAIL => 396

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_CONTACTSADDRESS_BOOK => 397

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_CALENDARSCHEDULE => 398

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_TASKPROJECT_MANAGER => 399

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_LOGJOURNALTIMECARD => 400

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_CHECKBOOKFINANCE => 401

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_CALCULATOR => 402

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_AV_CAPTUREPLAYBACK => 403

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_BROWSER => 404

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_LANWAN_BROWSER => 405

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_INTERNET_BROWSER => 406

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_REMOTE_NETWORKINGISP_CONNECT => 407

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_NETWORK_CONFERENCE => 408

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_NETWORK_CHAT => 409

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_TELEPHONYDIALER => 410

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_LOGON => 411

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_LOGOFF => 412

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_LOGONLOGOFF => 413

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_TERMINAL_LOCKSCREENSAVER => 414

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_CONTROL_PANEL => 415

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_COMMAND_LINE_PROCESSORRUN => 416

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_PROCESSTASK_MANAGER => 417

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_SELECT_TASKAPPLICATION => 418

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_NEXT_TASKAPPLICATION => 419

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_PREVIOUS_TASKAPPLICATION => 420

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_PREEMPTIVE_HALT_TASKAPPLICATION => 421

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_INTEGRATED_HELP_CENTER => 422

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_DOCUMENTS => 423

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_THESAURUS => 424

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_DICTIONARY => 425

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_DESKTOP => 426

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_SPELL_CHECK => 427

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_GRAMMAR_CHECK => 428

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_WIRELESS_STATUS => 429

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_KEYBOARD_LAYOUT => 430

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_VIRUS_PROTECTION => 431

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_ENCRYPTION => 432

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_SCREEN_SAVER => 433

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_ALARMS => 434

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_CLOCK => 435

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_FILE_BROWSER => 436

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_POWER_STATUS => 437

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_IMAGE_BROWSER => 438

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_AUDIO_BROWSER => 439

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_MOVIE_BROWSER => 440

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_DIGITAL_RIGHTS_MANAGER => 441

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_DIGITAL_WALLET => 442

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_INSTANT_MESSAGING => 444

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_OEM_FEATURES_TIPSTUTORIAL_BROWSER => 445

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_OEM_HELP => 446

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_ONLINE_COMMUNITY => 447

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_ENTERTAINMENT_CONTENT_BROWSER => 448

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_ONLINE_SHOPPING_BROWSER => 449

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_SMARTCARD_INFORMATIONHELP => 450

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_MARKET_MONITORFINANCE_BROWSER => 451

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_CUSTOMIZED_CORPORATE_NEWS_BROWSER => 452

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_ONLINE_ACTIVITY_BROWSER => 453

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_SEARCH => 454

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_AUDIO_PLAYER => 455

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_MESSAGE_STATUS => 456

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_CONTACT_SYNC => 457

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_NAVIGATION => 458

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_CONTEXTAWARE_DESKTOP_ASSISTANT => 459

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_GENERIC_GUI_APPLICATION_CONTROLS => 512

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_NEW => 513

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_OPEN => 514

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_CLOSE => 515

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_EXIT => 516

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_MAXIMIZE => 517

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_MINIMIZE => 518

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SAVE => 519

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_PRINT => 520

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_PROPERTIES => 521

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_UNDO => 538

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_COPY => 539

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_CUT => 540

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_PASTE => 541

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SELECT_ALL => 542

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_FIND => 543

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_FIND_AND_REPLACE => 544

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SEARCH => 545

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_GOTO => 546

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_HOME => 547

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_BACK => 548

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_FORWARD => 549

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_STOP => 550

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_REFRESH => 551

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_PREVIOUS => 552

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_NEXT => 553

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_BOOKMARKS => 554

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_HISTORY => 555

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SUBSCRIPTIONS => 556

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_ZOOM_IN => 557

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_ZOOM_OUT => 558

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_ZOOM => 559

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_FULL_SCREEN_VIEW => 560

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_NORMAL_VIEW => 561

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_VIEW_TOGGLE => 562

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SCROLL_UP => 563

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SCROLL_DOWN => 564

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SCROLL => 565

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_PAN_LEFT => 566

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_PAN_RIGHT => 567

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_PAN => 568

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_NEW_WINDOW => 569

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_TILE_HORIZONTALLY => 570

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_TILE_VERTICALLY => 571

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_FORMAT => 572

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_EDIT => 573

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_BOLD => 574

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_ITALICS => 575

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_UNDERLINE => 576

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_STRIKETHROUGH => 577

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SUBSCRIPT => 578

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SUPERSCRIPT => 579

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_ALL_CAPS => 580

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_ROTATE => 581

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_RESIZE => 582

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_FLIP_HORIZONTAL => 583

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_FLIP_VERTICAL => 584

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_MIRROR_HORIZONTAL => 585

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_MIRROR_VERTICAL => 586

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_FONT_SELECT => 587

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_FONT_COLOR => 588

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_FONT_SIZE => 589

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_JUSTIFY_LEFT => 590

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_JUSTIFY_CENTER_H => 591

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_JUSTIFY_RIGHT => 592

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_JUSTIFY_BLOCK_H => 593

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_JUSTIFY_TOP => 594

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_JUSTIFY_CENTER_V => 595

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_JUSTIFY_BOTTOM => 596

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_JUSTIFY_BLOCK_V => 597

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_INDENT_DECREASE => 598

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_INDENT_INCREASE => 599

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_NUMBERED_LIST => 600

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_RESTART_NUMBERING => 601

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_BULLETED_LIST => 602

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_PROMOTE => 603

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_DEMOTE => 604

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_YES => 605

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_NO => 606

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_CANCEL => 607

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_CATALOG => 608

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_BUYCHECKOUT => 609

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_ADD_TO_CART => 610

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_EXPAND => 611

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_EXPAND_ALL => 612

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_COLLAPSE => 613

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_COLLAPSE_ALL => 614

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_PRINT_PREVIEW => 615

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_PASTE_SPECIAL => 616

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_INSERT_MODE => 617

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_DELETE => 618

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_LOCK => 619

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_UNLOCK => 620

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_PROTECT => 621

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_UNPROTECT => 622

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_ATTACH_COMMENT => 623

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_DELETE_COMMENT => 624

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_VIEW_COMMENT => 625

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SELECT_WORD => 626

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SELECT_SENTENCE => 627

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SELECT_PARAGRAPH => 628

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SELECT_COLUMN => 629

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SELECT_ROW => 630

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SELECT_TABLE => 631

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SELECT_OBJECT => 632

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_REDOREPEAT => 633

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SORT => 634

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SORT_ASCENDING => 635

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SORT_DESCENDING => 636

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_FILTER => 637

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SET_CLOCK => 638

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_VIEW_CLOCK => 639

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SELECT_TIME_ZONE => 640

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_EDIT_TIME_ZONES => 641

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SET_ALARM => 642

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_CLEAR_ALARM => 643

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SNOOZE_ALARM => 644

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_RESET_ALARM => 645

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SYNCHRONIZE => 646

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SENDRECEIVE => 647

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SEND_TO => 648

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_REPLY => 649

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_REPLY_ALL => 650

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_FORWARD_MSG => 651

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SEND => 652

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_ATTACH_FILE => 653

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_UPLOAD => 654

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_DOWNLOAD_SAVE_TARGET_AS => 655

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SET_BORDERS => 656

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_INSERT_ROW => 657

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_INSERT_COLUMN => 658

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_INSERT_FILE => 659

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_INSERT_PICTURE => 660

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_INSERT_OBJECT => 661

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_INSERT_SYMBOL => 662

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SAVE_AND_CLOSE => 663

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_RENAME => 664

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_MERGE => 665

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SPLIT => 666

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_DISRIBUTE_HORIZONTALLY => 667

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_DISTRIBUTE_VERTICALLY => 668

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_NEXT_KEYBOARD_LAYOUT_SELECT => 669

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_NAVIGATION_GUIDANCE => 670

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_DESKTOP_SHOW_ALL_WINDOWS => 671

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SOFT_KEY_LEFT => 672

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_SOFT_KEY_RIGHT => 673

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_DESKTOP_SHOW_ALL_APPLICATIONS => 674

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AC_IDLE_KEEP_ALIVE => 688

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_EXTENDED_KEYBOARD_ATTRIBUTES_COLLECTION => 704

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_KEYBOARD_FORM_FACTOR => 705

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_KEYBOARD_KEY_TYPE => 706

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_KEYBOARD_PHYSICAL_LAYOUT => 707

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_VENDOR_SPECIFIC_KEYBOARD_PHYSICAL_LAYOUT => 708

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_KEYBOARD_IETF_LANGUAGE_TAG_INDEX => 709

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_IMPLEMENTED_KEYBOARD_INPUT_ASSIST_CONTROLS => 710

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_KEYBOARD_INPUT_ASSIST_PREVIOUS => 711

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_KEYBOARD_INPUT_ASSIST_NEXT => 712

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_KEYBOARD_INPUT_ASSIST_PREVIOUS_GROUP => 713

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_KEYBOARD_INPUT_ASSIST_NEXT_GROUP => 714

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_KEYBOARD_INPUT_ASSIST_ACCEPT => 715

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_KEYBOARD_INPUT_ASSIST_CANCEL => 716

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_PRIVACY_SCREEN_TOGGLE => 720

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_PRIVACY_SCREEN_LEVEL_DECREMENT => 721

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_PRIVACY_SCREEN_LEVEL_INCREMENT => 722

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_PRIVACY_SCREEN_LEVEL_MINIMUM => 723

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_PRIVACY_SCREEN_LEVEL_MAXIMUM => 724

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CONTACT_EDITED => 1280

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CONTACT_ADDED => 1281

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CONTACT_RECORD_ACTIVE => 1282

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CONTACT_INDEX => 1283

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CONTACT_NICKNAME => 1284

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CONTACT_FIRST_NAME => 1285

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CONTACT_LAST_NAME => 1286

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CONTACT_FULL_NAME => 1287

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CONTACT_PHONE_NUMBER_PERSONAL => 1288

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CONTACT_PHONE_NUMBER_BUSINESS => 1289

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CONTACT_PHONE_NUMBER_MOBILE => 1290

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CONTACT_PHONE_NUMBER_PAGER => 1291

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CONTACT_PHONE_NUMBER_FAX => 1292

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CONTACT_PHONE_NUMBER_OTHER => 1293

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CONTACT_EMAIL_PERSONAL => 1294

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CONTACT_EMAIL_BUSINESS => 1295

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CONTACT_EMAIL_OTHER => 1296

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CONTACT_EMAIL_MAIN => 1297

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CONTACT_SPEED_DIAL_NUMBER => 1298

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CONTACT_STATUS_FLAG => 1299

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_CONTACT_MISC => 1300

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_DIGITIZER => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_PEN => 2

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_LIGHT_PEN => 3

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_TOUCH_SCREEN => 4

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_TOUCH_PAD => 5

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_WHITE_BOARD => 6

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_COORD_MEASURING => 7

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_3D_DIGITIZER => 8

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_STEREO_PLOTTER => 9

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_ARTICULATED_ARM => 10

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_ARMATURE => 11

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_MULTI_POINT => 12

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_FREE_SPACE_WAND => 13

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_DEVICE_CONFIGURATION => 14

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_HEAT_MAP => 15

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_STYLUS => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_PUCK => 33

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_FINGER => 34

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_DEVICE_SETTINGS => 35

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_CHARACTER_GESTURE => 36

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_TIP_PRESSURE => 48

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_BARREL_PRESSURE => 49

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_IN_RANGE => 50

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_TOUCH => 51

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_UNTOUCH => 52

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_TAP => 53

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_QUALITY => 54

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_DATA_VALID => 55

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_TRANSDUCER_INDEX => 56

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_TABLET_FUNC_KEYS => 57

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_PROG_CHANGE_KEYS => 58

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_BATTERY_STRENGTH => 59

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_INVERT => 60

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_X_TILT => 61

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_Y_TILT => 62

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_AZIMUTH => 63

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_ALTITUDE => 64

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_TWIST => 65

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_TIP_SWITCH => 66

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_SECONDARY_TIP_SWITCH => 67

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_BARREL_SWITCH => 68

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_ERASER => 69

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_TABLET_PICK => 70

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_TOUCH_VALID => 71

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_WIDTH => 72

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_HEIGHT => 73

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_CONTACT_IDENTIFIER => 81

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_DEVICE_MODE => 82

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_DEVICE_IDENTIFIER => 83

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_CONTACT_COUNT => 84

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_CONTACT_COUNT_MAXIMUM => 85

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_SCAN_TIME => 86

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_SURFACE_SWITCH => 87

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_BUTTON_SWITCH => 88

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_PAD_TYPE => 89

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_SECONDARY_BARREL_SWITCH => 90

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_TRANSDUCER_SERIAL => 91

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_PREFERRED_COLOR => 92

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_PREFERRED_COLOR_IS_LOCKED => 93

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_PREFERRED_LINE_WIDTH => 94

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_PREFERRED_LINE_WIDTH_IS_LOCKED => 95

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_LATENCY_MODE => 96

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_GESTURE_CHARACTER_QUALITY => 97

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_CHARACTER_GESTURE_DATA_LENGTH => 98

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_CHARACTER_GESTURE_DATA => 99

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_GESTURE_CHARACTER_ENCODING => 100

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_UTF8_CHARACTER_GESTURE_ENCODING => 101

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_UTF16_LITTLE_ENDIAN_CHARACTER_GESTURE_ENCODING => 102

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_UTF16_BIG_ENDIAN_CHARACTER_GESTURE_ENCODING => 103

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_UTF32_LITTLE_ENDIAN_CHARACTER_GESTURE_ENCODING => 104

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_UTF32_BIG_ENDIAN_CHARACTER_GESTURE_ENCODING => 105

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_HEAT_MAP_PROTOCOL_VENDOR_ID => 106

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_HEAT_MAP_PROTOCOL_VERSION => 107

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_HEAT_MAP_FRAME_DATA => 108

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_GESTURE_CHARACTER_ENABLE => 109

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_TRANSDUCER_SERIAL_PART2 => 110

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_NO_PREFERRED_COLOR => 111

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_PREFERRED_LINE_STYLE => 112

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_PREFERRED_LINE_STYLE_IS_LOCKED => 113

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_INK => 114

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_PENCIL => 115

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_HIGHLIGHTER => 116

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_CHISEL_MARKER => 117

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_BRUSH => 118

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_NO_PREFERENCE => 119

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_DIGITIZER_DIAGNOSTIC => 128

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_DIGITIZER_ERROR => 129

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_ERR_NORMAL_STATUS => 130

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_ERR_TRANSDUCERS_EXCEEDED => 131

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_ERR_FULL_TRANS_FEATURES_UNAVAILABLE => 132

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_ERR_CHARGE_LOW => 133

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_TRANSDUCER_SOFTWARE_INFO => 144

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_TRANSDUCER_VENDOR => 145

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_TRANSDUCER_PRODUCT => 146

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_DEVICE_SUPPORTED_PROTOCOLS => 147

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_TRANSDUCER_SUPPORTED_PROTOCOLS => 148

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_NO_PROTOCOL => 149

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_WACOM_AES_PROTOCOL => 150

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_USI_PROTOCOL => 151

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_MICROSOFT_PEN_PROTOCOL => 152

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_SUPPORTED_REPORT_RATES => 160

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_REPORT_RATE => 161

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_TRANSDUCER_CONNECTED => 162

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_SWITCH_DISABLED => 163

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_SWITCH_UNIMPLEMENTED => 164

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_TRANSDUCER_SWITCHES => 165

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_TRANSDUCER_INDEX_SELECTOR => 166

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_BUTTON_PRESS_THRESHOLD => 176

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_EYE_TRACKER => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_HEAD_TRACKER => 2

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_TRACKING_DATA => 16

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_CAPABILITIES => 17

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_CONFIGURATION => 18

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_STATUS => 19

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_CONTROL => 20

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_SENSOR_TIMESTAMP => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_POSITION_X => 33

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_POSITION_Y => 34

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_POSITION_Z => 35

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_GAZE_POINT => 36

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_LEFT_EYE_POSITION => 37

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_RIGHT_EYE_POSITION => 38

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_HEAD_POSITION => 39

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_HEAD_DIRECTION_POINT => 40

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_ROTATION_ABOUT_X_AXIS => 41

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_ROTATION_ABOUT_Y_AXIS => 42

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_ROTATION_ABOUT_Z_AXIS => 43

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_TRACKER_QUALITY => 256

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_MINIMUM_TRACKING_DISTANCE => 257

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_OPTIMUM_TRACKING_DISTANCE => 258

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_MAXIMUM_TRACKING_DISTANCE => 259

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_MAXIMUM_SCREEN_PLANE_WIDTH => 260

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_MAXIMUM_SCREEN_PLANE_HEIGHT => 261

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_DISPLAY_MANUFACTURER_ID => 512

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_DISPLAY_PRODUCT_ID => 513

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_DISPLAY_SERIAL_NUMBER => 514

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_DISPLAY_MANUFACTURER_DATE => 515

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_CALIBRATED_SCREEN_WIDTH => 516

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_CALIBRATED_SCREEN_HEIGHT => 517

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_SAMPLING_FREQUENCY => 768

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_CONFIGURATION_STATUS => 769

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_EYE_AND_HEAD_TRACKERS_DEVICE_MODE_REQUEST => 1024

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_FIDO_ALLIANCE_U2F_AUTHENTICATOR_DEVICE => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_FIDO_ALLIANCE_INPUT_REPORT_DATA => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_FIDO_ALLIANCE_OUTPUT_REPORT_DATA => 33

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_3D_GAME_CONTROLLER => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_PINBALL_DEVICE => 2

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_GUN_DEVICE => 3

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_POV => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_TURN_RIGHT_LEFT => 33

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_PITCH_FORWARD_BACK => 34

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_ROLL_RIGHT_LEFT => 35

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_MOVE_RIGHT_LEFT => 36

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_MOVE_FORWARD_BACK => 37

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_MOVE_UP_DOWN => 38

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_LEAN_RIGHT_LEFT => 39

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_LEAN_FORWARD_BACK => 40

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_POV_HEIGHT => 41

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_FLIPPER => 42

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_SECONDARY_FLIPPER => 43

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_BUMP => 44

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_NEW_GAME => 45

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_SHOOT_BALL => 46

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_PLAYER => 47

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_GUN_BOLT => 48

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_GUN_CLIP => 49

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_GUN_SELECTOR => 50

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_GUN_SINGLE_SHOT => 51

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_GUN_BURST => 52

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_GUN_AUTOMATIC => 53

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_GUN_SAFETY => 54

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_GAMEPAD_FIRE_JUMP => 55

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_GAMEPAD_TRIGGER => 57

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_FORMFITTING_GAMEPAD => 58

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_POINTER => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_MOUSE => 2

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_JOYSTICK => 4

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_GAMEPAD => 5

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_KEYBOARD => 6

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_KEYPAD => 7

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_MULTI_AXIS_CONTROLLER => 8

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_TABLET_PC_SYSTEM_CTL => 9

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_WATER_COOLING_DEVICE => 10

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_COMPUTER_CHASSIS_DEVICE => 11

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_WIRELESS_RADIO_CONTROLS => 12

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_PORTABLE_DEVICE_CONTROL => 13

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_INTERACTIVE_CONTROL => 14

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SPATIAL_CONTROLLER => 15

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_ASSISTIVE_CONTROL => 16

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DEVICE_DOCK => 17

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DOCKABLE_DEVICE => 18

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_CALL_STATE_MANAGEMENT_CONTROL => 19

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_X => 48

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_Y => 49

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_Z => 50

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_RX => 51

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_RY => 52

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_RZ => 53

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SLIDER => 54

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DIAL => 55

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_WHEEL => 56

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_HATSWITCH => 57

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_COUNTED_BUFFER => 58

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_BYTE_COUNT => 59

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_MOTION_WAKEUP => 60

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_START => 61

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SELECT => 62

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_VX => 64

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_VY => 65

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_VZ => 66

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_VBRX => 67

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_VBRY => 68

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_VBRZ => 69

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_VNO => 70

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_FEATURE_NOTIFICATION => 71

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_RESOLUTION_MULTIPLIER => 72

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_QX => 73

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_QY => 74

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_QZ => 75

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_QW => 76

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSTEM_CTL => 128

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_POWER => 129

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_SLEEP => 130

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_WAKE => 131

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_CONTEXT_MENU => 132

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_MAIN_MENU => 133

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_APP_MENU => 134

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_HELP_MENU => 135

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_MENU_EXIT => 136

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_MENU_SELECT => 137

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_MENU_RIGHT => 138

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_MENU_LEFT => 139

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_MENU_UP => 140

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_MENU_DOWN => 141

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_COLD_RESTART => 142

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_WARM_RESTART => 143

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DPAD_UP => 144

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DPAD_DOWN => 145

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DPAD_RIGHT => 146

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DPAD_LEFT => 147

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_INDEX_TRIGGER => 148

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_PALM_TRIGGER => 149

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_THUMBSTICK => 150

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_FN => 151

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_FN_LOCK => 152

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_FN_LOCK_INDICATOR => 153

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_DISMISS_NOTIFICATION => 154

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSTEM_DO_NOT_DISTURB => 155

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_DOCK => 160

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_UNDOCK => 161

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_SETUP => 162

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_SYS_BREAK => 163

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_SYS_DBG_BREAK => 164

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_APP_BREAK => 165

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_APP_DBG_BREAK => 166

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_MUTE => 167

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_HIBERNATE => 168

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_MICROPHONE_MUTE => 169

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_ACCESSIBILITY_BINDING => 170

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_DISP_INVERT => 176

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_DISP_INTERNAL => 177

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_DISP_EXTERNAL => 178

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_DISP_BOTH => 179

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_DISP_DUAL => 180

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_DISP_TOGGLE => 181

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_DISP_SWAP => 182

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSCTL_DISP_AUTOSCALE => 183

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SENSOR_ZONE => 192

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_RPM => 193

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_COOLANT_LEVEL => 194

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_COOLANT_CRITICAL_LEVEL => 195

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_COOLANT_PUMP => 196

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_CHASSIS_ENCLOSURE => 197

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_WIRELESS_RADIO_BUTTON => 198

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_WIRELESS_RADIO_LED => 199

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_WIRELESS_RADIO_SLIDER_SWITCH => 200

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSTEM_DISPLAY_ROTATION_LOCK_BUTTON => 201

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSTEM_DISPLAY_ROTATION_LOCK_SLIDER_SWITCH => 202

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_CONTROL_ENABLE => 203

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DOCKABLE_DEVICE_UNIQUE_ID => 208

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DOCKABLE_DEVICE_VENDOR_ID => 209

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DOCKABLE_DEVICE_PRIMARY_USAGE_PAGE => 210

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DOCKABLE_DEVICE_PRIMARY_USAGE_ID => 211

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DOCKABLE_DEVICE_DOCKING_STATE => 212

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DOCKABLE_DEVICE_DISPLAY_OCCLUSION => 213

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DOCKABLE_DEVICE_OBJECT_TYPE => 214

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_CALL_ACTIVE_LED => 224

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_CALL_MUTE_TOGGLE => 225

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_CALL_MUTE_LED => 226

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DEVICE_BACKGROUNDNONUSER_CONTROLS => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DEVICE_BATTERY_STRENGTH => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DEVICE_WIRELESS_CHANNEL => 33

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DEVICE_WIRELESS_ID => 34

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DEVICE_DISCOVER_WIRELESS_CONTROL => 35

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DEVICE_SECURITY_CODE_CHAR_ENTERED => 36

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DEVICE_SECURITY_CODE_CHAR_ERASED => 37

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DEVICE_SECURITY_CODE_CLEARED => 38

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DEVICE_SEQUENCE_ID => 39

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DEVICE_SEQUENCE_ID_RESET => 40

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DEVICE_RF_SIGNAL_STRENGTH => 41

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DEVICE_SOFTWARE_VERSION => 42

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DEVICE_PROTOCOL_VERSION => 43

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DEVICE_HARDWARE_VERSION => 44

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DEVICE_MAJOR => 45

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DEVICE_MINOR => 46

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DEVICE_REVISION => 47

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DEVICE_HANDEDNESS => 48

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DEVICE_EITHER_HAND => 49

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DEVICE_LEFT_HAND => 50

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DEVICE_RIGHT_HAND => 51

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DEVICE_BOTH_HANDS => 52

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DEVICE_GRIP_POSE_OFFSET => 64

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_DEVICE_POINTER_POSE_OFFSET => 65

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_SIMPLE_CONTROLLER => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_WAVEFORM_LIST => 16

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_DURATION_LIST => 17

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_AUTO_TRIGGER => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_MANUAL_TRIGGER => 33

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_AUTO_ASSOCIATED_CONTROL => 34

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_INTENSITY => 35

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_REPEAT_COUNT => 36

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_RETRIGGER_PERIOD => 37

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_WAVEFORM_VENDOR_PAGE => 38

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_WAVEFORM_VENDOR_ID => 39

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_WAVEFORM_CUTOFF_TIME => 40

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_WAVEFORM_NONE => 4097

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_WAVEFORM_STOP => 4098

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_WAVEFORM_CLICK => 4099

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_WAVEFORM_BUZZ => 4100

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_WAVEFORM_RUMBLE => 4101

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_WAVEFORM_PRESS => 4102

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_WAVEFORM_RELEASE => 4103

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_WAVEFORM_HOVER => 4104

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_WAVEFORM_SUCCESS => 4105

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_WAVEFORM_ERROR => 4106

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_WAVEFORM_INK_CONTINUOUS => 4107

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_WAVEFORM_PENCIL_CONTINUOUS => 4108

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_WAVEFORM_MARKER_CONTINUOUS => 4109

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_WAVEFORM_CHISEL_MARKER_CONTINUOUS => 4110

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_WAVEFORM_BRUSH_CONTINUOUS => 4111

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_WAVEFORM_ERASER_CONTINUOUS => 4112

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_WAVEFORM_SPARKLE_CONTINUOUS => 4113

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_NOEVENT => 0

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_ROLLOVER => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_POSTFAIL => 2

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_UNDEFINED => 3

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_aA => 4

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_bB => 5

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_cC => 6

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_dD => 7

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_eE => 8

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_fF => 9

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_gG => 10

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_hH => 11

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_iI => 12

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_jJ => 13

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_kK => 14

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_lL => 15

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_mM => 16

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_nN => 17

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_oO => 18

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_pP => 19

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_qQ => 20

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_rR => 21

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_sS => 22

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_tT => 23

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_uU => 24

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_vV => 25

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_wW => 26

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_xX => 27

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_yY => 28

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_zZ => 29

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_ONE => 30

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_TWO_AND_AT => 31

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_THREE_AND_HASH => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_FOUR_AND_DOLLAR => 33

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_FIVE_AND_PERCENT => 34

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_SIX_AND_CARET => 35

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_SEVEN_AND_AMPERSAND => 36

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_EIGHT_AND_STAR => 37

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_NINE_AND_LEFT_BRACKET => 38

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_ZERO => 39

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_RETURN => 40

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_ESCAPE => 41

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_DELETE => 42

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_TAB => 43

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_SPACEBAR => 44

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_DASH_AND_UNDERSCORE => 45

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_EQUALS_AND_PLUS => 46

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_LEFT_BRACE => 47

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_RIGHT_BRACE => 48

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_BACKSLASH_AND_PIPE => 49

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_NONUS_HASH_AND_TILDE => 50

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_SEMICOLON_AND_COLON => 51

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_LEFT_APOS_AND_DOUBLE => 52

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_GRAVE_ACCENT_AND_TILDE => 53

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_COMMA_AND_LESSTHAN => 54

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_PERIOD_AND_GREATERTHAN => 55

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_FORWARDSLASH_AND_QUESTIONMARK => 56

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_CAPS_LOCK => 57

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_F1 => 58

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_F2 => 59

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_F3 => 60

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_F4 => 61

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_F5 => 62

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_F6 => 63

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_F7 => 64

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_F8 => 65

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_F9 => 66

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_F10 => 67

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_F11 => 68

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_F12 => 69

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_PRINT_SCREEN => 70

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_SCROLL_LOCK => 71

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_PAUSE => 72

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_INSERT => 73

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_HOME => 74

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_PAGEUP => 75

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_DELETE_FORWARD => 76

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_END => 77

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_PAGEDOWN => 78

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_RIGHTARROW => 79

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_LEFTARROW => 80

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_DOWNARROW => 81

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_UPARROW => 82

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_NUM_LOCK => 83

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_FORWARDSLASH => 84

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_STAR => 85

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_DASH => 86

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_PLUS => 87

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_ENTER => 88

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_ONE_AND_END => 89

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_TWO_AND_DOWN_ARROW => 90

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_THREE_AND_PAGEDN => 91

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_FOUR_AND_LEFT_ARROW => 92

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_FIVE => 93

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_SIX_AND_RIGHT_ARROW => 94

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_SEVEN_AND_HOME => 95

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_EIGHT_AND_UP_ARROW => 96

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_NINE_AND_PAGEUP => 97

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_ZERO_AND_INSERT => 98

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_PERIOD_AND_DELETE => 99

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_NONUS_BACKSLASH_AND_PIPE => 100

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_APPLICATION => 101

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_POWER => 102

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_EQUALS => 103

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_F13 => 104

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_F14 => 105

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_F15 => 106

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_F16 => 107

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_F17 => 108

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_F18 => 109

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_F19 => 110

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_F20 => 111

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_F21 => 112

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_F22 => 113

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_F23 => 114

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_F24 => 115

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_EXECUTE => 116

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_HELP => 117

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_MENU => 118

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_SELECT => 119

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_STOP => 120

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_AGAIN => 121

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_UNDO => 122

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_CUT => 123

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_COPY => 124

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_PASTE => 125

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_FIND => 126

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_MUTE => 127

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_VOLUME_UP => 128

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_VOLUME_DOWN => 129

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_LOCKING_CAPS_LOCK => 130

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_LOCKING_NUM_LOCK => 131

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_LOCKING_SCROLL_LOCK => 132

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_COMMA => 133

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_EQUAL_SIGN => 134

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_INTERNATIONAL1 => 135

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_INTERNATIONAL2 => 136

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_INTERNATIONAL3 => 137

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_INTERNATIONAL4 => 138

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_INTERNATIONAL5 => 139

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_INTERNATIONAL6 => 140

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_INTERNATIONAL7 => 141

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_INTERNATIONAL8 => 142

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_INTERNATIONAL9 => 143

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_LANG1 => 144

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_LANG2 => 145

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_LANG3 => 146

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_LANG4 => 147

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_LANG5 => 148

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_LANG6 => 149

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_LANG7 => 150

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_LANG8 => 151

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_LANG9 => 152

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_ALTERNATE_ERASE => 153

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_SYSREQ_ATTENTION => 154

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_CANCEL => 155

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_CLEAR => 156

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_PRIOR => 157

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_RETURN_NO_ENTER => 158

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_SEPARATOR => 159

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_OUT => 160

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_OPER => 161

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_CLEAR_AGAIN => 162

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_CRSEL_PROPS => 163

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_EXSEL => 164

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_DOUBLE_0 => 176

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_TRIPLE_0 => 177

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_THOUSANDS_SEPARATOR => 178

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_DECIMAL_SEPARATOR => 179

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_CURRENCY_UNIT => 180

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_CURRENCY_SUBUNIT => 181

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_LEFT_BRACKET => 182

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_RIGHT_BRACKET => 183

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_LEFT_BRACE => 184

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_RIGHT_BRACE => 185

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_TAB => 186

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_BACKSPACE => 187

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_A => 188

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_B => 189

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_C => 190

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_D => 191

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_E => 192

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_F => 193

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_XOR => 194

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_CARET => 195

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_PERCENTAGE => 196

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_LESS => 197

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_GREATER => 198

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_AMPERSAND => 199

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_DOUBLE_AMPERSAND => 200

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_BAR => 201

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_DOUBLE_BAR => 202

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_COLON => 203

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_HASH => 204

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_SPACE => 205

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_AT => 206

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_BANG => 207

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_MEMORY_STORE => 208

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_MEMORY_RECALL => 209

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_MEMORY_CLEAR => 210

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_MEMORY_ADD => 211

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_MEMORY_SUBTRACT => 212

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_MEMORY_MULTIPLY => 213

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_MEMORY_DIVIDE => 214

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_PLUS_MINUS => 215

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_CLEAR => 216

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_CLEAR_ENTRY => 217

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_BINARY => 218

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_OCTAL => 219

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_DECIMAL => 220

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_HEXADECIMAL => 221

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_LCTRL => 224

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_LSHFT => 225

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_LALT => 226

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_LGUI => 227

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_RCTRL => 228

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_RSHFT => 229

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_RALT => 230

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_RGUI => 231

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_NUM_LOCK => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_CAPS_LOCK => 2

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_SCROLL_LOCK => 3

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_COMPOSE => 4

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_KANA => 5

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_POWER => 6

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_SHIFT => 7

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_DO_NOT_DISTURB => 8

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_MUTE => 9

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_TONE_ENABLE => 10

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_HIGH_CUT_FILTER => 11

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_LOW_CUT_FILTER => 12

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_EQUALIZER_ENABLE => 13

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_SOUND_FIELD_ON => 14

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_SURROUND_FIELD_ON => 15

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_REPEAT => 16

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_STEREO => 17

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_SAMPLING_RATE_DETECT => 18

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_SPINNING => 19

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_CAV => 20

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_CLV => 21

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_RECORDING_FORMAT_DET => 22

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_OFF_HOOK => 23

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_RING => 24

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_MESSAGE_WAITING => 25

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_DATA_MODE => 26

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_BATTERY_OPERATION => 27

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_BATTERY_OK => 28

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_BATTERY_LOW => 29

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_SPEAKER => 30

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_HEAD_SET => 31

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_HOLD => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_MICROPHONE => 33

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_COVERAGE => 34

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_NIGHT_MODE => 35

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_SEND_CALLS => 36

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_CALL_PICKUP => 37

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_CONFERENCE => 38

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_STAND_BY => 39

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_CAMERA_ON => 40

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_CAMERA_OFF => 41

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_ON_LINE => 42

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_OFF_LINE => 43

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_BUSY => 44

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_READY => 45

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_PAPER_OUT => 46

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_PAPER_JAM => 47

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_REMOTE => 48

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_FORWARD => 49

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_REVERSE => 50

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_STOP => 51

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_REWIND => 52

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_FAST_FORWARD => 53

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_PLAY => 54

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_PAUSE => 55

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_RECORD => 56

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_ERROR => 57

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_SELECTED_INDICATOR => 58

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_IN_USE_INDICATOR => 59

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_MULTI_MODE_INDICATOR => 60

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_INDICATOR_ON => 61

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_INDICATOR_FLASH => 62

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_INDICATOR_SLOW_BLINK => 63

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_INDICATOR_FAST_BLINK => 64

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_INDICATOR_OFF => 65

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_FLASH_ON_TIME => 66

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_SLOW_BLINK_ON_TIME => 67

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_SLOW_BLINK_OFF_TIME => 68

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_FAST_BLINK_ON_TIME => 69

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_FAST_BLINK_OFF_TIME => 70

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_INDICATOR_COLOR => 71

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_RED => 72

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_GREEN => 73

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_AMBER => 74

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_GENERIC_INDICATOR => 75

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_SYSTEM_SUSPEND => 76

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_EXTERNAL_POWER => 77

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_INDICATOR_BLUE => 78

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_INDICATOR_ORANGE => 79

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_GOOD_STATUS => 80

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_WARNING_STATUS => 81

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_RGB_LED => 82

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_RED_LED_CHANNEL => 83

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_BLUE_LED_CHANNEL => 84

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_GREEN_LED_CHANNEL => 85

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_LED_INTENSITY => 86

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_SYSTEM_MICROPHONE_MUTE => 87

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_PLAYER_INDICATOR => 96

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_PLAYER_1 => 97

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_PLAYER_2 => 98

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_PLAYER_3 => 99

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_PLAYER_4 => 100

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_PLAYER_5 => 101

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_PLAYER_6 => 102

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_PLAYER_7 => 103

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LED_PLAYER_8 => 104

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_ATTRBIUTES_REPORT => 2

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_LAMP_COUNT => 3

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_BOUNDING_BOX_WIDTH_IN_MICROMETERS => 4

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_BOUNDING_BOX_HEIGHT_IN_MICROMETERS => 5

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_BOUNDING_BOX_DEPTH_IN_MICROMETERS => 6

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_KIND => 7

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_MIN_UPDATE_INTERVAL_IN_MICROSECONDS => 8

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_LAMP_ATTRIBUTES_REQUEST_REPORT => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_LAMP_ID => 33

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_LAMP_ATTRIBUTES_RESPONSE_REPORT => 34

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_POSITION_X_IN_MICROMETERS => 35

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_POSITION_Y_IN_MICROMETERS => 36

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_POSITION_Z_IN_MICROMETERS => 37

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_LAMP_PURPOSES => 38

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_UPDATE_LATENCY_IN_MICROSECONDS => 39

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_RED_LEVEL_COUNT => 40

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_GREEN_LEVEL_COUNT => 41

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_BLUE_LEVEL_COUNT => 42

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_INTENSITY_LEVEL_COUNT => 43

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_IS_PROGRAMMABLE => 44

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_INPUT_BINDING => 45

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_LAMP_MULTI_UPDATE_REPORT => 80

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_LAMP_RED_UPDATE_CHANNEL => 81

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_LAMP_GREEN_UPDATE_CHANNEL => 82

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_LAMP_BLUE_UPDATE_CHANNEL => 83

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_LAMP_INTENSITY_UPDATE_CHANNEL => 84

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_LAMP_UPDATE_FLAGS => 85

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_LAMP_RANGE_UPDATE_REPORT => 96

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_LAMP_ID_START => 97

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_LAMP_ID_END => 98

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_CONTROL_REPORT => 112

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_LAMPARRAY_AUTONOMOUS_MODE => 113

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MAGNETIC_STRIPE_READER_MSR_DEVICE_READONLY => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MAGNETIC_STRIPE_READER_TRACK_1_LENGTH => 17

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MAGNETIC_STRIPE_READER_TRACK_2_LENGTH => 18

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MAGNETIC_STRIPE_READER_TRACK_3_LENGTH => 19

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MAGNETIC_STRIPE_READER_TRACK_JIS_LENGTH => 20

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MAGNETIC_STRIPE_READER_TRACK_DATA => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MAGNETIC_STRIPE_READER_TRACK_1_DATA => 33

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MAGNETIC_STRIPE_READER_TRACK_2_DATA => 34

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MAGNETIC_STRIPE_READER_TRACK_3_DATA => 35

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MAGNETIC_STRIPE_READER_TRACK_JIS_DATA => 36

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_MEDICAL_ULTRASOUND => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_VCRACQUISITION => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_FREEZETHAW => 33

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_CLIP_STORE => 34

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_UPDATE => 35

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_NEXT => 36

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_SAVE => 37

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_PRINT => 38

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_MICROPHONE_ENABLE => 39

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_CINE => 64

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_TRANSMIT_POWER => 65

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_VOLUME => 66

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_FOCUS => 67

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_DEPTH => 68

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_SOFT_STEP__PRIMARY => 96

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_SOFT_STEP__SECONDARY => 97

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_DEPTH_GAIN_COMPENSATION => 112

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_ZOOM_SELECT => 128

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_ZOOM_ADJUST => 129

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_SPECTRAL_DOPPLER_MODE_SELECT => 130

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_SPECTRAL_DOPPLER_ADJUST => 131

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_COLOR_DOPPLER_MODE_SELECT => 132

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_COLOR_DOPPLER_ADJUST => 133

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_MOTION_MODE_SELECT => 134

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_MOTION_MODE_ADJUST => 135

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_2D_MODE_SELECT => 136

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_2D_MODE_ADJUST => 137

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_SOFT_CONTROL_SELECT => 160

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MEDICAL_INSTRUMENT_SOFT_CONTROL_ADJUST => 161

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MICROSOFT_BLUETOOTH_HANDSFREE_GENERAL => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MICROSOFT_BLUETOOTH_HANDSFREE_DIAL_NUMBER => 33

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MICROSOFT_BLUETOOTH_HANDSFREE_DIAL_MEMORY => 34

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MICROSOFT_BLUETOOTH_HANDSFREE_CALL_SETUP => 36

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MONITOR_MONITOR_CONTROL => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MONITOR_EDID_INFORMATION => 2

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MONITOR_VDIF_INFORMATION => 3

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MONITOR_VESA_VERSION => 4

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_PHYSICAL_INPUT_DEVICE => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_NORMAL => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_SET_EFFECT_REPORT => 33

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_EFFECT_BLOCK_INDEX => 34

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_PARAMETER_BLOCK_OFFSET => 35

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_ROM_FLAG => 36

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_EFFECT_TYPE => 37

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_ET_CONSTANT => 38

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_ET_RAMP => 39

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_ET_CUSTOM => 40

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_ET_SQUARE => 48

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_ET_SINE => 49

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_ET_TRIANGLE => 50

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_ET_SAWTOOTH_UP => 51

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_ET_SAWTOOTH_DOWN => 52

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_ET_SPRING => 64

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_ET_DAMPER => 65

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_ET_INERTIA => 66

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_ET_FRICTION => 67

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_DURATION => 80

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_SAMPLE_PERIOD => 81

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_GAIN => 82

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_TRIGGER_BUTTON => 83

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_TRIGGER_REPEAT_INTERVAL => 84

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_AXES_ENABLE => 85

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_DIRECTION_ENABLE => 86

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_DIRECTION => 87

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_TYPE_SPECIFIC_BLOCK_OFFSET => 88

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_BLOCK_TYPE => 89

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_SET_ENVELOPE_REPORT => 90

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_ATTACK_LEVEL => 91

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_ATTACK_TIME => 92

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_FADE_LEVEL => 93

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_FADE_TIME => 94

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_SET_CONDITION_REPORT => 95

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_CP_OFFSET => 96

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_POSITIVE_COEFFICIENT => 97

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_NEGATIVE_COEFFICIENT => 98

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_POSITIVE_SATURATION => 99

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_NEGATIVE_SATURATION => 100

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_DEAD_BAND => 101

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_DOWNLOAD_FORCE_SAMPLE => 102

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_ISOCH_CUSTOMFORCE_ENABLE => 103

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_CUSTOM_FORCE_DATA_REPORT => 104

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_CUSTOM_FORCE_DATA => 105

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_CUSTOM_FORCE_VENDOR_DEFINED_DATA => 106

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_SET_CUSTOM_FORCE_REPORT => 107

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_CUSTOM_FORCE_DATA_OFFSET => 108

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_SAMPLE_COUNT => 109

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_SET_PERIODIC_REPORT => 110

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_OFFSET => 111

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_MAGNITUDE => 112

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_PHASE => 113

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_PERIOD => 114

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_SET_CONSTANT_FORCE_REPORT => 115

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_SET_RAMP_FORCE_REPORT => 116

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_RAMP_START => 117

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_RAMP_END => 118

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_EFFECT_OPERATION_REPORT => 119

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_EFFECT_OPERATION => 120

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_OP_EFFECT_START => 121

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_OP_EFFECT_START_SOLO => 122

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_OP_EFFECT_STOP => 123

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_LOOP_COUNT => 124

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_DEVICE_GAIN_REPORT => 125

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_DEVICE_GAIN => 126

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_POOL_REPORT => 127

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_RAM_POOL_SIZE => 128

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_ROM_POOL_SIZE => 129

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_ROM_EFFECT_BLOCK_COUNT => 130

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_SIMULTANEOUS_EFFECTS_MAX => 131

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_POOL_ALIGNMENT => 132

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_PARAMETER_BLOCK_MOVE_REPORT => 133

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_MOVE_SOURCE => 134

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_MOVE_DESTINATION => 135

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_MOVE_LENGTH => 136

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_BLOCK_LOAD_REPORT => 137

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_BLOCK_LOAD_STATUS => 139

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_BLOCK_LOAD_SUCCESS => 140

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_BLOCK_LOAD_FULL => 141

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_BLOCK_LOAD_ERROR => 142

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_BLOCK_HANDLE => 143

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_BLOCK_FREE_REPORT => 144

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_TYPE_SPECIFIC_BLOCK_HANDLE => 145

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_STATE_REPORT => 146

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_EFFECT_PLAYING => 148

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_PID_DEVICE_CONTROL_REPORT => 149

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_DEVICE_CONTROL => 150

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_DC_ENABLE_ACTUATORS => 151

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_DC_DISABLE_ACTUATORS => 152

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_DC_STOP_ALL_EFFECTS => 153

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_DC_DEVICE_RESET => 154

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_DC_DEVICE_PAUSE => 155

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_DC_DEVICE_CONTINUE => 156

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_DEVICE_PAUSED => 159

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_ACTUATORS_ENABLED => 160

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_SAFETY_SWITCH => 164

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_ACTUATOR_OVERRIDE_SWITCH => 165

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_ACTUATOR_POWER => 166

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_START_DELAY => 167

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_PARAMETER_BLOCK_SIZE => 168

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_DEVICE_MANAGED_POOL => 169

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_SHARED_PARAMETER_BLOCKS => 170

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_CREATE_NEW_EFFECT => 171

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PID_RAMPOOL_AVAILABLE => 172

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_INAME => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_PRESENT_STATUS => 2

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_CHANGED_STATUS => 3

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_UPS => 4

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_POWER_SUPPLY => 5

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_BATTERY_SYSTEM => 16

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_BATTERY_SYSTEM_ID => 17

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_BATTERY => 18

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_BATTERY_ID => 19

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_CHARGER => 20

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_CHARGER_ID => 21

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_POWER_CONVERTER => 22

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_POWER_CONVERTER_ID => 23

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_OUTLET_SYSTEM => 24

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_OUTLET_SYSTEM_ID => 25

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_INPUT => 26

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_INPUT_ID => 27

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_OUTPUT => 28

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_OUTPUT_ID => 29

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_FLOW => 30

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_FLOW_ID => 31

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_OUTLET => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_OUTLET_ID => 33

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_GANG => 34

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_GANG_ID => 35

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_POWER_SUMMARY => 36

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_POWER_SUMMARY_ID => 37

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_VOLTAGE => 48

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_CURRENT => 49

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_FREQUENCY => 50

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_APPARENT_POWER => 51

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_ACTIVE_POWER => 52

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_PERCENT_LOAD => 53

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_TEMPERATURE => 54

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_HUMIDITY => 55

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_BAD_COUNT => 56

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_CONFIG_VOLTAGE => 64

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_CONFIG_CURRENT => 65

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_CONFIG_FREQUENCY => 66

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_CONFIG_APPARENT_POWER => 67

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_CONFIG_ACTIVE_POWER => 68

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_CONFIG_PERCENT_LOAD => 69

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_CONFIG_TEMPERATURE => 70

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_CONFIG_HUMIDITY => 71

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_SWITCH_ON_CONTROL => 80

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_SWITCH_OFF_CONTROL => 81

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_TOGGLE_CONTROL => 82

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_LOW_VOLTAGE_TRANSFER => 83

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_HIGH_VOLTAGE_TRANSFER => 84

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_DELAY_BEFORE_REBOOT => 85

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_DELAY_BEFORE_STARTUP => 86

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_DELAY_BEFORE_SHUTDOWN => 87

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_TEST => 88

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_MODULE_RESET => 89

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_AUDIBLE_ALARM_CONTROL => 90

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_PRESENT => 96

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_GOOD => 97

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_INTERNAL_FAILURE => 98

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_VOLTAG_OUT_OF_RANGE => 99

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_FREQUENCY_OUT_OF_RANGE => 100

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_OVERLOAD => 101

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_OVER_CHARGED => 102

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_OVER_TEMPERATURE => 103

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_SHUTDOWN_REQUESTED => 104

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_SHUTDOWN_IMMINENT => 105

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_SWITCH_ONOFF => 107

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_SWITCHABLE => 108

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_USED => 109

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_BOOST => 110

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_BUCK => 111

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_INITIALIZED => 112

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_TESTED => 113

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_AWAITING_POWER => 114

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_COMMUNICATION_LOST => 115

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_IMANUFACTURER => 253

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_IPRODUCT => 254

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_POWER_ISERIALNUMBER => 255

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALES => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_DEVICE => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_CLASS => 33

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_CLASS_I_METRIC => 34

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_CLASS_II_METRIC => 35

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_CLASS_III_METRIC => 36

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_CLASS_IIIL_METRIC => 37

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_CLASS_IV_METRIC => 38

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_CLASS_III_ENGLISH => 39

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_CLASS_IIIL_ENGLISH => 40

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_CLASS_IV_ENGLISH => 41

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_CLASS_GENERIC => 42

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_ATTRIBUTE_REPORT => 48

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_CONTROL_REPORT => 49

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_DATA_REPORT => 50

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_STATUS_REPORT => 51

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_WEIGHT_LIMIT_REPORT => 52

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_STATISTICS_REPORT => 53

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_DATA_WEIGHT => 64

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_DATA_SCALING => 65

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_WEIGHT_UNIT => 80

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_WEIGHT_UNIT_MILLIGRAM => 81

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_WEIGHT_UNIT_GRAM => 82

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_WEIGHT_UNIT_KILOGRAM => 83

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_WEIGHT_UNIT_CARATS => 84

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_WEIGHT_UNIT_TAELS => 85

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_WEIGHT_UNIT_GRAINS => 86

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_WEIGHT_UNIT_PENNYWEIGHTS => 87

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_WEIGHT_UNIT_METRIC_TON => 88

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_WEIGHT_UNIT_AVOIR_TON => 89

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_WEIGHT_UNIT_TROY_OUNCE => 90

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_WEIGHT_UNIT_OUNCE => 91

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_WEIGHT_UNIT_POUND => 92

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_CALIBRATION_COUNT => 96

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_REZERO_COUNT => 97

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_STATUS => 112

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_STATUS_FAULT => 113

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_STATUS_STABLE_AT_CENTER_OF_ZERO => 114

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_STATUS_IN_MOTION => 115

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_STATUS_WEIGHT_STABLE => 116

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_STATUS_UNDER_ZERO => 117

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_STATUS_OVER_WEIGHT_LIMIT => 118

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_STATUS_REQUIRES_CALIBRATION => 119

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_SCALE_STATUS_REQUIRES_REZEROING => 120

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_ZERO_SCALE => 128

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_WEIGHING_DEVICE_ENFORCED_ZERO_RETURN => 129

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SENSOR => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_BIOMETRIC => 16

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_BIOMETRIC_HUMAN_PRESENCE => 17

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_BIOMETRIC_HUMAN_PROXIMITY => 18

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_BIOMETRIC_HUMAN_TOUCH => 19

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_BIOMETRIC_BLOOD_PRESSURE => 20

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_BIOMETRIC_BODY_TEMPERATURE => 21

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_BIOMETRIC_HEART_RATE => 22

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_BIOMETRIC_HEART_RATE_VARIABILITY => 23

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_BIOMETRIC_PERIPHERAL_OXYGEN_SATURATION => 24

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_BIOMETRIC_RESPIRATORY_RATE => 25

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ELECTRICAL => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ELECTRICAL_CAPACITANCE => 33

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ELECTRICAL_CURRENT => 34

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ELECTRICAL_POWER => 35

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ELECTRICAL_INDUCTANCE => 36

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ELECTRICAL_RESISTANCE => 37

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ELECTRICAL_VOLTAGE => 38

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ELECTRICAL_POTENTIOMETER => 39

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ELECTRICAL_FREQUENCY => 40

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ELECTRICAL_PERIOD => 41

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ENVIRONMENTAL => 48

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ENVIRONMENTAL_ATMOSPHERIC_PRESSURE => 49

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ENVIRONMENTAL_HUMIDITY => 50

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ENVIRONMENTAL_TEMPERATURE => 51

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ENVIRONMENTAL_WIND_DIRECTION => 52

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ENVIRONMENTAL_WIND_SPEED => 53

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ENVIRONMENTAL_AIR_QUALITY => 54

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ENVIRONMENTAL_HEAT_INDEX => 55

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ENVIRONMENTAL_SURFACE_TEMPERATURE => 56

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ENVIRONMENTAL_VOLATILE_ORGANIC_COMPOUNDS => 57

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ENVIRONMENTAL_OBJECT_PRESENCE => 58

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ENVIRONMENTAL_OBJECT_PROXIMITY => 59

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_LIGHT => 64

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_LIGHT_AMBIENT_LIGHT => 65

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_LIGHT_CONSUMER_INFRARED => 66

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_LIGHT_INFRARED_LIGHT => 67

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_LIGHT_VISIBLE_LIGHT => 68

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_LIGHT_ULTRAVIOLET_LIGHT => 69

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_LOCATION => 80

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_LOCATION_BROADCAST => 81

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_LOCATION_DEAD_RECKONING => 82

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_LOCATION_GPS_GLOBAL_POSITIONING_SYSTEM => 83

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_LOCATION_LOOKUP => 84

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_LOCATION_OTHER => 85

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_LOCATION_STATIC => 86

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_LOCATION_TRIANGULATION => 87

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MECHANICAL => 96

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MECHANICAL_BOOLEAN_SWITCH => 97

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MECHANICAL_BOOLEAN_SWITCH_ARRAY => 98

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MECHANICAL_MULTIVALUE_SWITCH => 99

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MECHANICAL_FORCE => 100

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MECHANICAL_PRESSURE => 101

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MECHANICAL_STRAIN => 102

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MECHANICAL_WEIGHT => 103

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MECHANICAL_HAPTIC_VIBRATOR => 104

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MECHANICAL_HALL_EFFECT_SWITCH => 105

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MOTION => 112

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MOTION_ACCELEROMETER_1D => 113

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MOTION_ACCELEROMETER_2D => 114

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MOTION_ACCELEROMETER_3D => 115

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MOTION_GYROMETER_1D => 116

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MOTION_GYROMETER_2D => 117

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MOTION_GYROMETER_3D => 118

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MOTION_MOTION_DETECTOR => 119

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MOTION_SPEEDOMETER => 120

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MOTION_ACCELEROMETER => 121

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MOTION_GYROMETER => 122

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MOTION_GRAVITY_VECTOR => 123

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MOTION_LINEAR_ACCELEROMETER => 124

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ORIENTATION => 128

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ORIENTATION_COMPASS_1D => 129

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ORIENTATION_COMPASS_2D => 130

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ORIENTATION_COMPASS_3D => 131

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ORIENTATION_INCLINOMETER_1D => 132

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ORIENTATION_INCLINOMETER_2D => 133

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ORIENTATION_INCLINOMETER_3D => 134

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ORIENTATION_DISTANCE_1D => 135

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ORIENTATION_DISTANCE_2D => 136

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ORIENTATION_DISTANCE_3D => 137

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ORIENTATION_DEVICE_ORIENTATION => 138

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ORIENTATION_COMPASS => 139

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ORIENTATION_INCLINOMETER => 140

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ORIENTATION_DISTANCE => 141

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ORIENTATION_RELATIVE_ORIENTATION => 142

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ORIENTATION_SIMPLE_ORIENTATION => 143

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SCANNER => 144

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SCANNER_BARCODE => 145

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SCANNER_RFID => 146

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SCANNER_NFC => 147

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_TIME => 160

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_TIME_ALARM_TIMER => 161

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_TIME_REAL_TIME_CLOCK => 162

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PERSONAL_ACTIVITY => 176

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PERSONAL_ACTIVITY_ACTIVITY_DETECTION => 177

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PERSONAL_ACTIVITY_DEVICE_POSITION => 178

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PERSONAL_ACTIVITY_FLOOR_TRACKER => 179

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PERSONAL_ACTIVITY_PEDOMETER => 180

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PERSONAL_ACTIVITY_STEP_DETECTION => 181

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ORIENTATION_EXTENDED => 192

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ORIENTATION_EXTENDED_GEOMAGNETIC_ORIENTATION => 193

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ORIENTATION_EXTENDED_MAGNETOMETER => 194

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_GESTURE => 208

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_GESTURE_CHASSIS_FLIP_GESTURE => 209

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_GESTURE_HINGE_FOLD_GESTURE => 210

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_OTHER => 224

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_OTHER_CUSTOM => 225

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_OTHER_GENERIC => 226

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_OTHER_GENERIC_ENUMERATOR => 227

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_OTHER_HINGE_ANGLE => 228

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VENDOR_RESERVED_1 => 240

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VENDOR_RESERVED_2 => 241

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VENDOR_RESERVED_3 => 242

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VENDOR_RESERVED_4 => 243

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VENDOR_RESERVED_5 => 244

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VENDOR_RESERVED_6 => 245

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VENDOR_RESERVED_7 => 246

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VENDOR_RESERVED_8 => 247

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VENDOR_RESERVED_9 => 248

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VENDOR_RESERVED_10 => 249

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VENDOR_RESERVED_11 => 250

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VENDOR_RESERVED_12 => 251

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VENDOR_RESERVED_13 => 252

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VENDOR_RESERVED_14 => 253

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VENDOR_RESERVED_15 => 254

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VENDOR_RESERVED_16 => 255

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_EVENT => 512

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_EVENT_SENSOR_STATE => 513

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_EVENT_SENSOR_EVENT => 514

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY => 768

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_FRIENDLY_NAME => 769

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_PERSISTENT_UNIQUE_ID => 770

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_SENSOR_STATUS => 771

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_MINIMUM_REPORT_INTERVAL => 772

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_SENSOR_MANUFACTURER => 773

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_SENSOR_MODEL => 774

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_SENSOR_SERIAL_NUMBER => 775

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_SENSOR_DESCRIPTION => 776

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_SENSOR_CONNECTION_TYPE => 777

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_SENSOR_DEVICE_PATH => 778

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_HARDWARE_REVISION => 779

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_FIRMWARE_VERSION => 780

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_RELEASE_DATE => 781

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_REPORT_INTERVAL => 782

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_CHANGE_SENSITIVITY_ABSOLUTE => 783

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_CHANGE_SENSITIVITY_PERCENT_OF_RANGE => 784

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_CHANGE_SENSITIVITY_PERCENT_RELATIVE => 785

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_ACCURACY => 786

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_RESOLUTION => 787

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_MAXIMUM => 788

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_MINIMUM => 789

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_REPORTING_STATE => 790

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_SAMPLING_RATE => 791

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_RESPONSE_CURVE => 792

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_POWER_STATE => 793

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_MAXIMUM_FIFO_EVENTS => 794

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_REPORT_LATENCY => 795

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_FLUSH_FIFO_EVENTS => 796

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_MAXIMUM_POWER_CONSUMPTION => 797

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_IS_PRIMARY => 798

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_HUMAN_PRESENCE_DETECTION_TYPE => 799

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_LOCATION => 1024

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ALTITUDE_ANTENNA_SEA_LEVEL => 1026

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_DIFFERENTIAL_REFERENCE_STATION_ID => 1027

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ALTITUDE_ELLIPSOID_ERROR => 1028

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ALTITUDE_ELLIPSOID => 1029

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ALTITUDE_SEA_LEVEL_ERROR => 1030

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ALTITUDE_SEA_LEVEL => 1031

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_DIFFERENTIAL_GPS_DATA_AGE => 1032

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ERROR_RADIUS => 1033

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_FIX_QUALITY => 1034

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_FIX_TYPE => 1035

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GEOIDAL_SEPARATION => 1036

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GPS_OPERATION_MODE => 1037

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GPS_SELECTION_MODE => 1038

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GPS_STATUS => 1039

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_POSITION_DILUTION_OF_PRECISION => 1040

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HORIZONTAL_DILUTION_OF_PRECISION => 1041

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_VERTICAL_DILUTION_OF_PRECISION => 1042

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_LATITUDE => 1043

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_LONGITUDE => 1044

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_TRUE_HEADING => 1045

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_MAGNETIC_HEADING => 1046

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_MAGNETIC_VARIATION => 1047

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_SPEED => 1048

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_SATELLITES_IN_VIEW => 1049

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_SATELLITES_IN_VIEW_AZIMUTH => 1050

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_SATELLITES_IN_VIEW_ELEVATION => 1051

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_SATELLITES_IN_VIEW_IDS => 1052

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_SATELLITES_IN_VIEW_PRNS => 1053

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_SATELLITES_IN_VIEW_SN_RATIOS => 1054

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_SATELLITES_USED_COUNT => 1055

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_SATELLITES_USED_PRNS => 1056

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_NMEA_SENTENCE => 1057

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ADDRESS_LINE_1 => 1058

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ADDRESS_LINE_2 => 1059

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CITY => 1060

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_STATE_OR_PROVINCE => 1061

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_COUNTRY_OR_REGION => 1062

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_POSTAL_CODE => 1063

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_LOCATION => 1066

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_LOCATION_DESIRED_ACCURACY => 1067

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ENVIRONMENTAL => 1072

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ATMOSPHERIC_PRESSURE => 1073

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_RELATIVE_HUMIDITY => 1075

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_TEMPERATURE => 1076

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_WIND_DIRECTION => 1077

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_WIND_SPEED => 1078

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_AIR_QUALITY_INDEX => 1079

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_EQUIVALENT_CO2 => 1080

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_VOLATILE_ORGANIC_COMPOUND_CONCENTRATION => 1081

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_OBJECT_PRESENCE => 1082

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_OBJECT_PROXIMITY_RANGE => 1083

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_OBJECT_PROXIMITY_OUT_OF_RANGE => 1084

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_ENVIRONMENTAL => 1088

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_REFERENCE_PRESSURE => 1089

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_MOTION => 1104

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_MOTION_STATE => 1105

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ACCELERATION => 1106

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ACCELERATION_AXIS_X => 1107

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ACCELERATION_AXIS_Y => 1108

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ACCELERATION_AXIS_Z => 1109

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ANGULAR_VELOCITY => 1110

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ANGULAR_VELOCITY_ABOUT_X_AXIS => 1111

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ANGULAR_VELOCITY_ABOUT_Y_AXIS => 1112

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ANGULAR_VELOCITY_ABOUT_Z_AXIS => 1113

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ANGULAR_POSITION => 1114

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ANGULAR_POSITION_ABOUT_X_AXIS => 1115

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ANGULAR_POSITION_ABOUT_Y_AXIS => 1116

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ANGULAR_POSITION_ABOUT_Z_AXIS => 1117

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_MOTION_SPEED => 1118

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_MOTION_INTENSITY => 1119

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ORIENTATION => 1136

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HEADING => 1137

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HEADING_X_AXIS => 1138

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HEADING_Y_AXIS => 1139

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HEADING_Z_AXIS => 1140

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HEADING_COMPENSATED_MAGNETIC_NORTH => 1141

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HEADING_COMPENSATED_TRUE_NORTH => 1142

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HEADING_MAGNETIC_NORTH => 1143

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HEADING_TRUE_NORTH => 1144

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_DISTANCE => 1145

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_DISTANCE_X_AXIS => 1146

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_DISTANCE_Y_AXIS => 1147

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_DISTANCE_Z_AXIS => 1148

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_DISTANCE_OUTOFRANGE => 1149

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_TILT => 1150

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_TILT_X_AXIS => 1151

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_TILT_Y_AXIS => 1152

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_TILT_Z_AXIS => 1153

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ROTATION_MATRIX => 1154

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_QUATERNION => 1155

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_MAGNETIC_FLUX => 1156

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_MAGNETIC_FLUX_X_AXIS => 1157

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_MAGNETIC_FLUX_Y_AXIS => 1158

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_MAGNETIC_FLUX_Z_AXIS => 1159

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_MAGNETOMETER_ACCURACY => 1160

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_SIMPLE_ORIENTATION_DIRECTION => 1161

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_MECHANICAL => 1168

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_BOOLEAN_SWITCH_STATE => 1169

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_BOOLEAN_SWITCH_ARRAY_STATES => 1170

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_MULTIVALUE_SWITCH_VALUE => 1171

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_FORCE => 1172

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ABSOLUTE_PRESSURE => 1173

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GAUGE_PRESSURE => 1174

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_STRAIN => 1175

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_WEIGHT => 1176

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_MECHANICAL => 1184

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_VIBRATION_STATE => 1185

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_FORWARD_VIBRATION_SPEED => 1186

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_BACKWARD_VIBRATION_SPEED => 1187

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_BIOMETRIC => 1200

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HUMAN_PRESENCE => 1201

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HUMAN_PROXIMITY_RANGE => 1202

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HUMAN_PROXIMITY_OUT_OF_RANGE => 1203

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HUMAN_TOUCH_STATE => 1204

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_BLOOD_PRESSURE => 1205

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_BLOOD_PRESSURE_DIASTOLIC => 1206

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_BLOOD_PRESSURE_SYSTOLIC => 1207

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HEART_RATE => 1208

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_RESTING_HEART_RATE => 1209

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HEARTBEAT_INTERVAL => 1210

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_RESPIRATORY_RATE => 1211

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_SPO2 => 1212

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HUMAN_ATTENTION_DETECTED => 1213

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HUMAN_HEAD_AZIMUTH => 1214

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HUMAN_HEAD_ALTITUDE => 1215

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HUMAN_HEAD_ROLL => 1216

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HUMAN_HEAD_PITCH => 1217

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HUMAN_HEAD_YAW => 1218

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HUMAN_CORRELATION_ID => 1219

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_LIGHT => 1232

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ILLUMINANCE => 1233

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_COLOR_TEMPERATURE => 1234

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CHROMATICITY => 1235

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CHROMATICITY_X => 1236

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CHROMATICITY_Y => 1237

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CONSUMER_IR_SENTENCE_RECEIVE => 1238

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_INFRARED_LIGHT => 1239

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_RED_LIGHT => 1240

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GREEN_LIGHT => 1241

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_BLUE_LIGHT => 1242

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ULTRAVIOLET_A_LIGHT => 1243

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ULTRAVIOLET_B_LIGHT => 1244

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ULTRAVIOLET_INDEX => 1245

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_NEAR_INFRARED_LIGHT => 1246

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_LIGHT => 1247

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_CONSUMER_IR_SENTENCE_SEND => 1248

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_AUTO_BRIGHTNESS_PREFERRED => 1250

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_AUTO_COLOR_PREFERRED => 1251

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_SCANNER => 1264

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_RFID_TAG_40_BIT => 1265

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_NFC_SENTENCE_RECEIVE => 1266

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_SCANNER => 1272

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_NFC_SENTENCE_SEND => 1273

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ELECTRICAL => 1280

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CAPACITANCE => 1281

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CURRENT => 1282

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ELECTRICAL_POWER => 1283

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_INDUCTANCE => 1284

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_RESISTANCE => 1285

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_VOLTAGE => 1286

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_FREQUENCY => 1287

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_PERIOD => 1288

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_PERCENT_OF_RANGE => 1289

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_TIME => 1312

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_YEAR => 1313

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_MONTH => 1314

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_DAY => 1315

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_DAY_OF_WEEK => 1316

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HOUR => 1317

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_MINUTE => 1318

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_SECOND => 1319

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_MILLISECOND => 1320

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_TIMESTAMP => 1321

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_JULIAN_DAY_OF_YEAR => 1322

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_TIME_SINCE_SYSTEM_BOOT => 1323

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_TIME => 1328

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_TIME_ZONE_OFFSET_FROM_UTC => 1329

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_TIME_ZONE_NAME => 1330

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_DAYLIGHT_SAVINGS_TIME_OBSERVED => 1331

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_TIME_TRIM_ADJUSTMENT => 1332

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_ARM_ALARM => 1333

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM => 1344

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_USAGE => 1345

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_BOOLEAN_ARRAY => 1346

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE => 1347

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_1 => 1348

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_2 => 1349

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_3 => 1350

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_4 => 1351

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_5 => 1352

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_6 => 1353

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_7 => 1354

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_8 => 1355

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_9 => 1356

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_10 => 1357

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_11 => 1358

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_12 => 1359

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_13 => 1360

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_14 => 1361

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_15 => 1362

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_16 => 1363

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_17 => 1364

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_18 => 1365

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_19 => 1366

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_20 => 1367

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_21 => 1368

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_22 => 1369

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_23 => 1370

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_24 => 1371

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_25 => 1372

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_26 => 1373

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_27 => 1374

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_VALUE_28 => 1375

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GENERIC => 1376

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GENERIC_GUID_OR_PROPERTYKEY => 1377

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GENERIC_CATEGORY_GUID => 1378

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GENERIC_TYPE_GUID => 1379

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GENERIC_EVENT_PROPERTYKEY => 1380

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GENERIC_PROPERTY_PROPERTYKEY => 1381

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GENERIC_DATA_FIELD_PROPERTYKEY => 1382

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GENERIC_EVENT => 1383

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GENERIC_PROPERTY => 1384

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GENERIC_DATA_FIELD => 1385

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ENUMERATOR_TABLE_ROW_INDEX => 1386

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ENUMERATOR_TABLE_ROW_COUNT => 1387

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GENERIC_GUID_OR_PROPERTYKEY_KIND => 1388

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GENERIC_GUID => 1389

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GENERIC_PROPERTYKEY => 1390

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GENERIC_TOP_LEVEL_COLLECTION_ID => 1391

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GENERIC_REPORT_ID => 1392

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GENERIC_REPORT_ITEM_POSITION_INDEX => 1393

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GENERIC_FIRMWARE_VARTYPE => 1394

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GENERIC_UNIT_OF_MEASURE => 1395

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GENERIC_UNIT_EXPONENT => 1396

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GENERIC_REPORT_SIZE => 1397

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GENERIC_REPORT_COUNT => 1398

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_GENERIC => 1408

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_ENUMERATOR_TABLE_ROW_INDEX => 1409

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_ENUMERATOR_TABLE_ROW_COUNT => 1410

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_PERSONAL_ACTIVITY => 1424

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ACTIVITY_TYPE => 1425

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_ACTIVITY_STATE => 1426

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_DEVICE_POSITION => 1427

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_STEP_COUNT => 1428

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_STEP_COUNT_RESET => 1429

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_STEP_DURATION => 1430

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_STEP_TYPE => 1431

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_MINIMUM_ACTIVITY_DETECTION_INTERVAL => 1440

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_SUPPORTED_ACTIVITY_TYPES => 1441

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_SUBSCRIBED_ACTIVITY_TYPES => 1442

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_SUPPORTED_STEP_TYPES => 1443

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_SUBSCRIBED_STEP_TYPES => 1444

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_FLOOR_HEIGHT => 1445

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_CUSTOM_TYPE_ID => 1456

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_CUSTOM => 1472

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_CUSTOM_VALUE_1 => 1473

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_CUSTOM_VALUE_2 => 1474

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_CUSTOM_VALUE_3 => 1475

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_CUSTOM_VALUE_4 => 1476

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_CUSTOM_VALUE_5 => 1477

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_CUSTOM_VALUE_6 => 1478

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_CUSTOM_VALUE_7 => 1479

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_CUSTOM_VALUE_8 => 1480

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_CUSTOM_VALUE_9 => 1481

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_CUSTOM_VALUE_10 => 1482

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_CUSTOM_VALUE_11 => 1483

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_CUSTOM_VALUE_12 => 1484

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_CUSTOM_VALUE_13 => 1485

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_CUSTOM_VALUE_14 => 1486

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_CUSTOM_VALUE_15 => 1487

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_PROPERTY_CUSTOM_VALUE_16 => 1488

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HINGE => 1504

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HINGE_ANGLE => 1505

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GESTURE_SENSOR => 1520

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_GESTURE_STATE => 1521

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HINGE_FOLD_INITIAL_ANGLE => 1522

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HINGE_FOLD_FINAL_ANGLE => 1523

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HINGE_FOLD_CONTRIBUTING_PANEL => 1524

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DATA_FIELD_HINGE_FOLD_TYPE => 1525

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SENSOR_STATE_UNDEFINED => 2048

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SENSOR_STATE_READY => 2049

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SENSOR_STATE_NOT_AVAILABLE => 2050

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SENSOR_STATE_NO_DATA => 2051

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SENSOR_STATE_INITIALIZING => 2052

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SENSOR_STATE_ACCESS_DENIED => 2053

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SENSOR_STATE_ERROR => 2054

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SENSOR_EVENT_UNKNOWN => 2064

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SENSOR_EVENT_STATE_CHANGED => 2065

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SENSOR_EVENT_PROPERTY_CHANGED => 2066

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SENSOR_EVENT_DATA_UPDATED => 2067

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SENSOR_EVENT_POLL_RESPONSE => 2068

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SENSOR_EVENT_CHANGE_SENSITIVITY => 2069

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SENSOR_EVENT_RANGE_MAXIMUM_REACHED => 2070

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SENSOR_EVENT_RANGE_MINIMUM_REACHED => 2071

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SENSOR_EVENT_HIGH_THRESHOLD_CROSS_UPWARD => 2072

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SENSOR_EVENT_HIGH_THRESHOLD_CROSS_DOWNWARD => 2073

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SENSOR_EVENT_LOW_THRESHOLD_CROSS_UPWARD => 2074

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SENSOR_EVENT_LOW_THRESHOLD_CROSS_DOWNWARD => 2075

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SENSOR_EVENT_ZERO_THRESHOLD_CROSS_UPWARD => 2076

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SENSOR_EVENT_ZERO_THRESHOLD_CROSS_DOWNWARD => 2077

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SENSOR_EVENT_PERIOD_EXCEEDED => 2078

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SENSOR_EVENT_FREQUENCY_EXCEEDED => 2079

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SENSOR_EVENT_COMPLEX_TRIGGER => 2080

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_CONNECTION_TYPE_PC_INTEGRATED => 2096

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_CONNECTION_TYPE_PC_ATTACHED => 2097

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_CONNECTION_TYPE_PC_EXTERNAL => 2098

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_REPORTING_STATE_REPORT_NO_EVENTS => 2112

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_REPORTING_STATE_REPORT_ALL_EVENTS => 2113

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_REPORTING_STATE_REPORT_THRESHOLD_EVENTS => 2114

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_REPORTING_STATE_WAKE_ON_NO_EVENTS => 2115

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_REPORTING_STATE_WAKE_ON_ALL_EVENTS => 2116

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_REPORTING_STATE_WAKE_ON_THRESHOLD_EVENTS => 2117

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_REPORTING_STATE_ANYTIME_SEL => 2118

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_POWER_STATE_UNDEFINED => 2128

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_POWER_STATE_D0_FULL_POWER => 2129

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_POWER_STATE_D1_LOW_POWER => 2130

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_POWER_STATE_D2_STANDBY_POWER_WITH_WAKEUP => 2131

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_POWER_STATE_D3_SLEEP_WITH_WAKEUP => 2132

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_POWER_STATE_D4_POWER_OFF => 2133

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ACCURACY_DEFAULT => 2144

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ACCURACY_HIGH => 2145

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ACCURACY_MEDIUM => 2146

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ACCURACY_LOW => 2147

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_FIX_QUALITY_NO_FIX => 2160

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_FIX_QUALITY_GPS => 2161

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_FIX_QUALITY_DGPS => 2162

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_FIX_TYPE_NO_FIX => 2176

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_FIX_TYPE_GPS_SPS_MODE_FIX_VALID => 2177

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_FIX_TYPE_DGPS_SPS_MODE_FIX_VALID => 2178

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_FIX_TYPE_GPS_PPS_MODE_FIX_VALID => 2179

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_FIX_TYPE_REAL_TIME_KINEMATIC => 2180

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_FIX_TYPE_FLOAT_RTK => 2181

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_FIX_TYPE_ESTIMATED_DEAD_RECKONED => 2182

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_FIX_TYPE_MANUAL_INPUT_MODE => 2183

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_FIX_TYPE_SIMULATOR_MODE => 2184

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_GPS_OPERATION_MODE_MANUAL => 2192

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_GPS_OPERATION_MODE_AUTOMATIC => 2193

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_GPS_SELECTION_MODE_AUTONOMOUS => 2208

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_GPS_SELECTION_MODE_DGPS => 2209

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_GPS_SELECTION_MODE_ESTIMATED_DEAD_RECKONED => 2210

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_GPS_SELECTION_MODE_MANUAL_INPUT => 2211

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_GPS_SELECTION_MODE_SIMULATOR => 2212

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_GPS_SELECTION_MODE_DATA_NOT_VALID => 2213

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_GPS_STATUS_DATA_VALID => 2224

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_GPS_STATUS_DATA_NOT_VALID => 2225

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DAY_OF_WEEK_SUNDAY => 2240

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DAY_OF_WEEK_MONDAY => 2241

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DAY_OF_WEEK_TUESDAY => 2242

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DAY_OF_WEEK_WEDNESDAY => 2243

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DAY_OF_WEEK_THURSDAY => 2244

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DAY_OF_WEEK_FRIDAY => 2245

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DAY_OF_WEEK_SATURDAY => 2246

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_KIND_CATEGORY => 2256

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_KIND_TYPE => 2257

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_KIND_EVENT => 2258

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_KIND_PROPERTY => 2259

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_KIND_DATA_FIELD => 2260

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MAGNETOMETER_ACCURACY_LOW => 2272

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MAGNETOMETER_ACCURACY_MEDIUM => 2273

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MAGNETOMETER_ACCURACY_HIGH => 2274

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SIMPLE_ORIENTATION_DIRECTION_NOT_ROTATED => 2288

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SIMPLE_ORIENTATION_DIRECTION_ROTATED_90_DEGREES_CCW => 2289

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SIMPLE_ORIENTATION_DIRECTION_ROTATED_180_DEGREES_CCW => 2290

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SIMPLE_ORIENTATION_DIRECTION_ROTATED_270_DEGREES_CCW => 2291

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SIMPLE_ORIENTATION_DIRECTION_FACE_UP => 2292

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_SIMPLE_ORIENTATION_DIRECTION_FACE_DOWN => 2293

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_NULL => 2304

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_BOOL => 2305

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_UI1 => 2306

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_I1 => 2307

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_UI2 => 2308

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_I2 => 2309

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_UI4 => 2310

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_I4 => 2311

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_UI8 => 2312

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_I8 => 2313

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_R4 => 2314

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_R8 => 2315

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_WSTR => 2316

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_STR => 2317

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_CLSID => 2318

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_VECTOR_VT_UI1 => 2319

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F16E0 => 2320

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F16E1 => 2321

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F16E2 => 2322

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F16E3 => 2323

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F16E4 => 2324

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F16E5 => 2325

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F16E6 => 2326

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F16E7 => 2327

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F16E8 => 2328

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F16E9 => 2329

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F16EA => 2330

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F16EB => 2331

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F16EC => 2332

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F16ED => 2333

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F16EE => 2334

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F16EF => 2335

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F32E0 => 2336

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F32E1 => 2337

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F32E2 => 2338

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F32E3 => 2339

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F32E4 => 2340

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F32E5 => 2341

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F32E6 => 2342

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F32E7 => 2343

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F32E8 => 2344

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F32E9 => 2345

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F32EA => 2346

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F32EB => 2347

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F32EC => 2348

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F32ED => 2349

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F32EE => 2350

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_VT_F32EF => 2351

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ACTIVITY_TYPE_UNKNOWN => 2352

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ACTIVITY_TYPE_STATIONARY => 2353

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ACTIVITY_TYPE_FIDGETING => 2354

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ACTIVITY_TYPE_WALKING => 2355

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ACTIVITY_TYPE_RUNNING => 2356

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ACTIVITY_TYPE_IN_VEHICLE => 2357

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ACTIVITY_TYPE_BIKING => 2358

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ACTIVITY_TYPE_IDLE => 2359

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_NOT_SPECIFIED => 2368

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_LUX => 2369

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_DEGREES_KELVIN => 2370

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_DEGREES_CELSIUS => 2371

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_PASCAL => 2372

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_NEWTON => 2373

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_METERSSECOND => 2374

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_KILOGRAM => 2375

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_METER => 2376

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_METERSSECONDSECOND => 2377

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_FARAD => 2378

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_AMPERE => 2379

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_WATT => 2380

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_HENRY => 2381

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_OHM => 2382

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_VOLT => 2383

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_HERTZ => 2384

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_BAR => 2385

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_DEGREES_ANTICLOCKWISE => 2386

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_DEGREES_CLOCKWISE => 2387

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_DEGREES => 2388

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_DEGREESSECOND => 2389

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_DEGREESSECONDSECOND => 2390

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_KNOT => 2391

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_PERCENT => 2392

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_SECOND => 2393

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_MILLISECOND => 2394

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_G => 2395

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_BYTES => 2396

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_MILLIGAUSS => 2397

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_UNIT_BITS => 2398

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ACTIVITY_STATE_NO_STATE_CHANGE => 2400

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ACTIVITY_STATE_START_ACTIVITY => 2401

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_ACTIVITY_STATE_END_ACTIVITY => 2402

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_EXPONENT_0 => 2416

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_EXPONENT_1 => 2417

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_EXPONENT_2 => 2418

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_EXPONENT_3 => 2419

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_EXPONENT_4 => 2420

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_EXPONENT_5 => 2421

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_EXPONENT_6 => 2422

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_EXPONENT_7 => 2423

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_EXPONENT_8 => 2424

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_EXPONENT_9 => 2425

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_EXPONENT_A => 2426

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_EXPONENT_B => 2427

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_EXPONENT_C => 2428

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_EXPONENT_D => 2429

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_EXPONENT_E => 2430

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_EXPONENT_F => 2431

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DEVICE_POSITION_UNKNOWN => 2432

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DEVICE_POSITION_UNCHANGED => 2433

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DEVICE_POSITION_ON_DESK => 2434

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DEVICE_POSITION_IN_HAND => 2435

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DEVICE_POSITION_MOVING_IN_BAG => 2436

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_DEVICE_POSITION_STATIONARY_IN_BAG => 2437

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_STEP_TYPE_UNKNOWN => 2448

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_STEP_TYPE_WALKING => 2449

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_STEP_TYPE_RUNNING => 2450

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_GESTURE_STATE_UNKNOWN => 2464

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_GESTURE_STATE_STARTED => 2465

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_GESTURE_STATE_COMPLETED => 2466

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_GESTURE_STATE_CANCELLED => 2467

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_HINGE_FOLD_CONTRIBUTING_PANEL_UNKNOWN => 2480

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_HINGE_FOLD_CONTRIBUTING_PANEL_PANEL_1 => 2481

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_HINGE_FOLD_CONTRIBUTING_PANEL_PANEL_2 => 2482

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_HINGE_FOLD_CONTRIBUTING_PANEL_BOTH => 2483

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_HINGE_FOLD_TYPE_UNKNOWN => 2484

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_HINGE_FOLD_TYPE_INCREASING => 2485

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_HINGE_FOLD_TYPE_DECREASING => 2486

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_HUMAN_PRESENCE_DETECTION_TYPE_VENDORDEFINED_NONBIOMETRIC => 2496

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_HUMAN_PRESENCE_DETECTION_TYPE_VENDORDEFINED_BIOMETRIC => 2497

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_HUMAN_PRESENCE_DETECTION_TYPE_FACIAL_BIOMETRIC => 2498

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_HUMAN_PRESENCE_DETECTION_TYPE_AUDIO_BIOMETRIC => 2499

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MODIFIER_CHANGE_SENSITIVITY_ABSOLUTE => 4096

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MODIFIER_MAXIMUM => 8192

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MODIFIER_MINIMUM => 12288

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MODIFIER_ACCURACY => 16384

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MODIFIER_RESOLUTION => 20480

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MODIFIER_THRESHOLD_HIGH => 24576

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MODIFIER_THRESHOLD_LOW => 28672

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MODIFIER_CALIBRATION_OFFSET => 32768

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MODIFIER_CALIBRATION_MULTIPLIER => 36864

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MODIFIER_REPORT_INTERVAL => 40960

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MODIFIER_FREQUENCY_MAX => 45056

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MODIFIER_PERIOD_MAX => 49152

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MODIFIER_CHANGE_SENSITIVITY_PERCENT_OF_RANGE => 53248

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MODIFIER_CHANGE_SENSITIVITY_PERCENT_RELATIVE => 57344

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SENSORS_MODIFIER_VENDOR_RESERVED => 61440

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_FLIGHT_SIMULATION_DEVICE => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_AUTOMOBILE_SIMULATION_DEVICE => 2

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_TANK_SIMULATION_DEVICE => 3

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_SPACESHIP_SIMULATION_DEVICE => 4

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_SUBMARINE_SIMULATION_DEVICE => 5

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_SAILING_SIMULATION_DEVICE => 6

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_MOTORCYCLE_SIMULATION_DEVICE => 7

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_SPORTS_SIMULATION_DEVICE => 8

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_AIRPLANE_SIMULATION_DEVICE => 9

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_HELICOPTER_SIMULATION_DEVICE => 10

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_MAGIC_CARPET_SIMULATION_DEVICE => 11

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_BICYCLE_SIMULATION_DEVICE => 12

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_FLIGHT_CONTROL_STICK => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_FLIGHT_STICK => 33

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_CYCLIC_CONTROL => 34

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_CYCLIC_TRIM => 35

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_FLIGHT_YOKE => 36

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_TRACK_CONTROL => 37

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_AILERON => 176

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_AILERON_TRIM => 177

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_ANTI_TORQUE_CONTROL => 178

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_AUTOPIOLOT_ENABLE => 179

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_CHAFF_RELEASE => 180

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_COLLECTIVE_CONTROL => 181

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_DIVE_BRAKE => 182

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_ELECTRONIC_COUNTERMEASURES => 183

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_ELEVATOR => 184

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_ELEVATOR_TRIM => 185

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_RUDDER => 186

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_THROTTLE => 187

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_FLIGHT_COMMUNICATIONS => 188

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_FLARE_RELEASE => 189

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_LANDING_GEAR => 190

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_TOE_BRAKE => 191

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_TRIGGER => 192

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_WEAPONS_ARM => 193

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_WEAPONS_SELECT => 194

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_WING_FLAPS => 195

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_ACCELERATOR => 196

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_BRAKE => 197

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_CLUTCH => 198

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_SHIFTER => 199

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_STEERING => 200

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_TURRET_DIRECTION => 201

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_BARREL_ELEVATION => 202

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_DIVE_PLANE => 203

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_BALLAST => 204

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_BICYCLE_CRANK => 205

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_HANDLE_BARS => 206

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_FRONT_BRAKE => 207

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SIMULATION_REAR_BRAKE => 208

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SOC_SOC_CONTROL => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SOC_FIRMWARE_TRANSFER => 2

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SOC_FIRMWARE_FILE_ID => 3

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SOC_FILE_OFFSET_IN_BYTES => 4

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SOC_FILE_TRANSFER_SIZE_MAX_IN_BYTES => 5

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SOC_FILE_PAYLOAD => 6

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SOC_FILE_PAYLOAD_SIZE_IN_BYTES => 7

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SOC_FILE_PAYLOAD_CONTAINS_LAST_BYTES => 8

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SOC_FILE_TRANSFER_STOP => 9

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SOC_FILE_TRANSFER_TILL_END => 10

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_BASEBALL_BAT => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_GOLF_CLUB => 2

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_ROWING_MACHINE => 3

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_TREADMILL => 4

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_OAR => 48

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_SLOPE => 49

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_RATE => 50

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_STICK_SPEED => 51

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_STICK_FACE_ANGLE => 52

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_HEEL_TOE => 53

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_FOLLOW_THROUGH => 54

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_TEMPO => 55

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_STICK_TYPE => 56

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_HEIGHT => 57

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_PUTTER => 80

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_1_IRON => 81

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_2_IRON => 82

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_3_IRON => 83

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_4_IRON => 84

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_5_IRON => 85

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_6_IRON => 86

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_7_IRON => 87

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_8_IRON => 88

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_9_IRON => 89

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_10_IRON => 90

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_11_IRON => 91

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_SAND_WEDGE => 92

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_LOFT_WEDGE => 93

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_POWER_WEDGE => 94

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_1_WOOD => 95

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_3_WOOD => 96

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_5_WOOD => 97

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_7_WOOD => 98

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_SPORT_9_WOOD => 99

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_ANSWERING_MACHINE => 2

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_MESSAGE_CONTROLS => 3

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_HANDSET => 4

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_HEADSET => 5

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_KEYPAD => 6

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PROGRAMMABLE_BUTTON => 7

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_HOOK_SWITCH => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_FLASH => 33

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_FEATURE => 34

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_HOLD => 35

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_REDIAL => 36

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_TRANSFER => 37

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_DROP => 38

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PARK => 39

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_FORWARD_CALLS => 40

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_ALTERNATE_FUNCTION => 41

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_LINE => 42

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_SPEAKER_PHONE => 43

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_CONFERENCE => 44

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_RING_ENABLE => 45

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_RING_SELECT => 46

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_MUTE => 47

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_CALLER_ID => 48

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_SEND => 49

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_SPEED_DIAL => 80

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_STORE_NUMBER => 81

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_RECALL_NUMBER => 82

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_DIRECTORY => 83

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_VOICE_MAIL => 112

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_SCREEN_CALLS => 113

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_DO_NOT_DISTURB => 114

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_MESSAGE => 115

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_ANSWER_ONOFF => 116

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_INSIDE_DIAL_TONE => 144

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_OUTSIDE_DIAL_TONE => 145

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_INSIDE_RING_TONE => 146

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_OUTSIDE_RING_TONE => 147

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PRIORITY_RING_TONE => 148

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_INSIDE_RINGBACK => 149

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PRIORITY_RINGBACK => 150

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_LINE_BUSY_TONE => 151

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_REORDER_TONE => 152

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_CALL_WAITING_TONE => 153

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_CONFIRMATION_TONE_1 => 154

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_CONFIRMATION_TONE_2 => 155

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_TONES_OFF => 156

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_OUTSIDE_RINGBACK => 157

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_RINGER => 158

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_KEY_0 => 176

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_KEY_1 => 177

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_KEY_2 => 178

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_KEY_3 => 179

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_KEY_4 => 180

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_KEY_5 => 181

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_KEY_6 => 182

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_KEY_7 => 183

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_KEY_8 => 184

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_KEY_9 => 185

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_KEY_STAR => 186

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_KEY_POUND => 187

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_KEY_A => 188

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_KEY_B => 189

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_KEY_C => 190

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_KEY_D => 191

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_CALL_HISTORY_KEY => 192

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_CALLER_ID_KEY => 193

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_SETTINGS_KEY => 194

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_HOST_CONTROL => 240

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_HOST_AVAILABLE => 241

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_HOST_CALL_ACTIVE => 242

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_ACTIVATE_HANDSET_AUDIO => 243

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_RING_TYPE => 244

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_REDIALABLE_PHONE_NUMBER => 245

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_STOP_RING_TONE => 248

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PSTN_RING_TONE => 249

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_HOST_RING_TONE => 250

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_ALERT_SOUND_ERROR => 251

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_ALERT_SOUND_CONFIRM => 252

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_ALERT_SOUND_NOTIFICATION => 253

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_SILENT_RING => 254

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_EMAIL_MESSAGE_WAITING => 264

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_VOICEMAIL_MESSAGE_WAITING => 265

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_HOST_HOLD => 266

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_INCOMING_CALL_HISTORY_COUNT => 272

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_OUTGOING_CALL_HISTORY_COUNT => 273

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_INCOMING_CALL_HISTORY => 274

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_OUTGOING_CALL_HISTORY => 275

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_LOCALE => 276

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_TIME_SECOND => 320

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_TIME_MINUTE => 321

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_TIME_HOUR => 322

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_DATE_DAY => 323

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_DATE_MONTH => 324

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_PHONE_DATE_YEAR => 325

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_HANDSET_NICKNAME => 326

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_ADDRESS_BOOK_ID => 327

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_CALL_DURATION => 330

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_DUAL_MODE_PHONE => 331

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_DEGAUSS => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_BRIGHTNESS => 16

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_CONTRAST => 18

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_RED_VIDEO_GAIN => 22

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_GREEN_VIDEO_GAIN => 24

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_BLUE_VIDEO_GAIN => 26

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_FOCUS => 28

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_HORIZONTAL_POSITION => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_HORIZONTAL_SIZE => 34

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_HORIZONTAL_PINCUSHION => 36

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_HORIZONTAL_PINCUSHION_BALANCE => 38

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_HORIZONTAL_MISCONVERGENCE => 40

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_HORIZONTAL_LINEARITY => 42

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_HORIZONTAL_LINEARITY_BALANCE => 44

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_VERTICAL_POSITION => 48

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_VERTICAL_SIZE => 50

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_VERTICAL_PINCUSHION => 52

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_VERTICAL_PINCUSHION_BALANCE => 54

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_VERTICAL_MISCONVERGENCE => 56

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_VERTICAL_LINEARITY => 58

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_VERTICAL_LINEARITY_BALANCE => 60

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_PARALLELOGRAM_DISTORTION_KEY_BALANCE => 64

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_TRAPEZOIDAL_DISTORTION_KEY => 66

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_TILT_ROTATION => 68

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_TOP_CORNER_DISTORTION_CONTROL => 70

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_TOP_CORNER_DISTORTION_BALANCE => 72

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_BOTTOM_CORNER_DISTORTION_CONTROL => 74

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_BOTTOM_CORNER_DISTORTION_BALANCE => 76

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_HORIZONTAL_MOIRE => 86

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_VERTICAL_MOIRE => 88

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_INPUT_LEVEL_SELECT => 94

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_INPUT_SOURCE_SELECT => 96

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_RED_VIDEO_BLACK_LEVEL => 108

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_GREEN_VIDEO_BLACK_LEVEL => 110

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_BLUE_VIDEO_BLACK_LEVEL => 112

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_AUTO_SIZE_CENTER => 162

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_POLARITY_HORIZONTAL_SYNCHRONIZATION => 164

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_POLARITY_VERTICAL_SYNCHRONIZATION => 166

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_SYNCHRONIZATION_TYPE => 168

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_SCREEN_ORIENTATION => 170

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_HORIZONTAL_FREQUENCY => 172

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_VERTICAL_FREQUENCY => 174

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_SETTINGS => 176

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_ON_SCREEN_DISPLAY => 202

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VESA_VIRTUAL_CONTROLS_STEREO_MODE => 212

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VR_BELT => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VR_BODY_SUIT => 2

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VR_FLEXOR => 3

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VR_GLOVE => 4

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VR_HEAD_TRACKER => 5

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VR_HEAD_MOUNTED_DISPLAY => 6

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VR_HAND_TRACKER => 7

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VR_OCULOMETER => 8

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VR_VEST => 9

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VR_ANIMATRONIC_DEVICE => 10

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VR_STEREO_ENABLE => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_VR_DISPLAY_ENABLE => 33

    /**
     * @type {String}
     */
    static DD_KEYBOARD_DEVICE_NAME => "\Device\KeyboardClass"

    /**
     * @type {String}
     */
    static DD_KEYBOARD_DEVICE_NAME_U => "\Device\KeyboardClass"

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_KEYBOARD_QUERY_ATTRIBUTES => 720896

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_KEYBOARD_SET_TYPEMATIC => 720900

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_KEYBOARD_SET_INDICATORS => 720904

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_KEYBOARD_QUERY_TYPEMATIC => 720928

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_KEYBOARD_QUERY_INDICATORS => 720960

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_KEYBOARD_QUERY_INDICATOR_TRANSLATION => 721024

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_KEYBOARD_INSERT_DATA => 721152

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_KEYBOARD_QUERY_EXTENDED_ATTRIBUTES => 721408

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_KEYBOARD_QUERY_IME_STATUS => 724992

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_KEYBOARD_SET_IME_STATUS => 724996

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_KEYBOARD => "{884b96c3-56ef-11d1-bc8c-00a0c91405dd}"

    /**
     * @type {Integer (UInt32)}
     */
    static KEYBOARD_OVERRUN_MAKE_CODE => 255

    /**
     * @type {Integer (UInt32)}
     */
    static KEY_MAKE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KEY_BREAK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KEY_E0 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KEY_E1 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KEY_TERMSRV_SET_LED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KEY_TERMSRV_SHADOW => 16

    /**
     * @type {Integer (UInt32)}
     */
    static KEY_TERMSRV_VKPACKET => 32

    /**
     * @type {Integer (UInt32)}
     */
    static KEY_RIM_VKEY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static KEY_FROM_KEYBOARD_OVERRIDER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static KEY_UNICODE_SEQUENCE_ITEM => 256

    /**
     * @type {Integer (UInt32)}
     */
    static KEY_UNICODE_SEQUENCE_END => 512

    /**
     * @type {Integer (UInt32)}
     */
    static KEYBOARD_EXTENDED_ATTRIBUTES_STRUCT_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KEYBOARD_LED_INJECTED => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static KEYBOARD_SHADOW => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static KEYBOARD_KANA_LOCK_ON => 8

    /**
     * @type {Integer (UInt32)}
     */
    static KEYBOARD_CAPS_LOCK_ON => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KEYBOARD_NUM_LOCK_ON => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KEYBOARD_SCROLL_LOCK_ON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KEYBOARD_ERROR_VALUE_BASE => 10000

    /**
     * @type {String}
     */
    static DD_MOUSE_DEVICE_NAME => "\Device\PointerClass"

    /**
     * @type {String}
     */
    static DD_MOUSE_DEVICE_NAME_U => "\Device\PointerClass"

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_MOUSE_QUERY_ATTRIBUTES => 983040

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_MOUSE_INSERT_DATA => 983044

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_MOUSE => "{378de44c-56ef-11d1-bc8c-00a0c91405dd}"

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_LEFT_BUTTON_DOWN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_LEFT_BUTTON_UP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_RIGHT_BUTTON_DOWN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_RIGHT_BUTTON_UP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_MIDDLE_BUTTON_DOWN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_MIDDLE_BUTTON_UP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_BUTTON_1_DOWN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_BUTTON_1_UP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_BUTTON_2_DOWN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_BUTTON_2_UP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_BUTTON_3_DOWN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_BUTTON_3_UP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_BUTTON_4_DOWN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_BUTTON_4_UP => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_BUTTON_5_DOWN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_BUTTON_5_UP => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_WHEEL => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_HWHEEL => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_TERMSRV_SRC_SHADOW => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_INPORT_HARDWARE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_I8042_HARDWARE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_SERIAL_HARDWARE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BALLPOINT_I8042_HARDWARE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BALLPOINT_SERIAL_HARDWARE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WHEELMOUSE_I8042_HARDWARE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WHEELMOUSE_SERIAL_HARDWARE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_HID_HARDWARE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WHEELMOUSE_HID_HARDWARE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static HORIZONTAL_WHEEL_PRESENT => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static MOUSE_ERROR_VALUE_BASE => 20000

    /**
     * @type {Integer (UInt32)}
     */
    static DIRECTINPUT_HEADER_VERSION => 2048

    /**
     * @type {String}
     */
    static CLSID_DirectInput => "{25e609e0-b259-11cf-bfc7-444553540000}"

    /**
     * @type {String}
     */
    static CLSID_DirectInputDevice => "{25e609e1-b259-11cf-bfc7-444553540000}"

    /**
     * @type {String}
     */
    static CLSID_DirectInput8 => "{25e609e4-b259-11cf-bfc7-444553540000}"

    /**
     * @type {String}
     */
    static CLSID_DirectInputDevice8 => "{25e609e5-b259-11cf-bfc7-444553540000}"

    /**
     * @type {String}
     */
    static GUID_XAxis => "{a36d02e0-c9f3-11cf-bfc7-444553540000}"

    /**
     * @type {String}
     */
    static GUID_YAxis => "{a36d02e1-c9f3-11cf-bfc7-444553540000}"

    /**
     * @type {String}
     */
    static GUID_ZAxis => "{a36d02e2-c9f3-11cf-bfc7-444553540000}"

    /**
     * @type {String}
     */
    static GUID_RxAxis => "{a36d02f4-c9f3-11cf-bfc7-444553540000}"

    /**
     * @type {String}
     */
    static GUID_RyAxis => "{a36d02f5-c9f3-11cf-bfc7-444553540000}"

    /**
     * @type {String}
     */
    static GUID_RzAxis => "{a36d02e3-c9f3-11cf-bfc7-444553540000}"

    /**
     * @type {String}
     */
    static GUID_Slider => "{a36d02e4-c9f3-11cf-bfc7-444553540000}"

    /**
     * @type {String}
     */
    static GUID_Button => "{a36d02f0-c9f3-11cf-bfc7-444553540000}"

    /**
     * @type {String}
     */
    static GUID_Key => "{55728220-d33c-11cf-bfc7-444553540000}"

    /**
     * @type {String}
     */
    static GUID_POV => "{a36d02f2-c9f3-11cf-bfc7-444553540000}"

    /**
     * @type {String}
     */
    static GUID_Unknown => "{a36d02f3-c9f3-11cf-bfc7-444553540000}"

    /**
     * @type {String}
     */
    static GUID_SysMouse => "{6f1d2b60-d5a0-11cf-bfc7-444553540000}"

    /**
     * @type {String}
     */
    static GUID_SysKeyboard => "{6f1d2b61-d5a0-11cf-bfc7-444553540000}"

    /**
     * @type {String}
     */
    static GUID_Joystick => "{6f1d2b70-d5a0-11cf-bfc7-444553540000}"

    /**
     * @type {String}
     */
    static GUID_SysMouseEm => "{6f1d2b80-d5a0-11cf-bfc7-444553540000}"

    /**
     * @type {String}
     */
    static GUID_SysMouseEm2 => "{6f1d2b81-d5a0-11cf-bfc7-444553540000}"

    /**
     * @type {String}
     */
    static GUID_SysKeyboardEm => "{6f1d2b82-d5a0-11cf-bfc7-444553540000}"

    /**
     * @type {String}
     */
    static GUID_SysKeyboardEm2 => "{6f1d2b83-d5a0-11cf-bfc7-444553540000}"

    /**
     * @type {String}
     */
    static GUID_ConstantForce => "{13541c20-8e33-11d0-9ad0-00a0c9a06e35}"

    /**
     * @type {String}
     */
    static GUID_RampForce => "{13541c21-8e33-11d0-9ad0-00a0c9a06e35}"

    /**
     * @type {String}
     */
    static GUID_Square => "{13541c22-8e33-11d0-9ad0-00a0c9a06e35}"

    /**
     * @type {String}
     */
    static GUID_Sine => "{13541c23-8e33-11d0-9ad0-00a0c9a06e35}"

    /**
     * @type {String}
     */
    static GUID_Triangle => "{13541c24-8e33-11d0-9ad0-00a0c9a06e35}"

    /**
     * @type {String}
     */
    static GUID_SawtoothUp => "{13541c25-8e33-11d0-9ad0-00a0c9a06e35}"

    /**
     * @type {String}
     */
    static GUID_SawtoothDown => "{13541c26-8e33-11d0-9ad0-00a0c9a06e35}"

    /**
     * @type {String}
     */
    static GUID_Spring => "{13541c27-8e33-11d0-9ad0-00a0c9a06e35}"

    /**
     * @type {String}
     */
    static GUID_Damper => "{13541c28-8e33-11d0-9ad0-00a0c9a06e35}"

    /**
     * @type {String}
     */
    static GUID_Inertia => "{13541c29-8e33-11d0-9ad0-00a0c9a06e35}"

    /**
     * @type {String}
     */
    static GUID_Friction => "{13541c2a-8e33-11d0-9ad0-00a0c9a06e35}"

    /**
     * @type {String}
     */
    static GUID_CustomForce => "{13541c2b-8e33-11d0-9ad0-00a0c9a06e35}"

    /**
     * @type {Integer (UInt32)}
     */
    static DIEFT_ALL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DIEFT_CONSTANTFORCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIEFT_RAMPFORCE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIEFT_PERIODIC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DIEFT_CONDITION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DIEFT_CUSTOMFORCE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DIEFT_HARDWARE => 255

    /**
     * @type {Integer (UInt32)}
     */
    static DIEFT_FFATTACK => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DIEFT_FFFADE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DIEFT_SATURATION => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DIEFT_POSNEGCOEFFICIENTS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DIEFT_POSNEGSATURATION => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DIEFT_DEADBAND => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DIEFT_STARTDELAY => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DI_DEGREES => 100

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FFNOMINALMAX => 10000

    /**
     * @type {Integer (UInt32)}
     */
    static DI_SECONDS => 1000000

    /**
     * @type {Integer (UInt32)}
     */
    static DIEFF_OBJECTIDS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIEFF_OBJECTOFFSETS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIEFF_CARTESIAN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DIEFF_POLAR => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DIEFF_SPHERICAL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DIEP_DURATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIEP_SAMPLEPERIOD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIEP_GAIN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DIEP_TRIGGERBUTTON => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DIEP_TRIGGERREPEATINTERVAL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DIEP_AXES => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DIEP_DIRECTION => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DIEP_ENVELOPE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DIEP_TYPESPECIFICPARAMS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DIEP_STARTDELAY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DIEP_ALLPARAMS_DX5 => 511

    /**
     * @type {Integer (UInt32)}
     */
    static DIEP_ALLPARAMS => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static DIEP_START => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static DIEP_NORESTART => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static DIEP_NODOWNLOAD => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DIEB_NOTRIGGER => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static DIES_SOLO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIES_NODOWNLOAD => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DIEGES_PLAYING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIEGES_EMULATED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPE_DEVICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPE_MOUSE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPE_KEYBOARD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPE_JOYSTICK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVCLASS_ALL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVCLASS_DEVICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVCLASS_POINTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVCLASS_KEYBOARD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVCLASS_GAMECTRL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPE_DEVICE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPE_MOUSE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPE_KEYBOARD => 19

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPE_JOYSTICK => 20

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPE_GAMEPAD => 21

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPE_DRIVING => 22

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPE_FLIGHT => 23

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPE_1STPERSON => 24

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPE_DEVICECTRL => 25

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPE_SCREENPOINTER => 26

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPE_REMOTE => 27

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPE_SUPPLEMENTAL => 28

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPE_HID => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPEMOUSE_UNKNOWN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPEMOUSE_TRADITIONAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPEMOUSE_FINGERSTICK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPEMOUSE_TOUCHPAD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPEMOUSE_TRACKBALL => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPEKEYBOARD_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPEKEYBOARD_PCXT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPEKEYBOARD_OLIVETTI => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPEKEYBOARD_PCAT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPEKEYBOARD_PCENH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPEKEYBOARD_NOKIA1050 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPEKEYBOARD_NOKIA9140 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPEKEYBOARD_NEC98 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPEKEYBOARD_NEC98LAPTOP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPEKEYBOARD_NEC98106 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPEKEYBOARD_JAPAN106 => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPEKEYBOARD_JAPANAX => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPEKEYBOARD_J3100 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPEJOYSTICK_UNKNOWN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPEJOYSTICK_TRADITIONAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPEJOYSTICK_FLIGHTSTICK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPEJOYSTICK_GAMEPAD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPEJOYSTICK_RUDDER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPEJOYSTICK_WHEEL => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DIDEVTYPEJOYSTICK_HEADTRACKER => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEMOUSE_UNKNOWN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEMOUSE_TRADITIONAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEMOUSE_FINGERSTICK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEMOUSE_TOUCHPAD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEMOUSE_TRACKBALL => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEMOUSE_ABSOLUTE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEKEYBOARD_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEKEYBOARD_PCXT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEKEYBOARD_OLIVETTI => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEKEYBOARD_PCAT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEKEYBOARD_PCENH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEKEYBOARD_NOKIA1050 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEKEYBOARD_NOKIA9140 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEKEYBOARD_NEC98 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEKEYBOARD_NEC98LAPTOP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEKEYBOARD_NEC98106 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEKEYBOARD_JAPAN106 => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEKEYBOARD_JAPANAX => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEKEYBOARD_J3100 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPE_LIMITEDGAMESUBTYPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEJOYSTICK_LIMITED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEJOYSTICK_STANDARD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEGAMEPAD_LIMITED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEGAMEPAD_STANDARD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEGAMEPAD_TILT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEDRIVING_LIMITED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEDRIVING_COMBINEDPEDALS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEDRIVING_DUALPEDALS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEDRIVING_THREEPEDALS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEDRIVING_HANDHELD => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEFLIGHT_LIMITED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEFLIGHT_STICK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEFLIGHT_YOKE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEFLIGHT_RC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPE1STPERSON_LIMITED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPE1STPERSON_UNKNOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPE1STPERSON_SIXDOF => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPE1STPERSON_SHOOTER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPESCREENPTR_UNKNOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPESCREENPTR_LIGHTGUN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPESCREENPTR_LIGHTPEN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPESCREENPTR_TOUCH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEREMOTE_UNKNOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEDEVICECTRL_UNKNOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEDEVICECTRL_COMMSSELECTION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPEDEVICECTRL_COMMSSELECTION_HARDWIRED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPESUPPLEMENTAL_UNKNOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPESUPPLEMENTAL_2NDHANDCONTROLLER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPESUPPLEMENTAL_HEADTRACKER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPESUPPLEMENTAL_HANDTRACKER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPESUPPLEMENTAL_SHIFTSTICKGATE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPESUPPLEMENTAL_SHIFTER => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPESUPPLEMENTAL_THROTTLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPESUPPLEMENTAL_SPLITTHROTTLE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPESUPPLEMENTAL_COMBINEDPEDALS => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPESUPPLEMENTAL_DUALPEDALS => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPESUPPLEMENTAL_THREEPEDALS => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DI8DEVTYPESUPPLEMENTAL_RUDDERPEDALS => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DIDC_ATTACHED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIDC_POLLEDDEVICE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIDC_EMULATED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DIDC_POLLEDDATAFORMAT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DIDC_FORCEFEEDBACK => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DIDC_FFATTACK => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DIDC_FFFADE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DIDC_SATURATION => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DIDC_POSNEGCOEFFICIENTS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DIDC_POSNEGSATURATION => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DIDC_DEADBAND => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DIDC_STARTDELAY => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DIDC_ALIAS => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DIDC_PHANTOM => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DIDC_HIDDEN => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static DIDFT_ALL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DIDFT_RELAXIS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIDFT_ABSAXIS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIDFT_AXIS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DIDFT_PSHBUTTON => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DIDFT_TGLBUTTON => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DIDFT_BUTTON => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DIDFT_POV => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DIDFT_COLLECTION => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DIDFT_NODATA => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DIDFT_ANYINSTANCE => 16776960

    /**
     * @type {Integer (UInt32)}
     */
    static DIDFT_INSTANCEMASK => 16776960

    /**
     * @type {Integer (UInt32)}
     */
    static DIDFT_FFACTUATOR => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static DIDFT_FFEFFECTTRIGGER => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static DIDFT_OUTPUT => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static DIDFT_VENDORDEFINED => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static DIDFT_ALIAS => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static DIDFT_NOCOLLECTION => 16776960

    /**
     * @type {Integer (UInt32)}
     */
    static DIDF_ABSAXIS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIDF_RELAXIS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIA_FORCEFEEDBACK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIA_APPMAPPED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIA_APPNOMAP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DIA_NORANGE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DIA_APPFIXED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DIAH_UNMAPPED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DIAH_USERCONFIG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIAH_APPREQUESTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIAH_HWAPP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DIAH_HWDEFAULT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DIAH_DEFAULT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DIAH_ERROR => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DIAFTS_NEWDEVICELOW => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static DIAFTS_NEWDEVICEHIGH => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static DIAFTS_UNUSEDDEVICELOW => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DIAFTS_UNUSEDDEVICEHIGH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DIDBAM_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DIDBAM_PRESERVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIDBAM_INITIALIZE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIDBAM_HWDEFAULTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DIDSAM_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DIDSAM_NOUSER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIDSAM_FORCESAVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DICD_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DICD_EDIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIDIFT_CONFIGURATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIDIFT_OVERLAY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIDAL_CENTERED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DIDAL_LEFTALIGNED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIDAL_RIGHTALIGNED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIDAL_MIDDLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DIDAL_TOPALIGNED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DIDAL_BOTTOMALIGNED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DIDOI_FFACTUATOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIDOI_FFEFFECTTRIGGER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIDOI_POLLED => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DIDOI_ASPECTPOSITION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DIDOI_ASPECTVELOCITY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DIDOI_ASPECTACCEL => 768

    /**
     * @type {Integer (UInt32)}
     */
    static DIDOI_ASPECTFORCE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DIDOI_ASPECTMASK => 3840

    /**
     * @type {Integer (UInt32)}
     */
    static DIDOI_GUIDISUSAGE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DIPH_DEVICE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DIPH_BYOFFSET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIPH_BYID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIPH_BYUSAGE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MAXCPOINTSNUM => 8

    /**
     * @type {String}
     */
    static DIPROP_BUFFERSIZE => "{00000000-0000-0000-0000-000000000001}"

    /**
     * @type {String}
     */
    static DIPROP_AXISMODE => "{00000000-0000-0000-0000-000000000002}"

    /**
     * @type {Integer (UInt32)}
     */
    static DIPROPAXISMODE_ABS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DIPROPAXISMODE_REL => 1

    /**
     * @type {String}
     */
    static DIPROP_GRANULARITY => "{00000000-0000-0000-0000-000000000003}"

    /**
     * @type {String}
     */
    static DIPROP_RANGE => "{00000000-0000-0000-0000-000000000004}"

    /**
     * @type {String}
     */
    static DIPROP_DEADZONE => "{00000000-0000-0000-0000-000000000005}"

    /**
     * @type {String}
     */
    static DIPROP_SATURATION => "{00000000-0000-0000-0000-000000000006}"

    /**
     * @type {String}
     */
    static DIPROP_FFGAIN => "{00000000-0000-0000-0000-000000000007}"

    /**
     * @type {String}
     */
    static DIPROP_FFLOAD => "{00000000-0000-0000-0000-000000000008}"

    /**
     * @type {String}
     */
    static DIPROP_AUTOCENTER => "{00000000-0000-0000-0000-000000000009}"

    /**
     * @type {Integer (UInt32)}
     */
    static DIPROPAUTOCENTER_OFF => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DIPROPAUTOCENTER_ON => 1

    /**
     * @type {String}
     */
    static DIPROP_CALIBRATIONMODE => "{00000000-0000-0000-0000-00000000000a}"

    /**
     * @type {Integer (UInt32)}
     */
    static DIPROPCALIBRATIONMODE_COOKED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DIPROPCALIBRATIONMODE_RAW => 1

    /**
     * @type {String}
     */
    static DIPROP_CALIBRATION => "{00000000-0000-0000-0000-00000000000b}"

    /**
     * @type {String}
     */
    static DIPROP_GUIDANDPATH => "{00000000-0000-0000-0000-00000000000c}"

    /**
     * @type {String}
     */
    static DIPROP_INSTANCENAME => "{00000000-0000-0000-0000-00000000000d}"

    /**
     * @type {String}
     */
    static DIPROP_PRODUCTNAME => "{00000000-0000-0000-0000-00000000000e}"

    /**
     * @type {String}
     */
    static DIPROP_JOYSTICKID => "{00000000-0000-0000-0000-00000000000f}"

    /**
     * @type {String}
     */
    static DIPROP_GETPORTDISPLAYNAME => "{00000000-0000-0000-0000-000000000010}"

    /**
     * @type {String}
     */
    static DIPROP_PHYSICALRANGE => "{00000000-0000-0000-0000-000000000012}"

    /**
     * @type {String}
     */
    static DIPROP_LOGICALRANGE => "{00000000-0000-0000-0000-000000000013}"

    /**
     * @type {String}
     */
    static DIPROP_KEYNAME => "{00000000-0000-0000-0000-000000000014}"

    /**
     * @type {String}
     */
    static DIPROP_CPOINTS => "{00000000-0000-0000-0000-000000000015}"

    /**
     * @type {String}
     */
    static DIPROP_APPDATA => "{00000000-0000-0000-0000-000000000016}"

    /**
     * @type {String}
     */
    static DIPROP_SCANCODE => "{00000000-0000-0000-0000-000000000017}"

    /**
     * @type {String}
     */
    static DIPROP_VIDPID => "{00000000-0000-0000-0000-000000000018}"

    /**
     * @type {String}
     */
    static DIPROP_USERNAME => "{00000000-0000-0000-0000-000000000019}"

    /**
     * @type {String}
     */
    static DIPROP_TYPENAME => "{00000000-0000-0000-0000-00000000001a}"

    /**
     * @type {Integer (UInt32)}
     */
    static DIGDD_PEEK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISCL_EXCLUSIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISCL_NONEXCLUSIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISCL_FOREGROUND => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISCL_BACKGROUND => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DISCL_NOWINKEY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DISFFC_RESET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISFFC_STOPALL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISFFC_PAUSE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISFFC_CONTINUE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DISFFC_SETACTUATORSON => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DISFFC_SETACTUATORSOFF => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DIGFFS_EMPTY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIGFFS_STOPPED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIGFFS_PAUSED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DIGFFS_ACTUATORSON => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DIGFFS_ACTUATORSOFF => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DIGFFS_POWERON => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DIGFFS_POWEROFF => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DIGFFS_SAFETYSWITCHON => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DIGFFS_SAFETYSWITCHOFF => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DIGFFS_USERFFSWITCHON => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DIGFFS_USERFFSWITCHOFF => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DIGFFS_DEVICELOST => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DISDD_CONTINUE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIFEF_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DIFEF_INCLUDENONSTANDARD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIFEF_MODIFYIFNEEDED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_ESCAPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_2 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_3 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_4 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_5 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_6 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_7 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_8 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_9 => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_0 => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_MINUS => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_EQUALS => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_BACK => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_TAB => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_Q => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_W => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_E => 18

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_R => 19

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_T => 20

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_Y => 21

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_U => 22

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_I => 23

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_O => 24

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_P => 25

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_LBRACKET => 26

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_RBRACKET => 27

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_RETURN => 28

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_LCONTROL => 29

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_A => 30

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_S => 31

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_D => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_F => 33

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_G => 34

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_H => 35

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_J => 36

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_K => 37

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_L => 38

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_SEMICOLON => 39

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_APOSTROPHE => 40

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_GRAVE => 41

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_LSHIFT => 42

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_BACKSLASH => 43

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_Z => 44

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_X => 45

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_C => 46

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_V => 47

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_B => 48

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_N => 49

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_M => 50

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_COMMA => 51

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_PERIOD => 52

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_SLASH => 53

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_RSHIFT => 54

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_MULTIPLY => 55

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_LMENU => 56

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_SPACE => 57

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_CAPITAL => 58

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_F1 => 59

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_F2 => 60

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_F3 => 61

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_F4 => 62

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_F5 => 63

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_F6 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_F7 => 65

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_F8 => 66

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_F9 => 67

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_F10 => 68

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_NUMLOCK => 69

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_SCROLL => 70

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_NUMPAD7 => 71

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_NUMPAD8 => 72

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_NUMPAD9 => 73

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_SUBTRACT => 74

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_NUMPAD4 => 75

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_NUMPAD5 => 76

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_NUMPAD6 => 77

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_ADD => 78

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_NUMPAD1 => 79

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_NUMPAD2 => 80

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_NUMPAD3 => 81

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_NUMPAD0 => 82

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_DECIMAL => 83

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_OEM_102 => 86

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_F11 => 87

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_F12 => 88

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_F13 => 100

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_F14 => 101

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_F15 => 102

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_KANA => 112

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_ABNT_C1 => 115

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_CONVERT => 121

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_NOCONVERT => 123

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_YEN => 125

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_ABNT_C2 => 126

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_NUMPADEQUALS => 141

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_PREVTRACK => 144

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_AT => 145

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_COLON => 146

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_UNDERLINE => 147

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_KANJI => 148

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_STOP => 149

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_AX => 150

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_UNLABELED => 151

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_NEXTTRACK => 153

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_NUMPADENTER => 156

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_RCONTROL => 157

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_MUTE => 160

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_CALCULATOR => 161

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_PLAYPAUSE => 162

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_MEDIASTOP => 164

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_VOLUMEDOWN => 174

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_VOLUMEUP => 176

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_WEBHOME => 178

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_NUMPADCOMMA => 179

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_DIVIDE => 181

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_SYSRQ => 183

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_RMENU => 184

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_PAUSE => 197

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_HOME => 199

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_UP => 200

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_PRIOR => 201

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_LEFT => 203

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_RIGHT => 205

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_END => 207

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_DOWN => 208

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_NEXT => 209

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_INSERT => 210

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_DELETE => 211

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_LWIN => 219

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_RWIN => 220

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_APPS => 221

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_POWER => 222

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_SLEEP => 223

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_WAKE => 227

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_WEBSEARCH => 229

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_WEBFAVORITES => 230

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_WEBREFRESH => 231

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_WEBSTOP => 232

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_WEBFORWARD => 233

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_WEBBACK => 234

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_MYCOMPUTER => 235

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_MAIL => 236

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_MEDIASELECT => 237

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_BACKSPACE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_NUMPADSTAR => 55

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_LALT => 56

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_CAPSLOCK => 58

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_NUMPADMINUS => 74

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_NUMPADPLUS => 78

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_NUMPADPERIOD => 83

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_NUMPADSLASH => 181

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_RALT => 184

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_UPARROW => 200

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_PGUP => 201

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_LEFTARROW => 203

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_RIGHTARROW => 205

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_DOWNARROW => 208

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_PGDN => 209

    /**
     * @type {Integer (UInt32)}
     */
    static DIK_CIRCUMFLEX => 144

    /**
     * @type {Integer (UInt32)}
     */
    static DIENUM_STOP => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DIENUM_CONTINUE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIEDFL_ALLDEVICES => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DIEDFL_ATTACHEDONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIEDFL_FORCEFEEDBACK => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DIEDFL_INCLUDEALIASES => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DIEDFL_INCLUDEPHANTOMS => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DIEDFL_INCLUDEHIDDEN => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static DIEDBS_MAPPEDPRI1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIEDBS_MAPPEDPRI2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIEDBS_RECENTDEVICE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DIEDBS_NEWDEVICE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DIEDBSFL_ATTACHEDONLY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DIEDBSFL_THISUSER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DIEDBSFL_FORCEFEEDBACK => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DIEDBSFL_AVAILABLEDEVICES => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DIEDBSFL_MULTIMICEKEYBOARDS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DIEDBSFL_NONGAMINGDEVICES => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DIEDBSFL_VALID => 28944

    /**
     * @type {Integer (Int32)}
     */
    static DI_OK => 0

    /**
     * @type {Integer (Int32)}
     */
    static DI_NOTATTACHED => 1

    /**
     * @type {Integer (Int32)}
     */
    static DI_BUFFEROVERFLOW => 1

    /**
     * @type {Integer (Int32)}
     */
    static DI_PROPNOEFFECT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DI_NOEFFECT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DI_POLLEDDEVICE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DI_DOWNLOADSKIPPED => 3

    /**
     * @type {Integer (Int32)}
     */
    static DI_EFFECTRESTARTED => 4

    /**
     * @type {Integer (Int32)}
     */
    static DI_TRUNCATED => 8

    /**
     * @type {Integer (Int32)}
     */
    static DI_SETTINGSNOTSAVED => 11

    /**
     * @type {Integer (Int32)}
     */
    static DI_TRUNCATEDANDRESTARTED => 12

    /**
     * @type {Integer (Int32)}
     */
    static DI_WRITEPROTECT => 19

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_OLDDIRECTINPUTVERSION => -2147023746

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_BETADIRECTINPUTVERSION => -2147023743

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_BADDRIVERVER => -2147024777

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_DEVICENOTREG => -2147221164

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_NOTFOUND => -2147024894

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_OBJECTNOTFOUND => -2147024894

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_INVALIDPARAM => -2147024809

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_NOINTERFACE => -2147467262

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_GENERIC => -2147467259

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_OUTOFMEMORY => -2147024882

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_UNSUPPORTED => -2147467263

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_NOTINITIALIZED => -2147024875

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_ALREADYINITIALIZED => -2147023649

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_NOAGGREGATION => -2147221232

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_OTHERAPPHASPRIO => -2147024891

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_INPUTLOST => -2147024866

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_ACQUIRED => -2147024726

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_NOTACQUIRED => -2147024884

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_READONLY => -2147024891

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_HANDLEEXISTS => -2147024891

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_INSUFFICIENTPRIVS => -2147220992

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_DEVICEFULL => -2147220991

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_MOREDATA => -2147220990

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_NOTDOWNLOADED => -2147220989

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_HASEFFECTS => -2147220988

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_NOTEXCLUSIVEACQUIRED => -2147220987

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_INCOMPLETEEFFECT => -2147220986

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_NOTBUFFERED => -2147220985

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_EFFECTPLAYING => -2147220984

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_UNPLUGGED => -2147220983

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_REPORTFULL => -2147220982

    /**
     * @type {Integer (Int32)}
     */
    static DIERR_MAPFILEFAIL => -2147220981

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_ESCAPE => 2164261889

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_1 => 2164261890

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_2 => 2164261891

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_3 => 2164261892

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_4 => 2164261893

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_5 => 2164261894

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_6 => 2164261895

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_7 => 2164261896

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_8 => 2164261897

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_9 => 2164261898

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_0 => 2164261899

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_MINUS => 2164261900

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_EQUALS => 2164261901

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_BACK => 2164261902

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_TAB => 2164261903

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_Q => 2164261904

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_W => 2164261905

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_E => 2164261906

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_R => 2164261907

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_T => 2164261908

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_Y => 2164261909

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_U => 2164261910

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_I => 2164261911

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_O => 2164261912

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_P => 2164261913

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_LBRACKET => 2164261914

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_RBRACKET => 2164261915

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_RETURN => 2164261916

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_LCONTROL => 2164261917

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_A => 2164261918

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_S => 2164261919

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_D => 2164261920

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_F => 2164261921

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_G => 2164261922

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_H => 2164261923

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_J => 2164261924

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_K => 2164261925

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_L => 2164261926

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_SEMICOLON => 2164261927

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_APOSTROPHE => 2164261928

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_GRAVE => 2164261929

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_LSHIFT => 2164261930

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_BACKSLASH => 2164261931

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_Z => 2164261932

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_X => 2164261933

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_C => 2164261934

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_V => 2164261935

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_B => 2164261936

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_N => 2164261937

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_M => 2164261938

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_COMMA => 2164261939

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_PERIOD => 2164261940

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_SLASH => 2164261941

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_RSHIFT => 2164261942

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_MULTIPLY => 2164261943

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_LMENU => 2164261944

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_SPACE => 2164261945

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_CAPITAL => 2164261946

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_F1 => 2164261947

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_F2 => 2164261948

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_F3 => 2164261949

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_F4 => 2164261950

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_F5 => 2164261951

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_F6 => 2164261952

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_F7 => 2164261953

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_F8 => 2164261954

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_F9 => 2164261955

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_F10 => 2164261956

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_NUMLOCK => 2164261957

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_SCROLL => 2164261958

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_NUMPAD7 => 2164261959

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_NUMPAD8 => 2164261960

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_NUMPAD9 => 2164261961

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_SUBTRACT => 2164261962

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_NUMPAD4 => 2164261963

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_NUMPAD5 => 2164261964

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_NUMPAD6 => 2164261965

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_ADD => 2164261966

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_NUMPAD1 => 2164261967

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_NUMPAD2 => 2164261968

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_NUMPAD3 => 2164261969

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_NUMPAD0 => 2164261970

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_DECIMAL => 2164261971

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_OEM_102 => 2164261974

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_F11 => 2164261975

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_F12 => 2164261976

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_F13 => 2164261988

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_F14 => 2164261989

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_F15 => 2164261990

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_KANA => 2164262000

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_ABNT_C1 => 2164262003

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_CONVERT => 2164262009

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_NOCONVERT => 2164262011

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_YEN => 2164262013

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_ABNT_C2 => 2164262014

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_NUMPADEQUALS => 2164262029

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_PREVTRACK => 2164262032

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_AT => 2164262033

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_COLON => 2164262034

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_UNDERLINE => 2164262035

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_KANJI => 2164262036

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_STOP => 2164262037

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_AX => 2164262038

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_UNLABELED => 2164262039

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_NEXTTRACK => 2164262041

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_NUMPADENTER => 2164262044

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_RCONTROL => 2164262045

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_MUTE => 2164262048

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_CALCULATOR => 2164262049

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_PLAYPAUSE => 2164262050

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_MEDIASTOP => 2164262052

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_VOLUMEDOWN => 2164262062

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_VOLUMEUP => 2164262064

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_WEBHOME => 2164262066

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_NUMPADCOMMA => 2164262067

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_DIVIDE => 2164262069

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_SYSRQ => 2164262071

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_RMENU => 2164262072

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_PAUSE => 2164262085

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_HOME => 2164262087

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_UP => 2164262088

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_PRIOR => 2164262089

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_LEFT => 2164262091

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_RIGHT => 2164262093

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_END => 2164262095

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_DOWN => 2164262096

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_NEXT => 2164262097

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_INSERT => 2164262098

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_DELETE => 2164262099

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_LWIN => 2164262107

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_RWIN => 2164262108

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_APPS => 2164262109

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_POWER => 2164262110

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_SLEEP => 2164262111

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_WAKE => 2164262115

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_WEBSEARCH => 2164262117

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_WEBFAVORITES => 2164262118

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_WEBREFRESH => 2164262119

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_WEBSTOP => 2164262120

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_WEBFORWARD => 2164262121

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_WEBBACK => 2164262122

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_MYCOMPUTER => 2164262123

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_MAIL => 2164262124

    /**
     * @type {Integer (UInt32)}
     */
    static DIKEYBOARD_MEDIASELECT => 2164262125

    /**
     * @type {Integer (UInt32)}
     */
    static DIVOICE_CHANNEL1 => 2197816321

    /**
     * @type {Integer (UInt32)}
     */
    static DIVOICE_CHANNEL2 => 2197816322

    /**
     * @type {Integer (UInt32)}
     */
    static DIVOICE_CHANNEL3 => 2197816323

    /**
     * @type {Integer (UInt32)}
     */
    static DIVOICE_CHANNEL4 => 2197816324

    /**
     * @type {Integer (UInt32)}
     */
    static DIVOICE_CHANNEL5 => 2197816325

    /**
     * @type {Integer (UInt32)}
     */
    static DIVOICE_CHANNEL6 => 2197816326

    /**
     * @type {Integer (UInt32)}
     */
    static DIVOICE_CHANNEL7 => 2197816327

    /**
     * @type {Integer (UInt32)}
     */
    static DIVOICE_CHANNEL8 => 2197816328

    /**
     * @type {Integer (UInt32)}
     */
    static DIVOICE_TEAM => 2197816329

    /**
     * @type {Integer (UInt32)}
     */
    static DIVOICE_ALL => 2197816330

    /**
     * @type {Integer (UInt32)}
     */
    static DIVOICE_RECORDMUTE => 2197816331

    /**
     * @type {Integer (UInt32)}
     */
    static DIVOICE_PLAYBACKMUTE => 2197816332

    /**
     * @type {Integer (UInt32)}
     */
    static DIVOICE_TRANSMIT => 2197816333

    /**
     * @type {Integer (UInt32)}
     */
    static DIVOICE_VOICECOMMAND => 2197816336

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_DRIVING_RACE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_DRIVINGR_STEER => 16812545

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_DRIVINGR_ACCELERATE => 17011202

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_DRIVINGR_BRAKE => 17043971

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGR_SHIFTUP => 16780289

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGR_SHIFTDOWN => 16780290

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGR_VIEW => 16784387

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGR_MENU => 16778493

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_DRIVINGR_ACCEL_AND_BRAKE => 16861700

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_DRIVINGR_GLANCE => 16795137

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGR_BRAKE => 16796676

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGR_DASHBOARD => 16794629

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGR_AIDS => 16794630

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGR_MAP => 16794631

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGR_BOOST => 16794632

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGR_PIT => 16794633

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGR_ACCELERATE_LINK => 17028320

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGR_STEER_LEFT_LINK => 16829668

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGR_STEER_RIGHT_LINK => 16829676

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGR_GLANCE_LEFT_LINK => 17286372

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGR_GLANCE_RIGHT_LINK => 17286380

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGR_DEVICE => 16794878

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGR_PAUSE => 16794876

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_DRIVING_COMBAT => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_DRIVINGC_STEER => 33589761

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_DRIVINGC_ACCELERATE => 33788418

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_DRIVINGC_BRAKE => 33821187

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGC_FIRE => 33557505

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGC_WEAPONS => 33557506

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGC_TARGET => 33557507

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGC_MENU => 33555709

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_DRIVINGC_ACCEL_AND_BRAKE => 33638916

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_DRIVINGC_GLANCE => 33572353

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGC_SHIFTUP => 33573892

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGC_SHIFTDOWN => 33573893

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGC_DASHBOARD => 33571846

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGC_AIDS => 33571847

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGC_BRAKE => 33573896

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGC_FIRESECONDARY => 33573897

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGC_ACCELERATE_LINK => 33805536

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGC_STEER_LEFT_LINK => 33606884

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGC_STEER_RIGHT_LINK => 33606892

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGC_GLANCE_LEFT_LINK => 34063588

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGC_GLANCE_RIGHT_LINK => 34063596

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGC_DEVICE => 33572094

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGC_PAUSE => 33572092

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_DRIVING_TANK => 50331648

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_DRIVINGT_STEER => 50366977

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_DRIVINGT_BARREL => 50397698

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_DRIVINGT_ACCELERATE => 50565635

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_DRIVINGT_ROTATE => 50463236

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGT_FIRE => 50334721

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGT_WEAPONS => 50334722

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGT_TARGET => 50334723

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGT_MENU => 50332925

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_DRIVINGT_GLANCE => 50349569

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_DRIVINGT_BRAKE => 50614789

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_DRIVINGT_ACCEL_AND_BRAKE => 50416134

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGT_VIEW => 50355204

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGT_DASHBOARD => 50355205

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGT_BRAKE => 50351110

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGT_FIRESECONDARY => 50351111

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGT_ACCELERATE_LINK => 50582752

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGT_STEER_LEFT_LINK => 50384100

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGT_STEER_RIGHT_LINK => 50384108

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGT_BARREL_UP_LINK => 50414816

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGT_BARREL_DOWN_LINK => 50414824

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGT_ROTATE_LEFT_LINK => 50480356

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGT_ROTATE_RIGHT_LINK => 50480364

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGT_GLANCE_LEFT_LINK => 50840804

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGT_GLANCE_RIGHT_LINK => 50840812

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGT_DEVICE => 50349310

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_DRIVINGT_PAUSE => 50349308

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_FLYING_CIVILIAN => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FLYINGC_BANK => 67144193

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FLYINGC_PITCH => 67176962

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FLYINGC_THROTTLE => 67342851

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGC_VIEW => 67118081

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGC_DISPLAY => 67118082

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGC_GEAR => 67120131

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGC_MENU => 67110141

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_FLYINGC_GLANCE => 67126785

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FLYINGC_BRAKE => 67398148

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FLYINGC_RUDDER => 67260933

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FLYINGC_FLAPS => 67459590

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGC_FLAPSUP => 67134468

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGC_FLAPSDOWN => 67134469

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGC_BRAKE_LINK => 67398880

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGC_FASTER_LINK => 67359968

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGC_SLOWER_LINK => 67359976

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGC_GLANCE_LEFT_LINK => 67618020

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGC_GLANCE_RIGHT_LINK => 67618028

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGC_GLANCE_UP_LINK => 67618016

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGC_GLANCE_DOWN_LINK => 67618024

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGC_DEVICE => 67126526

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGC_PAUSE => 67126524

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_FLYING_MILITARY => 83886080

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FLYINGM_BANK => 83921409

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FLYINGM_PITCH => 83954178

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FLYINGM_THROTTLE => 84120067

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGM_FIRE => 83889153

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGM_WEAPONS => 83889154

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGM_TARGET => 83889155

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGM_MENU => 83887357

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_FLYINGM_GLANCE => 83904001

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGM_COUNTER => 83909636

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FLYINGM_RUDDER => 84036100

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FLYINGM_BRAKE => 84173317

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGM_VIEW => 83911685

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGM_DISPLAY => 83911686

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FLYINGM_FLAPS => 84234758

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGM_FLAPSUP => 83907591

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGM_FLAPSDOWN => 83907592

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGM_FIRESECONDARY => 83905545

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGM_GEAR => 83911690

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGM_BRAKE_LINK => 84174048

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGM_FASTER_LINK => 84137184

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGM_SLOWER_LINK => 84137192

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGM_GLANCE_LEFT_LINK => 84395236

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGM_GLANCE_RIGHT_LINK => 84395244

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGM_GLANCE_UP_LINK => 84395232

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGM_GLANCE_DOWN_LINK => 84395240

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGM_DEVICE => 83903742

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGM_PAUSE => 83903740

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_FLYING_HELICOPTER => 100663296

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FLYINGH_BANK => 100698625

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FLYINGH_PITCH => 100731394

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FLYINGH_COLLECTIVE => 100764163

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGH_FIRE => 100668417

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGH_WEAPONS => 100668418

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGH_TARGET => 100668419

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGH_MENU => 100664573

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_FLYINGH_GLANCE => 100681217

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FLYINGH_TORQUE => 100817412

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FLYINGH_THROTTLE => 100915717

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGH_COUNTER => 100684804

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGH_VIEW => 100688901

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGH_GEAR => 100688902

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGH_FIRESECONDARY => 100682759

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGH_FASTER_LINK => 100916448

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGH_SLOWER_LINK => 100916456

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGH_GLANCE_LEFT_LINK => 101172452

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGH_GLANCE_RIGHT_LINK => 101172460

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGH_GLANCE_UP_LINK => 101172448

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGH_GLANCE_DOWN_LINK => 101172456

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGH_DEVICE => 100680958

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FLYINGH_PAUSE => 100680956

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_SPACESIM => 117440512

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_SPACESIM_LATERAL => 117473793

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_SPACESIM_MOVE => 117506562

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_SPACESIM_THROTTLE => 117670403

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SPACESIM_FIRE => 117441537

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SPACESIM_WEAPONS => 117441538

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SPACESIM_TARGET => 117441539

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SPACESIM_MENU => 117441789

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_SPACESIM_GLANCE => 117458433

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_SPACESIM_CLIMB => 117555716

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_SPACESIM_ROTATE => 117588485

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SPACESIM_VIEW => 117457924

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SPACESIM_DISPLAY => 117457925

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SPACESIM_RAISE => 117457926

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SPACESIM_LOWER => 117457927

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SPACESIM_GEAR => 117457928

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SPACESIM_FIRESECONDARY => 117457929

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SPACESIM_LEFT_LINK => 117490916

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SPACESIM_RIGHT_LINK => 117490924

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SPACESIM_FORWARD_LINK => 117523680

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SPACESIM_BACKWARD_LINK => 117523688

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SPACESIM_FASTER_LINK => 117687520

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SPACESIM_SLOWER_LINK => 117687528

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SPACESIM_TURN_LEFT_LINK => 117589220

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SPACESIM_TURN_RIGHT_LINK => 117589228

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SPACESIM_GLANCE_LEFT_LINK => 117949668

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SPACESIM_GLANCE_RIGHT_LINK => 117949676

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SPACESIM_GLANCE_UP_LINK => 117949664

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SPACESIM_GLANCE_DOWN_LINK => 117949672

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SPACESIM_DEVICE => 117458174

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SPACESIM_PAUSE => 117458172

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_FIGHTING_HAND2HAND => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FIGHTINGH_LATERAL => 134251009

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FIGHTINGH_MOVE => 134283778

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FIGHTINGH_PUNCH => 134218753

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FIGHTINGH_KICK => 134218754

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FIGHTINGH_BLOCK => 134218755

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FIGHTINGH_CROUCH => 134218756

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FIGHTINGH_JUMP => 134218757

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FIGHTINGH_SPECIAL1 => 134218758

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FIGHTINGH_SPECIAL2 => 134218759

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FIGHTINGH_MENU => 134219005

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FIGHTINGH_SELECT => 134235144

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_FIGHTINGH_SLIDE => 134235649

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FIGHTINGH_DISPLAY => 134235145

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FIGHTINGH_ROTATE => 134365699

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FIGHTINGH_DODGE => 134235146

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FIGHTINGH_LEFT_LINK => 134268132

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FIGHTINGH_RIGHT_LINK => 134268140

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FIGHTINGH_FORWARD_LINK => 134300896

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FIGHTINGH_BACKWARD_LINK => 134300904

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FIGHTINGH_DEVICE => 134235390

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FIGHTINGH_PAUSE => 134235388

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_FIGHTING_FPS => 150994944

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FPS_ROTATE => 151028225

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FPS_MOVE => 151060994

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FPS_FIRE => 150995969

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FPS_WEAPONS => 150995970

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FPS_APPLY => 150995971

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FPS_SELECT => 150995972

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FPS_CROUCH => 150995973

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FPS_JUMP => 150995974

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FPS_LOOKUPDOWN => 151093763

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FPS_STRAFE => 150995975

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FPS_MENU => 150996221

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_FPS_GLANCE => 151012865

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FPS_DISPLAY => 151012360

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FPS_SIDESTEP => 151142916

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FPS_DODGE => 151012361

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FPS_GLANCEL => 151012362

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FPS_GLANCER => 151012363

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FPS_FIRESECONDARY => 151012364

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FPS_ROTATE_LEFT_LINK => 151045348

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FPS_ROTATE_RIGHT_LINK => 151045356

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FPS_FORWARD_LINK => 151078112

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FPS_BACKWARD_LINK => 151078120

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FPS_GLANCE_UP_LINK => 151110880

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FPS_GLANCE_DOWN_LINK => 151110888

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FPS_STEP_LEFT_LINK => 151143652

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FPS_STEP_RIGHT_LINK => 151143660

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FPS_DEVICE => 151012606

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FPS_PAUSE => 151012604

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_FIGHTING_THIRDPERSON => 167772160

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_TPS_TURN => 167903745

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_TPS_MOVE => 167838210

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_TPS_RUN => 167773185

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_TPS_ACTION => 167773186

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_TPS_SELECT => 167773187

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_TPS_USE => 167773188

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_TPS_JUMP => 167773189

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_TPS_MENU => 167773437

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_TPS_GLANCE => 167790081

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_TPS_VIEW => 167789574

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_TPS_STEPLEFT => 167789575

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_TPS_STEPRIGHT => 167789576

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_TPS_STEP => 167821827

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_TPS_DODGE => 167789577

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_TPS_INVENTORY => 167789578

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_TPS_TURN_LEFT_LINK => 167920868

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_TPS_TURN_RIGHT_LINK => 167920876

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_TPS_FORWARD_LINK => 167855328

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_TPS_BACKWARD_LINK => 167855336

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_TPS_GLANCE_UP_LINK => 168281312

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_TPS_GLANCE_DOWN_LINK => 168281320

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_TPS_GLANCE_LEFT_LINK => 168281316

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_TPS_GLANCE_RIGHT_LINK => 168281324

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_TPS_DEVICE => 167789822

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_TPS_PAUSE => 167789820

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_STRATEGY_ROLEPLAYING => 184549376

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_STRATEGYR_LATERAL => 184582657

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_STRATEGYR_MOVE => 184615426

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYR_GET => 184550401

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYR_APPLY => 184550402

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYR_SELECT => 184550403

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYR_ATTACK => 184550404

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYR_CAST => 184550405

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYR_CROUCH => 184550406

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYR_JUMP => 184550407

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYR_MENU => 184550653

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_STRATEGYR_GLANCE => 184567297

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYR_MAP => 184566792

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYR_DISPLAY => 184566793

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_STRATEGYR_ROTATE => 184697347

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYR_LEFT_LINK => 184599780

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYR_RIGHT_LINK => 184599788

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYR_FORWARD_LINK => 184632544

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYR_BACK_LINK => 184632552

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYR_ROTATE_LEFT_LINK => 184698084

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYR_ROTATE_RIGHT_LINK => 184698092

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYR_DEVICE => 184567038

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYR_PAUSE => 184567036

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_STRATEGY_TURN => 201326592

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_STRATEGYT_LATERAL => 201359873

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_STRATEGYT_MOVE => 201392642

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYT_SELECT => 201327617

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYT_INSTRUCT => 201327618

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYT_APPLY => 201327619

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYT_TEAM => 201327620

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYT_TURN => 201327621

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYT_MENU => 201327869

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYT_ZOOM => 201344006

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYT_MAP => 201344007

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYT_DISPLAY => 201344008

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYT_LEFT_LINK => 201376996

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYT_RIGHT_LINK => 201377004

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYT_FORWARD_LINK => 201409760

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYT_BACK_LINK => 201409768

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYT_DEVICE => 201344254

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_STRATEGYT_PAUSE => 201344252

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_SPORTS_HUNTING => 218103808

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_HUNTING_LATERAL => 218137089

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_HUNTING_MOVE => 218169858

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HUNTING_FIRE => 218104833

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HUNTING_AIM => 218104834

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HUNTING_WEAPON => 218104835

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HUNTING_BINOCULAR => 218104836

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HUNTING_CALL => 218104837

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HUNTING_MAP => 218104838

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HUNTING_SPECIAL => 218104839

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HUNTING_MENU => 218105085

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_HUNTING_GLANCE => 218121729

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HUNTING_DISPLAY => 218121224

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_HUNTING_ROTATE => 218251779

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HUNTING_CROUCH => 218121225

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HUNTING_JUMP => 218121226

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HUNTING_FIRESECONDARY => 218121227

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HUNTING_LEFT_LINK => 218154212

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HUNTING_RIGHT_LINK => 218154220

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HUNTING_FORWARD_LINK => 218186976

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HUNTING_BACK_LINK => 218186984

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HUNTING_ROTATE_LEFT_LINK => 218252516

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HUNTING_ROTATE_RIGHT_LINK => 218252524

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HUNTING_DEVICE => 218121470

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HUNTING_PAUSE => 218121468

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_SPORTS_FISHING => 234881024

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FISHING_LATERAL => 234914305

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FISHING_MOVE => 234947074

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FISHING_CAST => 234882049

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FISHING_TYPE => 234882050

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FISHING_BINOCULAR => 234882051

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FISHING_BAIT => 234882052

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FISHING_MAP => 234882053

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FISHING_MENU => 234882301

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_FISHING_GLANCE => 234898945

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FISHING_DISPLAY => 234898438

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FISHING_ROTATE => 235028995

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FISHING_CROUCH => 234898439

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FISHING_JUMP => 234898440

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FISHING_LEFT_LINK => 234931428

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FISHING_RIGHT_LINK => 234931436

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FISHING_FORWARD_LINK => 234964192

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FISHING_BACK_LINK => 234964200

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FISHING_ROTATE_LEFT_LINK => 235029732

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FISHING_ROTATE_RIGHT_LINK => 235029740

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FISHING_DEVICE => 234898686

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FISHING_PAUSE => 234898684

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_SPORTS_BASEBALL_BAT => 251658240

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_BASEBALLB_LATERAL => 251691521

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_BASEBALLB_MOVE => 251724290

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLB_SELECT => 251659265

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLB_NORMAL => 251659266

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLB_POWER => 251659267

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLB_BUNT => 251659268

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLB_STEAL => 251659269

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLB_BURST => 251659270

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLB_SLIDE => 251659271

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLB_CONTACT => 251659272

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLB_MENU => 251659517

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLB_NOSTEAL => 251675657

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLB_BOX => 251675658

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLB_LEFT_LINK => 251708644

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLB_RIGHT_LINK => 251708652

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLB_FORWARD_LINK => 251741408

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLB_BACK_LINK => 251741416

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLB_DEVICE => 251675902

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLB_PAUSE => 251675900

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_SPORTS_BASEBALL_PITCH => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_BASEBALLP_LATERAL => 268468737

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_BASEBALLP_MOVE => 268501506

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLP_SELECT => 268436481

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLP_PITCH => 268436482

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLP_BASE => 268436483

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLP_THROW => 268436484

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLP_FAKE => 268436485

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLP_MENU => 268436733

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLP_WALK => 268452870

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLP_LOOK => 268452871

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLP_LEFT_LINK => 268485860

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLP_RIGHT_LINK => 268485868

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLP_FORWARD_LINK => 268518624

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLP_BACK_LINK => 268518632

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLP_DEVICE => 268453118

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLP_PAUSE => 268453116

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_SPORTS_BASEBALL_FIELD => 285212672

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_BASEBALLF_LATERAL => 285245953

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_BASEBALLF_MOVE => 285278722

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLF_NEAREST => 285213697

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLF_THROW1 => 285213698

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLF_THROW2 => 285213699

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLF_BURST => 285213700

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLF_JUMP => 285213701

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLF_DIVE => 285213702

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLF_MENU => 285213949

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLF_SHIFTIN => 285230087

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLF_SHIFTOUT => 285230088

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLF_AIM_LEFT_LINK => 285263076

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLF_AIM_RIGHT_LINK => 285263084

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLF_FORWARD_LINK => 285295840

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLF_BACK_LINK => 285295848

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLF_DEVICE => 285230334

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BASEBALLF_PAUSE => 285230332

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_SPORTS_BASKETBALL_OFFENSE => 301989888

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_BBALLO_LATERAL => 302023169

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_BBALLO_MOVE => 302055938

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLO_SHOOT => 301990913

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLO_DUNK => 301990914

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLO_PASS => 301990915

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLO_FAKE => 301990916

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLO_SPECIAL => 301990917

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLO_PLAYER => 301990918

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLO_BURST => 301990919

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLO_CALL => 301990920

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLO_MENU => 301991165

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_BBALLO_GLANCE => 302007809

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLO_SCREEN => 302007305

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLO_PLAY => 302007306

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLO_JAB => 302007307

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLO_POST => 302007308

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLO_TIMEOUT => 302007309

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLO_SUBSTITUTE => 302007310

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLO_LEFT_LINK => 302040292

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLO_RIGHT_LINK => 302040300

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLO_FORWARD_LINK => 302073056

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLO_BACK_LINK => 302073064

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLO_DEVICE => 302007550

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLO_PAUSE => 302007548

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_SPORTS_BASKETBALL_DEFENSE => 318767104

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_BBALLD_LATERAL => 318800385

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_BBALLD_MOVE => 318833154

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLD_JUMP => 318768129

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLD_STEAL => 318768130

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLD_FAKE => 318768131

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLD_SPECIAL => 318768132

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLD_PLAYER => 318768133

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLD_BURST => 318768134

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLD_PLAY => 318768135

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLD_MENU => 318768381

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_BBALLD_GLANCE => 318785025

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLD_TIMEOUT => 318784520

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLD_SUBSTITUTE => 318784521

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLD_LEFT_LINK => 318817508

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLD_RIGHT_LINK => 318817516

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLD_FORWARD_LINK => 318850272

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLD_BACK_LINK => 318850280

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLD_DEVICE => 318784766

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BBALLD_PAUSE => 318784764

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_SPORTS_FOOTBALL_FIELD => 335544320

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLP_PLAY => 335545345

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLP_SELECT => 335545346

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLP_HELP => 335545347

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLP_MENU => 335545597

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLP_DEVICE => 335561982

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLP_PAUSE => 335561980

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_SPORTS_FOOTBALL_QBCK => 352321536

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FOOTBALLQ_LATERAL => 352354817

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FOOTBALLQ_MOVE => 352387586

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLQ_SELECT => 352322561

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLQ_SNAP => 352322562

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLQ_JUMP => 352322563

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLQ_SLIDE => 352322564

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLQ_PASS => 352322565

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLQ_FAKE => 352322566

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLQ_MENU => 352322813

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLQ_FAKESNAP => 352338951

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLQ_MOTION => 352338952

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLQ_AUDIBLE => 352338953

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLQ_LEFT_LINK => 352371940

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLQ_RIGHT_LINK => 352371948

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLQ_FORWARD_LINK => 352404704

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLQ_BACK_LINK => 352404712

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLQ_DEVICE => 352339198

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLQ_PAUSE => 352339196

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_SPORTS_FOOTBALL_OFFENSE => 369098752

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FOOTBALLO_LATERAL => 369132033

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FOOTBALLO_MOVE => 369164802

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLO_JUMP => 369099777

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLO_LEFTARM => 369099778

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLO_RIGHTARM => 369099779

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLO_THROW => 369099780

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLO_SPIN => 369099781

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLO_MENU => 369100029

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLO_JUKE => 369116166

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLO_SHOULDER => 369116167

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLO_TURBO => 369116168

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLO_DIVE => 369116169

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLO_ZOOM => 369116170

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLO_SUBSTITUTE => 369116171

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLO_LEFT_LINK => 369149156

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLO_RIGHT_LINK => 369149164

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLO_FORWARD_LINK => 369181920

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLO_BACK_LINK => 369181928

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLO_DEVICE => 369116414

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLO_PAUSE => 369116412

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_SPORTS_FOOTBALL_DEFENSE => 385875968

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FOOTBALLD_LATERAL => 385909249

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_FOOTBALLD_MOVE => 385942018

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLD_PLAY => 385876993

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLD_SELECT => 385876994

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLD_JUMP => 385876995

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLD_TACKLE => 385876996

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLD_FAKE => 385876997

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLD_SUPERTACKLE => 385876998

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLD_MENU => 385877245

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLD_SPIN => 385893383

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLD_SWIM => 385893384

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLD_BULLRUSH => 385893385

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLD_RIP => 385893386

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLD_AUDIBLE => 385893387

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLD_ZOOM => 385893388

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLD_SUBSTITUTE => 385893389

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLD_LEFT_LINK => 385926372

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLD_RIGHT_LINK => 385926380

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLD_FORWARD_LINK => 385959136

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLD_BACK_LINK => 385959144

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLD_DEVICE => 385893630

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_FOOTBALLD_PAUSE => 385893628

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_SPORTS_GOLF => 402653184

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_GOLF_LATERAL => 402686465

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_GOLF_MOVE => 402719234

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_GOLF_SWING => 402654209

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_GOLF_SELECT => 402654210

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_GOLF_UP => 402654211

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_GOLF_DOWN => 402654212

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_GOLF_TERRAIN => 402654213

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_GOLF_FLYBY => 402654214

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_GOLF_MENU => 402654461

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_GOLF_SCROLL => 402671105

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_GOLF_ZOOM => 402670599

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_GOLF_TIMEOUT => 402670600

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_GOLF_SUBSTITUTE => 402670601

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_GOLF_LEFT_LINK => 402703588

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_GOLF_RIGHT_LINK => 402703596

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_GOLF_FORWARD_LINK => 402736352

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_GOLF_BACK_LINK => 402736360

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_GOLF_DEVICE => 402670846

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_GOLF_PAUSE => 402670844

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_SPORTS_HOCKEY_OFFENSE => 419430400

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_HOCKEYO_LATERAL => 419463681

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_HOCKEYO_MOVE => 419496450

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYO_SHOOT => 419431425

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYO_PASS => 419431426

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYO_BURST => 419431427

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYO_SPECIAL => 419431428

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYO_FAKE => 419431429

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYO_MENU => 419431677

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_HOCKEYO_SCROLL => 419448321

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYO_ZOOM => 419447814

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYO_STRATEGY => 419447815

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYO_TIMEOUT => 419447816

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYO_SUBSTITUTE => 419447817

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYO_LEFT_LINK => 419480804

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYO_RIGHT_LINK => 419480812

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYO_FORWARD_LINK => 419513568

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYO_BACK_LINK => 419513576

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYO_DEVICE => 419448062

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYO_PAUSE => 419448060

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_SPORTS_HOCKEY_DEFENSE => 436207616

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_HOCKEYD_LATERAL => 436240897

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_HOCKEYD_MOVE => 436273666

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYD_PLAYER => 436208641

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYD_STEAL => 436208642

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYD_BURST => 436208643

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYD_BLOCK => 436208644

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYD_FAKE => 436208645

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYD_MENU => 436208893

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_HOCKEYD_SCROLL => 436225537

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYD_ZOOM => 436225030

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYD_STRATEGY => 436225031

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYD_TIMEOUT => 436225032

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYD_SUBSTITUTE => 436225033

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYD_LEFT_LINK => 436258020

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYD_RIGHT_LINK => 436258028

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYD_FORWARD_LINK => 436290784

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYD_BACK_LINK => 436290792

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYD_DEVICE => 436225278

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYD_PAUSE => 436225276

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_SPORTS_HOCKEY_GOALIE => 452984832

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_HOCKEYG_LATERAL => 453018113

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_HOCKEYG_MOVE => 453050882

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYG_PASS => 452985857

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYG_POKE => 452985858

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYG_STEAL => 452985859

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYG_BLOCK => 452985860

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYG_MENU => 452986109

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_HOCKEYG_SCROLL => 453002753

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYG_ZOOM => 453002245

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYG_STRATEGY => 453002246

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYG_TIMEOUT => 453002247

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYG_SUBSTITUTE => 453002248

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYG_LEFT_LINK => 453035236

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYG_RIGHT_LINK => 453035244

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYG_FORWARD_LINK => 453068000

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYG_BACK_LINK => 453068008

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYG_DEVICE => 453002494

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_HOCKEYG_PAUSE => 453002492

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_SPORTS_BIKING_MOUNTAIN => 469762048

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_BIKINGM_TURN => 469795329

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_BIKINGM_PEDAL => 469828098

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BIKINGM_JUMP => 469763073

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BIKINGM_CAMERA => 469763074

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BIKINGM_SPECIAL1 => 469763075

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BIKINGM_SELECT => 469763076

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BIKINGM_SPECIAL2 => 469763077

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BIKINGM_MENU => 469763325

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_BIKINGM_SCROLL => 469779969

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BIKINGM_ZOOM => 469779462

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_BIKINGM_BRAKE => 470041091

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BIKINGM_LEFT_LINK => 469812452

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BIKINGM_RIGHT_LINK => 469812460

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BIKINGM_FASTER_LINK => 469845216

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BIKINGM_SLOWER_LINK => 469845224

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BIKINGM_BRAKE_BUTTON_LINK => 470041832

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BIKINGM_DEVICE => 469779710

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BIKINGM_PAUSE => 469779708

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_SPORTS_SKIING => 486539264

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_SKIING_TURN => 486572545

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_SKIING_SPEED => 486605314

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SKIING_JUMP => 486540289

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SKIING_CROUCH => 486540290

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SKIING_CAMERA => 486540291

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SKIING_SPECIAL1 => 486540292

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SKIING_SELECT => 486540293

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SKIING_SPECIAL2 => 486540294

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SKIING_MENU => 486540541

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_SKIING_GLANCE => 486557185

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SKIING_ZOOM => 486556679

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SKIING_LEFT_LINK => 486589668

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SKIING_RIGHT_LINK => 486589676

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SKIING_FASTER_LINK => 486622432

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SKIING_SLOWER_LINK => 486622440

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SKIING_DEVICE => 486556926

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SKIING_PAUSE => 486556924

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_SPORTS_SOCCER_OFFENSE => 503316480

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_SOCCERO_LATERAL => 503349761

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_SOCCERO_MOVE => 503382530

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_SOCCERO_BEND => 503415299

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERO_SHOOT => 503317505

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERO_PASS => 503317506

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERO_FAKE => 503317507

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERO_PLAYER => 503317508

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERO_SPECIAL1 => 503317509

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERO_SELECT => 503317510

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERO_MENU => 503317757

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_SOCCERO_GLANCE => 503334401

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERO_SUBSTITUTE => 503333895

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERO_SHOOTLOW => 503333896

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERO_SHOOTHIGH => 503333897

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERO_PASSTHRU => 503333898

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERO_SPRINT => 503333899

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERO_CONTROL => 503333900

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERO_HEAD => 503333901

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERO_LEFT_LINK => 503366884

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERO_RIGHT_LINK => 503366892

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERO_FORWARD_LINK => 503399648

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERO_BACK_LINK => 503399656

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERO_DEVICE => 503334142

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERO_PAUSE => 503334140

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_SPORTS_SOCCER_DEFENSE => 520093696

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_SOCCERD_LATERAL => 520126977

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_SOCCERD_MOVE => 520159746

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERD_BLOCK => 520094721

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERD_STEAL => 520094722

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERD_FAKE => 520094723

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERD_PLAYER => 520094724

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERD_SPECIAL => 520094725

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERD_SELECT => 520094726

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERD_SLIDE => 520094727

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERD_MENU => 520094973

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_SOCCERD_GLANCE => 520111617

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERD_FOUL => 520111112

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERD_HEAD => 520111113

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERD_CLEAR => 520111114

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERD_GOALIECHARGE => 520111115

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERD_SUBSTITUTE => 520111116

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERD_LEFT_LINK => 520144100

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERD_RIGHT_LINK => 520144108

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERD_FORWARD_LINK => 520176864

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERD_BACK_LINK => 520176872

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERD_DEVICE => 520111358

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_SOCCERD_PAUSE => 520111356

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_SPORTS_RACQUET => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_RACQUET_LATERAL => 536904193

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_RACQUET_MOVE => 536936962

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_RACQUET_SWING => 536871937

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_RACQUET_BACKSWING => 536871938

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_RACQUET_SMASH => 536871939

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_RACQUET_SPECIAL => 536871940

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_RACQUET_SELECT => 536871941

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_RACQUET_MENU => 536872189

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_RACQUET_GLANCE => 536888833

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_RACQUET_TIMEOUT => 536888326

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_RACQUET_SUBSTITUTE => 536888327

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_RACQUET_LEFT_LINK => 536921316

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_RACQUET_RIGHT_LINK => 536921324

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_RACQUET_FORWARD_LINK => 536954080

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_RACQUET_BACK_LINK => 536954088

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_RACQUET_DEVICE => 536888574

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_RACQUET_PAUSE => 536888572

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_ARCADE_SIDE2SIDE => 553648128

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ARCADES_LATERAL => 553681409

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ARCADES_MOVE => 553714178

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADES_THROW => 553649153

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADES_CARRY => 553649154

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADES_ATTACK => 553649155

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADES_SPECIAL => 553649156

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADES_SELECT => 553649157

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADES_MENU => 553649405

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_ARCADES_VIEW => 553666049

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADES_LEFT_LINK => 553698532

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADES_RIGHT_LINK => 553698540

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADES_FORWARD_LINK => 553731296

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADES_BACK_LINK => 553731304

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADES_VIEW_UP_LINK => 554157280

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADES_VIEW_DOWN_LINK => 554157288

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADES_VIEW_LEFT_LINK => 554157284

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADES_VIEW_RIGHT_LINK => 554157292

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADES_DEVICE => 553665790

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADES_PAUSE => 553665788

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_ARCADE_PLATFORM => 570425344

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ARCADEP_LATERAL => 570458625

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ARCADEP_MOVE => 570491394

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADEP_JUMP => 570426369

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADEP_FIRE => 570426370

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADEP_CROUCH => 570426371

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADEP_SPECIAL => 570426372

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADEP_SELECT => 570426373

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADEP_MENU => 570426621

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_ARCADEP_VIEW => 570443265

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADEP_FIRESECONDARY => 570442758

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADEP_LEFT_LINK => 570475748

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADEP_RIGHT_LINK => 570475756

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADEP_FORWARD_LINK => 570508512

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADEP_BACK_LINK => 570508520

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADEP_VIEW_UP_LINK => 570934496

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADEP_VIEW_DOWN_LINK => 570934504

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADEP_VIEW_LEFT_LINK => 570934500

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADEP_VIEW_RIGHT_LINK => 570934508

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADEP_DEVICE => 570443006

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_ARCADEP_PAUSE => 570443004

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_CAD_2DCONTROL => 587202560

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_2DCONTROL_LATERAL => 587235841

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_2DCONTROL_MOVE => 587268610

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_2DCONTROL_INOUT => 587301379

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_2DCONTROL_SELECT => 587203585

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_2DCONTROL_SPECIAL1 => 587203586

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_2DCONTROL_SPECIAL => 587203587

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_2DCONTROL_SPECIAL2 => 587203588

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_2DCONTROL_MENU => 587203837

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_2DCONTROL_HATSWITCH => 587220481

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_2DCONTROL_ROTATEZ => 587350532

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_2DCONTROL_DISPLAY => 587219973

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_2DCONTROL_DEVICE => 587220222

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_2DCONTROL_PAUSE => 587220220

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_CAD_3DCONTROL => 603979776

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_3DCONTROL_LATERAL => 604013057

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_3DCONTROL_MOVE => 604045826

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_3DCONTROL_INOUT => 604078595

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_3DCONTROL_SELECT => 603980801

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_3DCONTROL_SPECIAL1 => 603980802

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_3DCONTROL_SPECIAL => 603980803

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_3DCONTROL_SPECIAL2 => 603980804

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_3DCONTROL_MENU => 603981053

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_3DCONTROL_HATSWITCH => 603997697

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_3DCONTROL_ROTATEX => 604193284

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_3DCONTROL_ROTATEY => 604160517

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_3DCONTROL_ROTATEZ => 604127750

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_3DCONTROL_DISPLAY => 603997189

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_3DCONTROL_DEVICE => 603997438

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_3DCONTROL_PAUSE => 603997436

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_CAD_FLYBY => 620756992

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_CADF_LATERAL => 620790273

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_CADF_MOVE => 620823042

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_CADF_INOUT => 620855811

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_CADF_SELECT => 620758017

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_CADF_SPECIAL1 => 620758018

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_CADF_SPECIAL => 620758019

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_CADF_SPECIAL2 => 620758020

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_CADF_MENU => 620758269

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_CADF_HATSWITCH => 620774913

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_CADF_ROTATEX => 620970500

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_CADF_ROTATEY => 620937733

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_CADF_ROTATEZ => 620904966

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_CADF_DISPLAY => 620774405

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_CADF_DEVICE => 620774654

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_CADF_PAUSE => 620774652

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_CAD_MODEL => 637534208

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_CADM_LATERAL => 637567489

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_CADM_MOVE => 637600258

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_CADM_INOUT => 637633027

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_CADM_SELECT => 637535233

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_CADM_SPECIAL1 => 637535234

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_CADM_SPECIAL => 637535235

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_CADM_SPECIAL2 => 637535236

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_CADM_MENU => 637535485

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_CADM_HATSWITCH => 637552129

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_CADM_ROTATEX => 637747716

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_CADM_ROTATEY => 637714949

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_CADM_ROTATEZ => 637682182

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_CADM_DISPLAY => 637551621

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_CADM_DEVICE => 637551870

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_CADM_PAUSE => 637551868

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_REMOTE_CONTROL => 654311424

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_REMOTE_SLIDER => 654639617

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_MUTE => 654312449

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_SELECT => 654312450

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_PLAY => 654320643

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_CUE => 654320644

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_REVIEW => 654320645

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_CHANGE => 654320646

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_RECORD => 654320647

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_MENU => 654312701

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_REMOTE_SLIDER2 => 654656002

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_TV => 654334984

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_CABLE => 654334985

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_CD => 654334986

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_VCR => 654334987

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_TUNER => 654334988

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_DVD => 654334989

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_ADJUST => 654334990

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_DIGIT0 => 654332943

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_DIGIT1 => 654332944

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_DIGIT2 => 654332945

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_DIGIT3 => 654332946

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_DIGIT4 => 654332947

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_DIGIT5 => 654332948

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_DIGIT6 => 654332949

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_DIGIT7 => 654332950

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_DIGIT8 => 654332951

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_DIGIT9 => 654332952

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_DEVICE => 654329086

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_REMOTE_PAUSE => 654329084

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_BROWSER_CONTROL => 671088640

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_BROWSER_LATERAL => 671121921

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_BROWSER_MOVE => 671154690

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BROWSER_SELECT => 671089665

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_BROWSER_VIEW => 671187459

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BROWSER_REFRESH => 671089666

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BROWSER_MENU => 671089917

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BROWSER_SEARCH => 671106051

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BROWSER_STOP => 671106052

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BROWSER_HOME => 671106053

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BROWSER_FAVORITES => 671106054

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BROWSER_NEXT => 671106055

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BROWSER_PREVIOUS => 671106056

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BROWSER_HISTORY => 671106057

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BROWSER_PRINT => 671106058

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BROWSER_DEVICE => 671106302

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_BROWSER_PAUSE => 671106300

    /**
     * @type {Integer (UInt32)}
     */
    static DIVIRTUAL_DRIVING_MECHA => 687865856

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_MECHA_STEER => 687899137

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_MECHA_TORSO => 687931906

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_MECHA_ROTATE => 687997443

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_MECHA_THROTTLE => 688095748

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_MECHA_FIRE => 687866881

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_MECHA_WEAPONS => 687866882

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_MECHA_TARGET => 687866883

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_MECHA_REVERSE => 687866884

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_MECHA_ZOOM => 687866885

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_MECHA_JUMP => 687866886

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_MECHA_MENU => 687867133

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_MECHA_CENTER => 687883271

    /**
     * @type {Integer (UInt32)}
     */
    static DIHATSWITCH_MECHA_GLANCE => 687883777

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_MECHA_VIEW => 687883272

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_MECHA_FIRESECONDARY => 687883273

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_MECHA_LEFT_LINK => 687916260

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_MECHA_RIGHT_LINK => 687916268

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_MECHA_FORWARD_LINK => 687949024

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_MECHA_BACK_LINK => 687949032

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_MECHA_ROTATE_LEFT_LINK => 688014564

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_MECHA_ROTATE_RIGHT_LINK => 688014572

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_MECHA_FASTER_LINK => 688112864

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_MECHA_SLOWER_LINK => 688112872

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_MECHA_DEVICE => 687883518

    /**
     * @type {Integer (UInt32)}
     */
    static DIBUTTON_MECHA_PAUSE => 687883516

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ANY_X_1 => 4278239745

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ANY_X_2 => 4278239746

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ANY_Y_1 => 4278272513

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ANY_Y_2 => 4278272514

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ANY_Z_1 => 4278305281

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ANY_Z_2 => 4278305282

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ANY_R_1 => 4278338049

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ANY_R_2 => 4278338050

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ANY_U_1 => 4278370817

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ANY_U_2 => 4278370818

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ANY_V_1 => 4278403585

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ANY_V_2 => 4278403586

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ANY_A_1 => 4278436353

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ANY_A_2 => 4278436354

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ANY_B_1 => 4278469121

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ANY_B_2 => 4278469122

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ANY_C_1 => 4278501889

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ANY_C_2 => 4278501890

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ANY_S_1 => 4278534657

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ANY_S_2 => 4278534658

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ANY_1 => 4278206977

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ANY_2 => 4278206978

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ANY_3 => 4278206979

    /**
     * @type {Integer (UInt32)}
     */
    static DIAXIS_ANY_4 => 4278206980

    /**
     * @type {Integer (UInt32)}
     */
    static DIPOV_ANY_1 => 4278208001

    /**
     * @type {Integer (UInt32)}
     */
    static DIPOV_ANY_2 => 4278208002

    /**
     * @type {Integer (UInt32)}
     */
    static DIPOV_ANY_3 => 4278208003

    /**
     * @type {Integer (UInt32)}
     */
    static DIPOV_ANY_4 => 4278208004

    /**
     * @type {Integer (Int32)}
     */
    static JOY_PASSDRIVERDATA => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_ISHEADTRACKER => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_ISGAMEPORTDRIVER => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_ISANALOGPORTDRIVER => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_AUTOLOAD => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_NODEVNODE => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_ISGAMEPORTBUS => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static JOY_HWS_GAMEPORTBUSBUSY => 1

    /**
     * @type {Integer (Int32)}
     */
    static JOY_US_VOLATILE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JOY_OEMPOLL_PASSDRIVERDATA => 7

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_BIT_POWER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_BIT_WINDOWS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_BIT_VOLUMEUP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_BIT_VOLUMEDOWN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_BIT_ROTATION_LOCK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_BIT_BACK => 32

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_BIT_SEARCH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_BIT_CAMERAFOCUS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_BIT_CAMERASHUTTER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_BIT_RINGERTOGGLE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_BIT_HEADSET => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_BIT_HWKBDEPLOY => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_BIT_CAMERALENS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_BIT_OEMCUSTOM => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_BIT_OEMCUSTOM2 => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_BIT_OEMCUSTOM3 => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static BUTTON_BIT_ALLBUTTONSMASK => 16383

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_BUTTON_SET_ENABLED_ON_IDLE => 721576

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_BUTTON_GET_ENABLED_ON_IDLE => 721580
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {HINSTANCE} hinst 
     * @param {Integer} dwVersion 
     * @param {Pointer<Guid>} riidltf 
     * @param {Pointer<Pointer<Void>>} ppvOut 
     * @param {IUnknown} punkOuter 
     * @returns {HRESULT} 
     */
    static DirectInput8Create(hinst, dwVersion, riidltf, ppvOut, punkOuter) {
        hinst := hinst is Win32Handle ? NumGet(hinst, "ptr") : hinst

        ppvOutMarshal := ppvOut is VarRef ? "ptr*" : "ptr"

        result := DllCall("DINPUT8.dll\DirectInput8Create", "ptr", hinst, "uint", dwVersion, "ptr", riidltf, ppvOutMarshal, ppvOut, "ptr", punkOuter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The joyConfigChanged function informs the joystick driver that the configuration has changed and should be reloaded from the registry.
     * @param {Integer} dwFlags Reserved for future use. Must equal zero.
     * @returns {Integer} Returns JOYERR_NOERROR if successful. Returns JOYERR_PARMS if the parameter is non-zero.
     * @see https://docs.microsoft.com/windows/win32/api//joystickapi/nf-joystickapi-joyconfigchanged
     * @since windows5.0
     */
    static joyConfigChanged(dwFlags) {
        result := DllCall("WINMM.dll\joyConfigChanged", "uint", dwFlags, "uint")
        return result
    }

    /**
     * 
     * @param {PHIDP_PREPARSED_DATA} PreparsedData 
     * @param {Pointer<HIDP_CAPS>} Capabilities 
     * @returns {NTSTATUS} 
     */
    static HidP_GetCaps(PreparsedData, Capabilities) {
        result := DllCall("HID.dll\HidP_GetCaps", "ptr", PreparsedData, "ptr", Capabilities, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HIDP_LINK_COLLECTION_NODE>} LinkCollectionNodes 
     * @param {Pointer<Integer>} LinkCollectionNodesLength 
     * @param {PHIDP_PREPARSED_DATA} PreparsedData 
     * @returns {NTSTATUS} 
     */
    static HidP_GetLinkCollectionNodes(LinkCollectionNodes, LinkCollectionNodesLength, PreparsedData) {
        LinkCollectionNodesLengthMarshal := LinkCollectionNodesLength is VarRef ? "uint*" : "ptr"

        result := DllCall("HID.dll\HidP_GetLinkCollectionNodes", "ptr", LinkCollectionNodes, LinkCollectionNodesLengthMarshal, LinkCollectionNodesLength, "ptr", PreparsedData, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} UsagePage 
     * @param {Integer} LinkCollection 
     * @param {Integer} Usage 
     * @param {Pointer<HIDP_BUTTON_CAPS>} ButtonCaps 
     * @param {Pointer<Integer>} ButtonCapsLength 
     * @param {PHIDP_PREPARSED_DATA} PreparsedData 
     * @returns {NTSTATUS} 
     */
    static HidP_GetSpecificButtonCaps(ReportType, UsagePage, LinkCollection, Usage, ButtonCaps, ButtonCapsLength, PreparsedData) {
        ButtonCapsLengthMarshal := ButtonCapsLength is VarRef ? "ushort*" : "ptr"

        result := DllCall("HID.dll\HidP_GetSpecificButtonCaps", "int", ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, "ptr", ButtonCaps, ButtonCapsLengthMarshal, ButtonCapsLength, "ptr", PreparsedData, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Pointer<HIDP_BUTTON_CAPS>} ButtonCaps 
     * @param {Pointer<Integer>} ButtonCapsLength 
     * @param {PHIDP_PREPARSED_DATA} PreparsedData 
     * @returns {NTSTATUS} 
     */
    static HidP_GetButtonCaps(ReportType, ButtonCaps, ButtonCapsLength, PreparsedData) {
        ButtonCapsLengthMarshal := ButtonCapsLength is VarRef ? "ushort*" : "ptr"

        result := DllCall("HID.dll\HidP_GetButtonCaps", "int", ReportType, "ptr", ButtonCaps, ButtonCapsLengthMarshal, ButtonCapsLength, "ptr", PreparsedData, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} UsagePage 
     * @param {Integer} LinkCollection 
     * @param {Integer} Usage 
     * @param {Pointer<HIDP_VALUE_CAPS>} ValueCaps 
     * @param {Pointer<Integer>} ValueCapsLength 
     * @param {PHIDP_PREPARSED_DATA} PreparsedData 
     * @returns {NTSTATUS} 
     */
    static HidP_GetSpecificValueCaps(ReportType, UsagePage, LinkCollection, Usage, ValueCaps, ValueCapsLength, PreparsedData) {
        ValueCapsLengthMarshal := ValueCapsLength is VarRef ? "ushort*" : "ptr"

        result := DllCall("HID.dll\HidP_GetSpecificValueCaps", "int", ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, "ptr", ValueCaps, ValueCapsLengthMarshal, ValueCapsLength, "ptr", PreparsedData, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Pointer<HIDP_VALUE_CAPS>} ValueCaps 
     * @param {Pointer<Integer>} ValueCapsLength 
     * @param {PHIDP_PREPARSED_DATA} PreparsedData 
     * @returns {NTSTATUS} 
     */
    static HidP_GetValueCaps(ReportType, ValueCaps, ValueCapsLength, PreparsedData) {
        ValueCapsLengthMarshal := ValueCapsLength is VarRef ? "ushort*" : "ptr"

        result := DllCall("HID.dll\HidP_GetValueCaps", "int", ReportType, "ptr", ValueCaps, ValueCapsLengthMarshal, ValueCapsLength, "ptr", PreparsedData, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} DataIndex 
     * @param {PHIDP_PREPARSED_DATA} PreparsedData 
     * @param {Pointer<HIDP_EXTENDED_ATTRIBUTES>} Attributes 
     * @param {Pointer<Integer>} LengthAttributes 
     * @returns {NTSTATUS} 
     */
    static HidP_GetExtendedAttributes(ReportType, DataIndex, PreparsedData, Attributes, LengthAttributes) {
        LengthAttributesMarshal := LengthAttributes is VarRef ? "uint*" : "ptr"

        result := DllCall("HID.dll\HidP_GetExtendedAttributes", "int", ReportType, "ushort", DataIndex, "ptr", PreparsedData, "ptr", Attributes, LengthAttributesMarshal, LengthAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} ReportID 
     * @param {PHIDP_PREPARSED_DATA} PreparsedData 
     * @param {Pointer} Report 
     * @param {Integer} ReportLength 
     * @returns {NTSTATUS} 
     */
    static HidP_InitializeReportForID(ReportType, ReportID, PreparsedData, Report, ReportLength) {
        result := DllCall("HID.dll\HidP_InitializeReportForID", "int", ReportType, "char", ReportID, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Pointer<HIDP_DATA>} DataList 
     * @param {Pointer<Integer>} DataLength 
     * @param {PHIDP_PREPARSED_DATA} PreparsedData 
     * @param {Pointer} Report 
     * @param {Integer} ReportLength 
     * @returns {NTSTATUS} 
     */
    static HidP_SetData(ReportType, DataList, DataLength, PreparsedData, Report, ReportLength) {
        DataLengthMarshal := DataLength is VarRef ? "uint*" : "ptr"

        result := DllCall("HID.dll\HidP_SetData", "int", ReportType, "ptr", DataList, DataLengthMarshal, DataLength, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Pointer<HIDP_DATA>} DataList 
     * @param {Pointer<Integer>} DataLength 
     * @param {PHIDP_PREPARSED_DATA} PreparsedData 
     * @param {Pointer} Report 
     * @param {Integer} ReportLength 
     * @returns {NTSTATUS} 
     */
    static HidP_GetData(ReportType, DataList, DataLength, PreparsedData, Report, ReportLength) {
        DataLengthMarshal := DataLength is VarRef ? "uint*" : "ptr"

        result := DllCall("HID.dll\HidP_GetData", "int", ReportType, "ptr", DataList, DataLengthMarshal, DataLength, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {PHIDP_PREPARSED_DATA} PreparsedData 
     * @returns {Integer} 
     */
    static HidP_MaxDataListLength(ReportType, PreparsedData) {
        result := DllCall("HID.dll\HidP_MaxDataListLength", "int", ReportType, "ptr", PreparsedData, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} UsagePage 
     * @param {Integer} LinkCollection 
     * @param {Pointer<Integer>} UsageList 
     * @param {Pointer<Integer>} UsageLength 
     * @param {PHIDP_PREPARSED_DATA} PreparsedData 
     * @param {Pointer} Report 
     * @param {Integer} ReportLength 
     * @returns {NTSTATUS} 
     */
    static HidP_SetUsages(ReportType, UsagePage, LinkCollection, UsageList, UsageLength, PreparsedData, Report, ReportLength) {
        UsageListMarshal := UsageList is VarRef ? "ushort*" : "ptr"
        UsageLengthMarshal := UsageLength is VarRef ? "uint*" : "ptr"

        result := DllCall("HID.dll\HidP_SetUsages", "int", ReportType, "ushort", UsagePage, "ushort", LinkCollection, UsageListMarshal, UsageList, UsageLengthMarshal, UsageLength, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} UsagePage 
     * @param {Integer} LinkCollection 
     * @param {Pointer<Integer>} UsageList 
     * @param {Pointer<Integer>} UsageLength 
     * @param {PHIDP_PREPARSED_DATA} PreparsedData 
     * @param {Pointer} Report 
     * @param {Integer} ReportLength 
     * @returns {NTSTATUS} 
     */
    static HidP_UnsetUsages(ReportType, UsagePage, LinkCollection, UsageList, UsageLength, PreparsedData, Report, ReportLength) {
        UsageListMarshal := UsageList is VarRef ? "ushort*" : "ptr"
        UsageLengthMarshal := UsageLength is VarRef ? "uint*" : "ptr"

        result := DllCall("HID.dll\HidP_UnsetUsages", "int", ReportType, "ushort", UsagePage, "ushort", LinkCollection, UsageListMarshal, UsageList, UsageLengthMarshal, UsageLength, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} UsagePage 
     * @param {Integer} LinkCollection 
     * @param {Pointer<Integer>} UsageList 
     * @param {Pointer<Integer>} UsageLength 
     * @param {PHIDP_PREPARSED_DATA} PreparsedData 
     * @param {Pointer} Report 
     * @param {Integer} ReportLength 
     * @returns {NTSTATUS} 
     */
    static HidP_GetUsages(ReportType, UsagePage, LinkCollection, UsageList, UsageLength, PreparsedData, Report, ReportLength) {
        UsageListMarshal := UsageList is VarRef ? "ushort*" : "ptr"
        UsageLengthMarshal := UsageLength is VarRef ? "uint*" : "ptr"

        result := DllCall("HID.dll\HidP_GetUsages", "int", ReportType, "ushort", UsagePage, "ushort", LinkCollection, UsageListMarshal, UsageList, UsageLengthMarshal, UsageLength, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} LinkCollection 
     * @param {Pointer<USAGE_AND_PAGE>} ButtonList 
     * @param {Pointer<Integer>} UsageLength 
     * @param {PHIDP_PREPARSED_DATA} PreparsedData 
     * @param {Pointer} Report 
     * @param {Integer} ReportLength 
     * @returns {NTSTATUS} 
     */
    static HidP_GetUsagesEx(ReportType, LinkCollection, ButtonList, UsageLength, PreparsedData, Report, ReportLength) {
        UsageLengthMarshal := UsageLength is VarRef ? "uint*" : "ptr"

        result := DllCall("HID.dll\HidP_GetUsagesEx", "int", ReportType, "ushort", LinkCollection, "ptr", ButtonList, UsageLengthMarshal, UsageLength, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} UsagePage 
     * @param {PHIDP_PREPARSED_DATA} PreparsedData 
     * @returns {Integer} 
     */
    static HidP_MaxUsageListLength(ReportType, UsagePage, PreparsedData) {
        result := DllCall("HID.dll\HidP_MaxUsageListLength", "int", ReportType, "ushort", UsagePage, "ptr", PreparsedData, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} UsagePage 
     * @param {Integer} LinkCollection 
     * @param {Integer} Usage 
     * @param {Integer} UsageValue 
     * @param {PHIDP_PREPARSED_DATA} PreparsedData 
     * @param {Pointer} Report 
     * @param {Integer} ReportLength 
     * @returns {NTSTATUS} 
     */
    static HidP_SetUsageValue(ReportType, UsagePage, LinkCollection, Usage, UsageValue, PreparsedData, Report, ReportLength) {
        result := DllCall("HID.dll\HidP_SetUsageValue", "int", ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, "uint", UsageValue, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} UsagePage 
     * @param {Integer} LinkCollection 
     * @param {Integer} Usage 
     * @param {Integer} UsageValue 
     * @param {PHIDP_PREPARSED_DATA} PreparsedData 
     * @param {Pointer} Report 
     * @param {Integer} ReportLength 
     * @returns {NTSTATUS} 
     */
    static HidP_SetScaledUsageValue(ReportType, UsagePage, LinkCollection, Usage, UsageValue, PreparsedData, Report, ReportLength) {
        result := DllCall("HID.dll\HidP_SetScaledUsageValue", "int", ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, "int", UsageValue, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} UsagePage 
     * @param {Integer} LinkCollection 
     * @param {Integer} Usage 
     * @param {Pointer} UsageValue 
     * @param {Integer} UsageValueByteLength 
     * @param {PHIDP_PREPARSED_DATA} PreparsedData 
     * @param {Pointer} Report 
     * @param {Integer} ReportLength 
     * @returns {NTSTATUS} 
     */
    static HidP_SetUsageValueArray(ReportType, UsagePage, LinkCollection, Usage, UsageValue, UsageValueByteLength, PreparsedData, Report, ReportLength) {
        result := DllCall("HID.dll\HidP_SetUsageValueArray", "int", ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, "ptr", UsageValue, "ushort", UsageValueByteLength, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} UsagePage 
     * @param {Integer} LinkCollection 
     * @param {Integer} Usage 
     * @param {Pointer<Integer>} UsageValue 
     * @param {PHIDP_PREPARSED_DATA} PreparsedData 
     * @param {Pointer} Report 
     * @param {Integer} ReportLength 
     * @returns {NTSTATUS} 
     */
    static HidP_GetUsageValue(ReportType, UsagePage, LinkCollection, Usage, UsageValue, PreparsedData, Report, ReportLength) {
        UsageValueMarshal := UsageValue is VarRef ? "uint*" : "ptr"

        result := DllCall("HID.dll\HidP_GetUsageValue", "int", ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, UsageValueMarshal, UsageValue, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} UsagePage 
     * @param {Integer} LinkCollection 
     * @param {Integer} Usage 
     * @param {Pointer<Integer>} UsageValue 
     * @param {PHIDP_PREPARSED_DATA} PreparsedData 
     * @param {Pointer} Report 
     * @param {Integer} ReportLength 
     * @returns {NTSTATUS} 
     */
    static HidP_GetScaledUsageValue(ReportType, UsagePage, LinkCollection, Usage, UsageValue, PreparsedData, Report, ReportLength) {
        UsageValueMarshal := UsageValue is VarRef ? "int*" : "ptr"

        result := DllCall("HID.dll\HidP_GetScaledUsageValue", "int", ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, UsageValueMarshal, UsageValue, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} UsagePage 
     * @param {Integer} LinkCollection 
     * @param {Integer} Usage 
     * @param {Pointer} UsageValue 
     * @param {Integer} UsageValueByteLength 
     * @param {PHIDP_PREPARSED_DATA} PreparsedData 
     * @param {Pointer} Report 
     * @param {Integer} ReportLength 
     * @returns {NTSTATUS} 
     */
    static HidP_GetUsageValueArray(ReportType, UsagePage, LinkCollection, Usage, UsageValue, UsageValueByteLength, PreparsedData, Report, ReportLength) {
        result := DllCall("HID.dll\HidP_GetUsageValueArray", "int", ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, "ptr", UsageValue, "ushort", UsageValueByteLength, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} PreviousUsageList 
     * @param {Pointer<Integer>} CurrentUsageList 
     * @param {Pointer<Integer>} BreakUsageList 
     * @param {Pointer<Integer>} MakeUsageList 
     * @param {Integer} UsageListLength 
     * @returns {NTSTATUS} 
     */
    static HidP_UsageListDifference(PreviousUsageList, CurrentUsageList, BreakUsageList, MakeUsageList, UsageListLength) {
        PreviousUsageListMarshal := PreviousUsageList is VarRef ? "ushort*" : "ptr"
        CurrentUsageListMarshal := CurrentUsageList is VarRef ? "ushort*" : "ptr"
        BreakUsageListMarshal := BreakUsageList is VarRef ? "ushort*" : "ptr"
        MakeUsageListMarshal := MakeUsageList is VarRef ? "ushort*" : "ptr"

        result := DllCall("HID.dll\HidP_UsageListDifference", PreviousUsageListMarshal, PreviousUsageList, CurrentUsageListMarshal, CurrentUsageList, BreakUsageListMarshal, BreakUsageList, MakeUsageListMarshal, MakeUsageList, "uint", UsageListLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} UsagePage 
     * @param {Integer} LinkCollection 
     * @param {Integer} Usage 
     * @param {Pointer<HIDP_BUTTON_ARRAY_DATA>} ButtonData 
     * @param {Pointer<Integer>} ButtonDataLength 
     * @param {PHIDP_PREPARSED_DATA} PreparsedData 
     * @param {Pointer} Report 
     * @param {Integer} ReportLength 
     * @returns {NTSTATUS} 
     */
    static HidP_GetButtonArray(ReportType, UsagePage, LinkCollection, Usage, ButtonData, ButtonDataLength, PreparsedData, Report, ReportLength) {
        ButtonDataLengthMarshal := ButtonDataLength is VarRef ? "ushort*" : "ptr"

        result := DllCall("HID.dll\HidP_GetButtonArray", "int", ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, "ptr", ButtonData, ButtonDataLengthMarshal, ButtonDataLength, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} UsagePage 
     * @param {Integer} LinkCollection 
     * @param {Integer} Usage 
     * @param {Pointer<HIDP_BUTTON_ARRAY_DATA>} ButtonData 
     * @param {Integer} ButtonDataLength 
     * @param {PHIDP_PREPARSED_DATA} PreparsedData 
     * @param {Pointer} Report 
     * @param {Integer} ReportLength 
     * @returns {NTSTATUS} 
     */
    static HidP_SetButtonArray(ReportType, UsagePage, LinkCollection, Usage, ButtonData, ButtonDataLength, PreparsedData, Report, ReportLength) {
        result := DllCall("HID.dll\HidP_SetButtonArray", "int", ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, "ptr", ButtonData, "ushort", ButtonDataLength, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ChangedUsageList 
     * @param {Integer} UsageListLength 
     * @param {Integer} KeyAction 
     * @param {Pointer<HIDP_KEYBOARD_MODIFIER_STATE>} ModifierState 
     * @param {Pointer<PHIDP_INSERT_SCANCODES>} InsertCodesProcedure 
     * @param {Pointer<Void>} InsertCodesContext 
     * @returns {NTSTATUS} 
     */
    static HidP_TranslateUsagesToI8042ScanCodes(ChangedUsageList, UsageListLength, KeyAction, ModifierState, InsertCodesProcedure, InsertCodesContext) {
        ChangedUsageListMarshal := ChangedUsageList is VarRef ? "ushort*" : "ptr"
        InsertCodesContextMarshal := InsertCodesContext is VarRef ? "ptr" : "ptr"

        result := DllCall("HID.dll\HidP_TranslateUsagesToI8042ScanCodes", ChangedUsageListMarshal, ChangedUsageList, "uint", UsageListLength, "int", KeyAction, "ptr", ModifierState, "ptr", InsertCodesProcedure, InsertCodesContextMarshal, InsertCodesContext, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} HidDeviceObject 
     * @param {Pointer<HIDD_ATTRIBUTES>} Attributes 
     * @returns {BOOLEAN} 
     */
    static HidD_GetAttributes(HidDeviceObject, Attributes) {
        HidDeviceObject := HidDeviceObject is Win32Handle ? NumGet(HidDeviceObject, "ptr") : HidDeviceObject

        result := DllCall("HID.dll\HidD_GetAttributes", "ptr", HidDeviceObject, "ptr", Attributes, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} HidGuid 
     * @returns {String} Nothing - always returns an empty string
     */
    static HidD_GetHidGuid(HidGuid) {
        DllCall("HID.dll\HidD_GetHidGuid", "ptr", HidGuid)
    }

    /**
     * 
     * @param {HANDLE} HidDeviceObject 
     * @param {Pointer<PHIDP_PREPARSED_DATA>} PreparsedData 
     * @returns {BOOLEAN} 
     */
    static HidD_GetPreparsedData(HidDeviceObject, PreparsedData) {
        HidDeviceObject := HidDeviceObject is Win32Handle ? NumGet(HidDeviceObject, "ptr") : HidDeviceObject

        result := DllCall("HID.dll\HidD_GetPreparsedData", "ptr", HidDeviceObject, "ptr", PreparsedData, "char")
        return result
    }

    /**
     * 
     * @param {PHIDP_PREPARSED_DATA} PreparsedData 
     * @returns {BOOLEAN} 
     */
    static HidD_FreePreparsedData(PreparsedData) {
        result := DllCall("HID.dll\HidD_FreePreparsedData", "ptr", PreparsedData, "char")
        return result
    }

    /**
     * 
     * @param {HANDLE} HidDeviceObject 
     * @returns {BOOLEAN} 
     */
    static HidD_FlushQueue(HidDeviceObject) {
        HidDeviceObject := HidDeviceObject is Win32Handle ? NumGet(HidDeviceObject, "ptr") : HidDeviceObject

        result := DllCall("HID.dll\HidD_FlushQueue", "ptr", HidDeviceObject, "char")
        return result
    }

    /**
     * 
     * @param {HANDLE} HidDeviceObject 
     * @param {Pointer} Configuration 
     * @param {Integer} ConfigurationLength 
     * @returns {BOOLEAN} 
     */
    static HidD_GetConfiguration(HidDeviceObject, Configuration, ConfigurationLength) {
        HidDeviceObject := HidDeviceObject is Win32Handle ? NumGet(HidDeviceObject, "ptr") : HidDeviceObject

        result := DllCall("HID.dll\HidD_GetConfiguration", "ptr", HidDeviceObject, "ptr", Configuration, "uint", ConfigurationLength, "char")
        return result
    }

    /**
     * 
     * @param {HANDLE} HidDeviceObject 
     * @param {Pointer} Configuration 
     * @param {Integer} ConfigurationLength 
     * @returns {BOOLEAN} 
     */
    static HidD_SetConfiguration(HidDeviceObject, Configuration, ConfigurationLength) {
        HidDeviceObject := HidDeviceObject is Win32Handle ? NumGet(HidDeviceObject, "ptr") : HidDeviceObject

        result := DllCall("HID.dll\HidD_SetConfiguration", "ptr", HidDeviceObject, "ptr", Configuration, "uint", ConfigurationLength, "char")
        return result
    }

    /**
     * 
     * @param {HANDLE} HidDeviceObject 
     * @param {Pointer} ReportBuffer 
     * @param {Integer} ReportBufferLength 
     * @returns {BOOLEAN} 
     */
    static HidD_GetFeature(HidDeviceObject, ReportBuffer, ReportBufferLength) {
        HidDeviceObject := HidDeviceObject is Win32Handle ? NumGet(HidDeviceObject, "ptr") : HidDeviceObject

        result := DllCall("HID.dll\HidD_GetFeature", "ptr", HidDeviceObject, "ptr", ReportBuffer, "uint", ReportBufferLength, "char")
        return result
    }

    /**
     * 
     * @param {HANDLE} HidDeviceObject 
     * @param {Pointer} ReportBuffer 
     * @param {Integer} ReportBufferLength 
     * @returns {BOOLEAN} 
     */
    static HidD_SetFeature(HidDeviceObject, ReportBuffer, ReportBufferLength) {
        HidDeviceObject := HidDeviceObject is Win32Handle ? NumGet(HidDeviceObject, "ptr") : HidDeviceObject

        result := DllCall("HID.dll\HidD_SetFeature", "ptr", HidDeviceObject, "ptr", ReportBuffer, "uint", ReportBufferLength, "char")
        return result
    }

    /**
     * 
     * @param {HANDLE} HidDeviceObject 
     * @param {Pointer} ReportBuffer 
     * @param {Integer} ReportBufferLength 
     * @returns {BOOLEAN} 
     */
    static HidD_GetInputReport(HidDeviceObject, ReportBuffer, ReportBufferLength) {
        HidDeviceObject := HidDeviceObject is Win32Handle ? NumGet(HidDeviceObject, "ptr") : HidDeviceObject

        result := DllCall("HID.dll\HidD_GetInputReport", "ptr", HidDeviceObject, "ptr", ReportBuffer, "uint", ReportBufferLength, "char")
        return result
    }

    /**
     * 
     * @param {HANDLE} HidDeviceObject 
     * @param {Pointer} ReportBuffer 
     * @param {Integer} ReportBufferLength 
     * @returns {BOOLEAN} 
     */
    static HidD_SetOutputReport(HidDeviceObject, ReportBuffer, ReportBufferLength) {
        HidDeviceObject := HidDeviceObject is Win32Handle ? NumGet(HidDeviceObject, "ptr") : HidDeviceObject

        result := DllCall("HID.dll\HidD_SetOutputReport", "ptr", HidDeviceObject, "ptr", ReportBuffer, "uint", ReportBufferLength, "char")
        return result
    }

    /**
     * 
     * @param {HANDLE} HidDeviceObject 
     * @param {Pointer<Integer>} NumberBuffers 
     * @returns {BOOLEAN} 
     */
    static HidD_GetNumInputBuffers(HidDeviceObject, NumberBuffers) {
        HidDeviceObject := HidDeviceObject is Win32Handle ? NumGet(HidDeviceObject, "ptr") : HidDeviceObject

        NumberBuffersMarshal := NumberBuffers is VarRef ? "uint*" : "ptr"

        result := DllCall("HID.dll\HidD_GetNumInputBuffers", "ptr", HidDeviceObject, NumberBuffersMarshal, NumberBuffers, "char")
        return result
    }

    /**
     * 
     * @param {HANDLE} HidDeviceObject 
     * @param {Integer} NumberBuffers 
     * @returns {BOOLEAN} 
     */
    static HidD_SetNumInputBuffers(HidDeviceObject, NumberBuffers) {
        HidDeviceObject := HidDeviceObject is Win32Handle ? NumGet(HidDeviceObject, "ptr") : HidDeviceObject

        result := DllCall("HID.dll\HidD_SetNumInputBuffers", "ptr", HidDeviceObject, "uint", NumberBuffers, "char")
        return result
    }

    /**
     * 
     * @param {HANDLE} HidDeviceObject 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferLength 
     * @returns {BOOLEAN} 
     */
    static HidD_GetPhysicalDescriptor(HidDeviceObject, Buffer, BufferLength) {
        HidDeviceObject := HidDeviceObject is Win32Handle ? NumGet(HidDeviceObject, "ptr") : HidDeviceObject

        result := DllCall("HID.dll\HidD_GetPhysicalDescriptor", "ptr", HidDeviceObject, "ptr", Buffer, "uint", BufferLength, "char")
        return result
    }

    /**
     * 
     * @param {HANDLE} HidDeviceObject 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferLength 
     * @returns {BOOLEAN} 
     */
    static HidD_GetManufacturerString(HidDeviceObject, Buffer, BufferLength) {
        HidDeviceObject := HidDeviceObject is Win32Handle ? NumGet(HidDeviceObject, "ptr") : HidDeviceObject

        result := DllCall("HID.dll\HidD_GetManufacturerString", "ptr", HidDeviceObject, "ptr", Buffer, "uint", BufferLength, "char")
        return result
    }

    /**
     * 
     * @param {HANDLE} HidDeviceObject 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferLength 
     * @returns {BOOLEAN} 
     */
    static HidD_GetProductString(HidDeviceObject, Buffer, BufferLength) {
        HidDeviceObject := HidDeviceObject is Win32Handle ? NumGet(HidDeviceObject, "ptr") : HidDeviceObject

        result := DllCall("HID.dll\HidD_GetProductString", "ptr", HidDeviceObject, "ptr", Buffer, "uint", BufferLength, "char")
        return result
    }

    /**
     * 
     * @param {HANDLE} HidDeviceObject 
     * @param {Integer} StringIndex 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferLength 
     * @returns {BOOLEAN} 
     */
    static HidD_GetIndexedString(HidDeviceObject, StringIndex, Buffer, BufferLength) {
        HidDeviceObject := HidDeviceObject is Win32Handle ? NumGet(HidDeviceObject, "ptr") : HidDeviceObject

        result := DllCall("HID.dll\HidD_GetIndexedString", "ptr", HidDeviceObject, "uint", StringIndex, "ptr", Buffer, "uint", BufferLength, "char")
        return result
    }

    /**
     * 
     * @param {HANDLE} HidDeviceObject 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferLength 
     * @returns {BOOLEAN} 
     */
    static HidD_GetSerialNumberString(HidDeviceObject, Buffer, BufferLength) {
        HidDeviceObject := HidDeviceObject is Win32Handle ? NumGet(HidDeviceObject, "ptr") : HidDeviceObject

        result := DllCall("HID.dll\HidD_GetSerialNumberString", "ptr", HidDeviceObject, "ptr", Buffer, "uint", BufferLength, "char")
        return result
    }

    /**
     * 
     * @param {HANDLE} HidDeviceObject 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferLength 
     * @returns {BOOLEAN} 
     */
    static HidD_GetMsGenreDescriptor(HidDeviceObject, Buffer, BufferLength) {
        HidDeviceObject := HidDeviceObject is Win32Handle ? NumGet(HidDeviceObject, "ptr") : HidDeviceObject

        result := DllCall("HID.dll\HidD_GetMsGenreDescriptor", "ptr", HidDeviceObject, "ptr", Buffer, "uint", BufferLength, "char")
        return result
    }

;@endregion Methods
}
