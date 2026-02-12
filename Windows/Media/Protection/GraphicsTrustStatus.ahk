#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the status of graphics trusted output.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.graphicstruststatus
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class GraphicsTrustStatus extends Win32Enum{

    /**
     * Trusted output is not required.
     * @type {Integer (Int32)}
     */
    static TrustNotRequired => 0

    /**
     * Trust output has been established.
     * @type {Integer (Int32)}
     */
    static TrustEstablished => 1

    /**
     * The environment is not supported for trusted output.
     * @type {Integer (Int32)}
     */
    static EnvironmentNotSupported => 2

    /**
     * Driver not supported for trusted output.
     * @type {Integer (Int32)}
     */
    static DriverNotSupported => 3

    /**
     * Driver signing failed for trusted output.
     * @type {Integer (Int32)}
     */
    static DriverSigningFailure => 4

    /**
     * Unspecified error occurred.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 5
}
