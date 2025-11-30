#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class msidbDialogAttributes extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static msidbDialogAttributesVisible => 1

    /**
     * @type {Integer (Int32)}
     */
    static msidbDialogAttributesModal => 2

    /**
     * @type {Integer (Int32)}
     */
    static msidbDialogAttributesMinimize => 4

    /**
     * @type {Integer (Int32)}
     */
    static msidbDialogAttributesSysModal => 8

    /**
     * @type {Integer (Int32)}
     */
    static msidbDialogAttributesKeepModeless => 16

    /**
     * @type {Integer (Int32)}
     */
    static msidbDialogAttributesTrackDiskSpace => 32

    /**
     * @type {Integer (Int32)}
     */
    static msidbDialogAttributesUseCustomPalette => 64

    /**
     * @type {Integer (Int32)}
     */
    static msidbDialogAttributesRTLRO => 128

    /**
     * @type {Integer (Int32)}
     */
    static msidbDialogAttributesRightAligned => 256

    /**
     * @type {Integer (Int32)}
     */
    static msidbDialogAttributesLeftScroll => 512

    /**
     * @type {Integer (Int32)}
     */
    static msidbDialogAttributesBiDi => 896

    /**
     * @type {Integer (Int32)}
     */
    static msidbDialogAttributesError => 65536
}
