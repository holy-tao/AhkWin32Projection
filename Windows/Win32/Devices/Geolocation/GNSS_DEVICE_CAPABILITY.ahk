#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GNSS_SUPL_VERSION.ahk" { GNSS_SUPL_VERSION }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_DEVICE_CAPABILITY {
    #StructPack 4

    Size : UInt32

    Version : UInt32

    SupportMultipleFixSessions : BOOL

    SupportMultipleAppSessions : BOOL

    RequireAGnssInjection : BOOL

    AgnssFormatSupported : UInt32

    AgnssFormatPreferred : UInt32

    SupportDistanceTracking : BOOL

    SupportContinuousTracking : BOOL

    Reserved1 : UInt32

    Reserved2 : BOOL

    Reserved3 : BOOL

    Reserved4 : BOOL

    Reserved5 : BOOL

    GeofencingSupport : UInt32

    Reserved6 : BOOL

    Reserved7 : BOOL

    SupportCpLocation : BOOL

    SupportUplV2 : BOOL

    SupportSuplV1 : BOOL

    SupportSuplV2 : BOOL

    SupportedSuplVersion : GNSS_SUPL_VERSION

    MaxGeofencesSupported : UInt32

    SupportMultipleSuplRootCert : BOOL

    GnssBreadCrumbPayloadVersion : UInt32

    MaxGnssBreadCrumbFixes : UInt32

    Unused : Int8[496]

}
