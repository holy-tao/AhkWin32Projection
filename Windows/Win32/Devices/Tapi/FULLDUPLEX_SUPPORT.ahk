#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The FULLDUPLEX_SUPPORT enum is used by applications interacting with legacy TSPs to indicate whether a specified terminal supports full duplex operations. This enum is returned by the ITLegacyWaveSupport::IsFullDuplex method.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-fullduplex_support
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class FULLDUPLEX_SUPPORT extends Win32Enum{

    /**
     * Full duplex supported.
     * @type {Integer (Int32)}
     */
    static FDS_SUPPORTED => 0

    /**
     * Full duplex not supported.
     * @type {Integer (Int32)}
     */
    static FDS_NOTSUPPORTED => 1

    /**
     * The TSP cannot determine whether the device is full duplex.
     * @type {Integer (Int32)}
     */
    static FDS_UNKNOWN => 2
}
