#Requires AutoHotkey v2.0.0 64-bit

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
    static HID_USAGE_PAGE_GENERIC => 1

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_SIMULATION => 2

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_VR => 3

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_SPORT => 4

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_GAME => 5

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_GENERIC_DEVICE => 6

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
    static HID_USAGE_PAGE_BUTTON => 9

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_ORDINAL => 10

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_TELEPHONY => 11

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
    static HID_USAGE_PAGE_HAPTICS => 14

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_PID => 15

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_UNICODE => 16

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_ALPHANUMERIC => 20

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_SENSOR => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_LIGHTING_ILLUMINATION => 89

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_BARCODE_SCANNER => 140

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_WEIGHING_DEVICE => 141

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_MAGNETIC_STRIPE_READER => 142

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_CAMERA_CONTROL => 144

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_ARCADE => 145

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_PAGE_MICROSOFT_BLUETOOTH_HANDSFREE => 65523

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
    static HID_USAGE_GENERIC_PORTABLE_DEVICE_CONTROL => 13

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_INTERACTIVE_CONTROL => 14

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_COUNTED_BUFFER => 58

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GENERIC_SYSTEM_CTL => 128

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
    static HID_USAGE_SIMULATION_ACCELLERATOR => 196

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
    static HID_USAGE_SPORT_STICK_TYPE => 56

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
    static HID_USAGE_GAME_POINT_OF_VIEW => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_GAME_GUN_SELECTOR => 50

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
    static HID_USAGE_KEYBOARD_zZ => 29

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_ONE => 30

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_ZERO => 39

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
    static HID_USAGE_KEYBOARD_SCROLL_LOCK => 71

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_NUM_LOCK => 83

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
    static HID_USAGE_KEYBOARD_PRINT_SCREEN => 70

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_DELETE_FORWARD => 76

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_1_AND_END => 89

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_KEYBOARD_KEYPAD_0_AND_INSERT => 98

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
    static HID_USAGE_TELEPHONY_LINE => 42

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_RING_ENABLE => 45

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_SEND => 49

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_KEYPAD_0 => 176

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_KEYPAD_D => 191

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_TELEPHONY_HOST_AVAILABLE => 241

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMERCTRL => 1

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
    static HID_USAGE_CONSUMER_PLAY_PAUSE => 205

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
    static HID_USAGE_CONSUMER_AL_CONFIGURATION => 387

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_EMAIL => 394

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_CALCULATOR => 402

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_BROWSER => 404

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CONSUMER_AL_SEARCH => 454

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
    static HID_USAGE_CONSUMER_AC_PAN => 568

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
    static HID_USAGE_DIGITIZER_TABLET_FUNC_KEYS => 57

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_DIGITIZER_PROG_CHANGE_KEYS => 58

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
    static HID_USAGE_DIGITIZER_TRANSDUCER_SERIAL => 91

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
    static HID_USAGE_DIGITIZER_TRANSDUCER_SERIAL_PART2 => 110

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
    static HID_USAGE_DIGITIZER_TRANSDUCER_CONNECTED => 162

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
    static HID_USAGE_HAPTICS_WAVEFORM_BEGIN => 4096

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_WAVEFORM_STOP => 4097

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_WAVEFORM_NULL => 4098

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
    static HID_USAGE_HAPTICS_WAVEFORM_END => 8191

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_WAVEFORM_VENDOR_BEGIN => 8192

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_HAPTICS_WAVEFORM_VENDOR_END => 12287

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
    static HID_USAGE_ALPHANUMERIC_DISPLAY_CONTROL_REPORT => 36

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_CHARACTER_REPORT => 43

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_DISPLAY_STATUS => 45

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_CURSOR_POSITION_REPORT => 50

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
    static HID_USAGE_ALPHANUMERIC_CHARACTER_ATTRIBUTE => 72

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_PALETTE_REPORT => 133

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
    static HID_USAGE_ALPHANUMERIC_BLIT_DATA => 143

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_SOFT_BUTTON => 144

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
    static HID_USAGE_ALPHANUMERIC_DISPLAY_DATA => 44

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
    static HID_USAGE_ALPHANUMERIC_BIT_DEPTH_FORMAT => 131

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_ALPHANUMERIC_DISPLAY_ORIENTATION => 132

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
    static HID_USAGE_CAMERA_AUTO_FOCUS => 32

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_CAMERA_SHUTTER => 33

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MS_BTH_HF_DIALNUMBER => 33

    /**
     * @type {Integer (UInt16)}
     */
    static HID_USAGE_MS_BTH_HF_DIALMEMORY => 34

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
     * @param {Pointer<HINSTANCE>} hinst 
     * @param {Integer} dwVersion 
     * @param {Pointer<Guid>} riidltf 
     * @param {Pointer<Void>} ppvOut 
     * @param {Pointer<IUnknown>} punkOuter 
     * @returns {Integer} 
     */
    static DirectInput8Create(hinst, dwVersion, riidltf, ppvOut, punkOuter) {
        result := DllCall("DINPUT8.dll\DirectInput8Create", "ptr", hinst, "uint", dwVersion, "ptr", riidltf, "ptr", ppvOut, "ptr", punkOuter, "int")
        return result
    }

    /**
     * The joyConfigChanged function informs the joystick driver that the configuration has changed and should be reloaded from the registry.
     * @remarks
     * This function causes a window message to be sent to all top-level windows. This message may be defined by applications that need to respond to changes in joystick calibration by using <b>RegisterWindowMessage</b> with the following message ID:
     * 
     * 
     * ```cpp
     * @param {Integer} dwFlags Reserved for future use. Must equal zero.
     * @returns {Integer} Returns JOYERR_NOERROR if successful. Returns JOYERR_PARMS if the parameter is non-zero.
     * @see https://learn.microsoft.com/windows/win32/api/joystickapi/nf-joystickapi-joyconfigchanged
     * @since windows5.0
     */
    static joyConfigChanged(dwFlags) {
        result := DllCall("WINMM.dll\joyConfigChanged", "uint", dwFlags, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer} PreparsedData 
     * @param {Pointer<HIDP_CAPS>} Capabilities 
     * @returns {Integer} 
     */
    static HidP_GetCaps(PreparsedData, Capabilities) {
        result := DllCall("HID.dll\HidP_GetCaps", "ptr", PreparsedData, "ptr", Capabilities, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HIDP_LINK_COLLECTION_NODE>} LinkCollectionNodes 
     * @param {Pointer<UInt32>} LinkCollectionNodesLength 
     * @param {Pointer} PreparsedData 
     * @returns {Integer} 
     */
    static HidP_GetLinkCollectionNodes(LinkCollectionNodes, LinkCollectionNodesLength, PreparsedData) {
        result := DllCall("HID.dll\HidP_GetLinkCollectionNodes", "ptr", LinkCollectionNodes, "ptr", LinkCollectionNodesLength, "ptr", PreparsedData, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} UsagePage 
     * @param {Integer} LinkCollection 
     * @param {Integer} Usage 
     * @param {Pointer<HIDP_BUTTON_CAPS>} ButtonCaps 
     * @param {Pointer<UInt16>} ButtonCapsLength 
     * @param {Pointer} PreparsedData 
     * @returns {Integer} 
     */
    static HidP_GetSpecificButtonCaps(ReportType, UsagePage, LinkCollection, Usage, ButtonCaps, ButtonCapsLength, PreparsedData) {
        result := DllCall("HID.dll\HidP_GetSpecificButtonCaps", "int", ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, "ptr", ButtonCaps, "ptr", ButtonCapsLength, "ptr", PreparsedData, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Pointer<HIDP_BUTTON_CAPS>} ButtonCaps 
     * @param {Pointer<UInt16>} ButtonCapsLength 
     * @param {Pointer} PreparsedData 
     * @returns {Integer} 
     */
    static HidP_GetButtonCaps(ReportType, ButtonCaps, ButtonCapsLength, PreparsedData) {
        result := DllCall("HID.dll\HidP_GetButtonCaps", "int", ReportType, "ptr", ButtonCaps, "ptr", ButtonCapsLength, "ptr", PreparsedData, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} UsagePage 
     * @param {Integer} LinkCollection 
     * @param {Integer} Usage 
     * @param {Pointer<HIDP_VALUE_CAPS>} ValueCaps 
     * @param {Pointer<UInt16>} ValueCapsLength 
     * @param {Pointer} PreparsedData 
     * @returns {Integer} 
     */
    static HidP_GetSpecificValueCaps(ReportType, UsagePage, LinkCollection, Usage, ValueCaps, ValueCapsLength, PreparsedData) {
        result := DllCall("HID.dll\HidP_GetSpecificValueCaps", "int", ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, "ptr", ValueCaps, "ptr", ValueCapsLength, "ptr", PreparsedData, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Pointer<HIDP_VALUE_CAPS>} ValueCaps 
     * @param {Pointer<UInt16>} ValueCapsLength 
     * @param {Pointer} PreparsedData 
     * @returns {Integer} 
     */
    static HidP_GetValueCaps(ReportType, ValueCaps, ValueCapsLength, PreparsedData) {
        result := DllCall("HID.dll\HidP_GetValueCaps", "int", ReportType, "ptr", ValueCaps, "ptr", ValueCapsLength, "ptr", PreparsedData, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} DataIndex 
     * @param {Pointer} PreparsedData 
     * @param {Pointer<HIDP_EXTENDED_ATTRIBUTES>} Attributes 
     * @param {Pointer<UInt32>} LengthAttributes 
     * @returns {Integer} 
     */
    static HidP_GetExtendedAttributes(ReportType, DataIndex, PreparsedData, Attributes, LengthAttributes) {
        result := DllCall("HID.dll\HidP_GetExtendedAttributes", "int", ReportType, "ushort", DataIndex, "ptr", PreparsedData, "ptr", Attributes, "ptr", LengthAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} ReportID 
     * @param {Pointer} PreparsedData 
     * @param {Pointer<PSTR>} Report 
     * @param {Integer} ReportLength 
     * @returns {Integer} 
     */
    static HidP_InitializeReportForID(ReportType, ReportID, PreparsedData, Report, ReportLength) {
        result := DllCall("HID.dll\HidP_InitializeReportForID", "int", ReportType, "char", ReportID, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Pointer<HIDP_DATA>} DataList 
     * @param {Pointer<UInt32>} DataLength 
     * @param {Pointer} PreparsedData 
     * @param {Pointer<PSTR>} Report 
     * @param {Integer} ReportLength 
     * @returns {Integer} 
     */
    static HidP_SetData(ReportType, DataList, DataLength, PreparsedData, Report, ReportLength) {
        result := DllCall("HID.dll\HidP_SetData", "int", ReportType, "ptr", DataList, "ptr", DataLength, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Pointer<HIDP_DATA>} DataList 
     * @param {Pointer<UInt32>} DataLength 
     * @param {Pointer} PreparsedData 
     * @param {Pointer<PSTR>} Report 
     * @param {Integer} ReportLength 
     * @returns {Integer} 
     */
    static HidP_GetData(ReportType, DataList, DataLength, PreparsedData, Report, ReportLength) {
        result := DllCall("HID.dll\HidP_GetData", "int", ReportType, "ptr", DataList, "ptr", DataLength, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Pointer} PreparsedData 
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
     * @param {Pointer<UInt16>} UsageList 
     * @param {Pointer<UInt32>} UsageLength 
     * @param {Pointer} PreparsedData 
     * @param {Pointer<PSTR>} Report 
     * @param {Integer} ReportLength 
     * @returns {Integer} 
     */
    static HidP_SetUsages(ReportType, UsagePage, LinkCollection, UsageList, UsageLength, PreparsedData, Report, ReportLength) {
        result := DllCall("HID.dll\HidP_SetUsages", "int", ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ptr", UsageList, "ptr", UsageLength, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} UsagePage 
     * @param {Integer} LinkCollection 
     * @param {Pointer<UInt16>} UsageList 
     * @param {Pointer<UInt32>} UsageLength 
     * @param {Pointer} PreparsedData 
     * @param {Pointer<PSTR>} Report 
     * @param {Integer} ReportLength 
     * @returns {Integer} 
     */
    static HidP_UnsetUsages(ReportType, UsagePage, LinkCollection, UsageList, UsageLength, PreparsedData, Report, ReportLength) {
        result := DllCall("HID.dll\HidP_UnsetUsages", "int", ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ptr", UsageList, "ptr", UsageLength, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} UsagePage 
     * @param {Integer} LinkCollection 
     * @param {Pointer<UInt16>} UsageList 
     * @param {Pointer<UInt32>} UsageLength 
     * @param {Pointer} PreparsedData 
     * @param {Pointer<PSTR>} Report 
     * @param {Integer} ReportLength 
     * @returns {Integer} 
     */
    static HidP_GetUsages(ReportType, UsagePage, LinkCollection, UsageList, UsageLength, PreparsedData, Report, ReportLength) {
        result := DllCall("HID.dll\HidP_GetUsages", "int", ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ptr", UsageList, "ptr", UsageLength, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} LinkCollection 
     * @param {Pointer<USAGE_AND_PAGE>} ButtonList 
     * @param {Pointer<UInt32>} UsageLength 
     * @param {Pointer} PreparsedData 
     * @param {Pointer<PSTR>} Report 
     * @param {Integer} ReportLength 
     * @returns {Integer} 
     */
    static HidP_GetUsagesEx(ReportType, LinkCollection, ButtonList, UsageLength, PreparsedData, Report, ReportLength) {
        result := DllCall("HID.dll\HidP_GetUsagesEx", "int", ReportType, "ushort", LinkCollection, "ptr", ButtonList, "ptr", UsageLength, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} UsagePage 
     * @param {Pointer} PreparsedData 
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
     * @param {Pointer} PreparsedData 
     * @param {Pointer<PSTR>} Report 
     * @param {Integer} ReportLength 
     * @returns {Integer} 
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
     * @param {Pointer} PreparsedData 
     * @param {Pointer<PSTR>} Report 
     * @param {Integer} ReportLength 
     * @returns {Integer} 
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
     * @param {Pointer<PSTR>} UsageValue 
     * @param {Integer} UsageValueByteLength 
     * @param {Pointer} PreparsedData 
     * @param {Pointer<PSTR>} Report 
     * @param {Integer} ReportLength 
     * @returns {Integer} 
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
     * @param {Pointer<UInt32>} UsageValue 
     * @param {Pointer} PreparsedData 
     * @param {Pointer<PSTR>} Report 
     * @param {Integer} ReportLength 
     * @returns {Integer} 
     */
    static HidP_GetUsageValue(ReportType, UsagePage, LinkCollection, Usage, UsageValue, PreparsedData, Report, ReportLength) {
        result := DllCall("HID.dll\HidP_GetUsageValue", "int", ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, "ptr", UsageValue, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} UsagePage 
     * @param {Integer} LinkCollection 
     * @param {Integer} Usage 
     * @param {Pointer<Int32>} UsageValue 
     * @param {Pointer} PreparsedData 
     * @param {Pointer<PSTR>} Report 
     * @param {Integer} ReportLength 
     * @returns {Integer} 
     */
    static HidP_GetScaledUsageValue(ReportType, UsagePage, LinkCollection, Usage, UsageValue, PreparsedData, Report, ReportLength) {
        result := DllCall("HID.dll\HidP_GetScaledUsageValue", "int", ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, "ptr", UsageValue, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} UsagePage 
     * @param {Integer} LinkCollection 
     * @param {Integer} Usage 
     * @param {Pointer<PSTR>} UsageValue 
     * @param {Integer} UsageValueByteLength 
     * @param {Pointer} PreparsedData 
     * @param {Pointer<PSTR>} Report 
     * @param {Integer} ReportLength 
     * @returns {Integer} 
     */
    static HidP_GetUsageValueArray(ReportType, UsagePage, LinkCollection, Usage, UsageValue, UsageValueByteLength, PreparsedData, Report, ReportLength) {
        result := DllCall("HID.dll\HidP_GetUsageValueArray", "int", ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, "ptr", UsageValue, "ushort", UsageValueByteLength, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} PreviousUsageList 
     * @param {Pointer<UInt16>} CurrentUsageList 
     * @param {Pointer<UInt16>} BreakUsageList 
     * @param {Pointer<UInt16>} MakeUsageList 
     * @param {Integer} UsageListLength 
     * @returns {Integer} 
     */
    static HidP_UsageListDifference(PreviousUsageList, CurrentUsageList, BreakUsageList, MakeUsageList, UsageListLength) {
        result := DllCall("HID.dll\HidP_UsageListDifference", "ptr", PreviousUsageList, "ptr", CurrentUsageList, "ptr", BreakUsageList, "ptr", MakeUsageList, "uint", UsageListLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReportType 
     * @param {Integer} UsagePage 
     * @param {Integer} LinkCollection 
     * @param {Integer} Usage 
     * @param {Pointer<HIDP_BUTTON_ARRAY_DATA>} ButtonData 
     * @param {Pointer<UInt16>} ButtonDataLength 
     * @param {Pointer} PreparsedData 
     * @param {Pointer<PSTR>} Report 
     * @param {Integer} ReportLength 
     * @returns {Integer} 
     */
    static HidP_GetButtonArray(ReportType, UsagePage, LinkCollection, Usage, ButtonData, ButtonDataLength, PreparsedData, Report, ReportLength) {
        result := DllCall("HID.dll\HidP_GetButtonArray", "int", ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, "ptr", ButtonData, "ptr", ButtonDataLength, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
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
     * @param {Pointer} PreparsedData 
     * @param {Pointer<PSTR>} Report 
     * @param {Integer} ReportLength 
     * @returns {Integer} 
     */
    static HidP_SetButtonArray(ReportType, UsagePage, LinkCollection, Usage, ButtonData, ButtonDataLength, PreparsedData, Report, ReportLength) {
        result := DllCall("HID.dll\HidP_SetButtonArray", "int", ReportType, "ushort", UsagePage, "ushort", LinkCollection, "ushort", Usage, "ptr", ButtonData, "ushort", ButtonDataLength, "ptr", PreparsedData, "ptr", Report, "uint", ReportLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} ChangedUsageList 
     * @param {Integer} UsageListLength 
     * @param {Integer} KeyAction 
     * @param {Pointer<HIDP_KEYBOARD_MODIFIER_STATE>} ModifierState 
     * @param {Pointer<PHIDP_INSERT_SCANCODES>} InsertCodesProcedure 
     * @param {Pointer<Void>} InsertCodesContext 
     * @returns {Integer} 
     */
    static HidP_TranslateUsagesToI8042ScanCodes(ChangedUsageList, UsageListLength, KeyAction, ModifierState, InsertCodesProcedure, InsertCodesContext) {
        result := DllCall("HID.dll\HidP_TranslateUsagesToI8042ScanCodes", "ptr", ChangedUsageList, "uint", UsageListLength, "int", KeyAction, "ptr", ModifierState, "ptr", InsertCodesProcedure, "ptr", InsertCodesContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} HidDeviceObject 
     * @param {Pointer<HIDD_ATTRIBUTES>} Attributes 
     * @returns {Integer} 
     */
    static HidD_GetAttributes(HidDeviceObject, Attributes) {
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
     * @param {Pointer<HANDLE>} HidDeviceObject 
     * @param {Pointer<IntPtr>} PreparsedData 
     * @returns {Integer} 
     */
    static HidD_GetPreparsedData(HidDeviceObject, PreparsedData) {
        result := DllCall("HID.dll\HidD_GetPreparsedData", "ptr", HidDeviceObject, "ptr", PreparsedData, "char")
        return result
    }

    /**
     * 
     * @param {Pointer} PreparsedData 
     * @returns {Integer} 
     */
    static HidD_FreePreparsedData(PreparsedData) {
        result := DllCall("HID.dll\HidD_FreePreparsedData", "ptr", PreparsedData, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} HidDeviceObject 
     * @returns {Integer} 
     */
    static HidD_FlushQueue(HidDeviceObject) {
        result := DllCall("HID.dll\HidD_FlushQueue", "ptr", HidDeviceObject, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} HidDeviceObject 
     * @param {Pointer<HIDD_CONFIGURATION>} Configuration 
     * @param {Integer} ConfigurationLength 
     * @returns {Integer} 
     */
    static HidD_GetConfiguration(HidDeviceObject, Configuration, ConfigurationLength) {
        result := DllCall("HID.dll\HidD_GetConfiguration", "ptr", HidDeviceObject, "ptr", Configuration, "uint", ConfigurationLength, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} HidDeviceObject 
     * @param {Pointer<HIDD_CONFIGURATION>} Configuration 
     * @param {Integer} ConfigurationLength 
     * @returns {Integer} 
     */
    static HidD_SetConfiguration(HidDeviceObject, Configuration, ConfigurationLength) {
        result := DllCall("HID.dll\HidD_SetConfiguration", "ptr", HidDeviceObject, "ptr", Configuration, "uint", ConfigurationLength, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} HidDeviceObject 
     * @param {Pointer<Void>} ReportBuffer 
     * @param {Integer} ReportBufferLength 
     * @returns {Integer} 
     */
    static HidD_GetFeature(HidDeviceObject, ReportBuffer, ReportBufferLength) {
        result := DllCall("HID.dll\HidD_GetFeature", "ptr", HidDeviceObject, "ptr", ReportBuffer, "uint", ReportBufferLength, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} HidDeviceObject 
     * @param {Pointer<Void>} ReportBuffer 
     * @param {Integer} ReportBufferLength 
     * @returns {Integer} 
     */
    static HidD_SetFeature(HidDeviceObject, ReportBuffer, ReportBufferLength) {
        result := DllCall("HID.dll\HidD_SetFeature", "ptr", HidDeviceObject, "ptr", ReportBuffer, "uint", ReportBufferLength, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} HidDeviceObject 
     * @param {Pointer<Void>} ReportBuffer 
     * @param {Integer} ReportBufferLength 
     * @returns {Integer} 
     */
    static HidD_GetInputReport(HidDeviceObject, ReportBuffer, ReportBufferLength) {
        result := DllCall("HID.dll\HidD_GetInputReport", "ptr", HidDeviceObject, "ptr", ReportBuffer, "uint", ReportBufferLength, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} HidDeviceObject 
     * @param {Pointer<Void>} ReportBuffer 
     * @param {Integer} ReportBufferLength 
     * @returns {Integer} 
     */
    static HidD_SetOutputReport(HidDeviceObject, ReportBuffer, ReportBufferLength) {
        result := DllCall("HID.dll\HidD_SetOutputReport", "ptr", HidDeviceObject, "ptr", ReportBuffer, "uint", ReportBufferLength, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} HidDeviceObject 
     * @param {Pointer<UInt32>} NumberBuffers 
     * @returns {Integer} 
     */
    static HidD_GetNumInputBuffers(HidDeviceObject, NumberBuffers) {
        result := DllCall("HID.dll\HidD_GetNumInputBuffers", "ptr", HidDeviceObject, "ptr", NumberBuffers, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} HidDeviceObject 
     * @param {Integer} NumberBuffers 
     * @returns {Integer} 
     */
    static HidD_SetNumInputBuffers(HidDeviceObject, NumberBuffers) {
        result := DllCall("HID.dll\HidD_SetNumInputBuffers", "ptr", HidDeviceObject, "uint", NumberBuffers, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} HidDeviceObject 
     * @param {Pointer<Void>} Buffer 
     * @param {Integer} BufferLength 
     * @returns {Integer} 
     */
    static HidD_GetPhysicalDescriptor(HidDeviceObject, Buffer, BufferLength) {
        result := DllCall("HID.dll\HidD_GetPhysicalDescriptor", "ptr", HidDeviceObject, "ptr", Buffer, "uint", BufferLength, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} HidDeviceObject 
     * @param {Pointer<Void>} Buffer 
     * @param {Integer} BufferLength 
     * @returns {Integer} 
     */
    static HidD_GetManufacturerString(HidDeviceObject, Buffer, BufferLength) {
        result := DllCall("HID.dll\HidD_GetManufacturerString", "ptr", HidDeviceObject, "ptr", Buffer, "uint", BufferLength, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} HidDeviceObject 
     * @param {Pointer<Void>} Buffer 
     * @param {Integer} BufferLength 
     * @returns {Integer} 
     */
    static HidD_GetProductString(HidDeviceObject, Buffer, BufferLength) {
        result := DllCall("HID.dll\HidD_GetProductString", "ptr", HidDeviceObject, "ptr", Buffer, "uint", BufferLength, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} HidDeviceObject 
     * @param {Integer} StringIndex 
     * @param {Pointer<Void>} Buffer 
     * @param {Integer} BufferLength 
     * @returns {Integer} 
     */
    static HidD_GetIndexedString(HidDeviceObject, StringIndex, Buffer, BufferLength) {
        result := DllCall("HID.dll\HidD_GetIndexedString", "ptr", HidDeviceObject, "uint", StringIndex, "ptr", Buffer, "uint", BufferLength, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} HidDeviceObject 
     * @param {Pointer<Void>} Buffer 
     * @param {Integer} BufferLength 
     * @returns {Integer} 
     */
    static HidD_GetSerialNumberString(HidDeviceObject, Buffer, BufferLength) {
        result := DllCall("HID.dll\HidD_GetSerialNumberString", "ptr", HidDeviceObject, "ptr", Buffer, "uint", BufferLength, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} HidDeviceObject 
     * @param {Pointer<Void>} Buffer 
     * @param {Integer} BufferLength 
     * @returns {Integer} 
     */
    static HidD_GetMsGenreDescriptor(HidDeviceObject, Buffer, BufferLength) {
        result := DllCall("HID.dll\HidD_GetMsGenreDescriptor", "ptr", HidDeviceObject, "ptr", Buffer, "uint", BufferLength, "char")
        return result
    }

;@endregion Methods
}
