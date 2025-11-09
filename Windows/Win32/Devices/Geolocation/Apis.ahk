#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class Geolocation {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_DRIVER_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_DRIVER_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_DRIVER_VERSION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_DRIVER_VERSION_4 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_DRIVER_VERSION_5 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_DRIVER_VERSION_6 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_SEND_PLATFORM_CAPABILITY => 2228228

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_GET_DEVICE_CAPABILITY => 2228232

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_SEND_DRIVERCOMMAND => 2228236

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_START_FIXSESSION => 2228288

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_MODIFY_FIXSESSION => 2228292

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_STOP_FIXSESSION => 2228296

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_GET_FIXDATA => 2228300

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_INJECT_AGNSS => 2228352

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_LISTEN_AGNSS => 2228416

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_LISTEN_ERROR => 2228420

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_LISTEN_NI => 2228480

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_SET_SUPL_HSLP => 2228484

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_CONFIG_SUPL_CERT => 2228488

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_RESPOND_NI => 2228492

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_EXECUTE_CWTEST => 2228496

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_EXECUTE_SELFTEST => 2228500

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_GET_CHIPSETINFO => 2228504

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_LISTEN_NMEA => 2228508

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_SET_V2UPL_CONFIG => 2228512

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_CREATE_GEOFENCE => 2228544

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_DELETE_GEOFENCE => 2228548

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_LISTEN_GEOFENCE_ALERT => 2228552

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_LISTEN_GEOFENCES_TRACKINGSTATUS => 2228556

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_LISTEN_DRIVER_REQUEST => 2228608

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_START_BREADCRUMBING => 2228672

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_STOP_BREADCRUMBING => 2228676

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_LISTEN_BREADCRUMBING_ALERT => 2228680

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GNSS_POP_BREADCRUMBS => 2228684

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_AGNSSFORMAT_XTRA1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_AGNSSFORMAT_XTRA2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_AGNSSFORMAT_LTO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_AGNSSFORMAT_XTRA3 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_AGNSSFORMAT_XTRA3_1 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_AGNSSFORMAT_XTRA3_2 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_AGNSSFORMAT_XTRA_INT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_SERVER_URL_NAME => 260

    /**
     * @type {Integer (UInt32)}
     */
    static MIN_GEOFENCES_REQUIRED => 100

    /**
     * @type {Integer (UInt32)}
     */
    static BREADCRUMBING_UNSUPPORTED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BREADCRUMBING_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MIN_BREADCRUMBS_SUPPORTED => 120

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_SATELLITE_ANY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_SATELLITE_GPS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_SATELLITE_GLONASS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_SATELLITE_BEIDOU => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_SATELLITE_GALILEO => 8

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_OPERMODE_ANY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_OPERMODE_MSA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_OPERMODE_MSB => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_OPERMODE_MSS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_OPERMODE_CELLID => 8

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_OPERMODE_AFLT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_OPERMODE_OTDOA => 32

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_NMEALOGGING_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_NMEALOGGING_ALL => 255

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_FIXDETAIL_BASIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_FIXDETAIL_ACCURACY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_FIXDETAIL_SATELLITE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_MAXSATELLITE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_GEOFENCESUPPORT_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GNSS_GEOFENCESUPPORT_CIRCLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LOCATION_API_VERSION => 1

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_GNSS => Guid("{3336e5e4-018a-4669-84c5-bd05f3bd368b}")
;@endregion Constants

;@region Methods
;@endregion Methods
}
