#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class msidbDialogAttributes extends Win32Enum {

    /**
     * Native name: msidbDialogAttributesVisible
     * @type {Integer (Int32)}
     */
    static Visible => 1

    /**
     * Native name: msidbDialogAttributesModal
     * @type {Integer (Int32)}
     */
    static Modal => 2

    /**
     * Native name: msidbDialogAttributesMinimize
     * @type {Integer (Int32)}
     */
    static Minimize => 4

    /**
     * Native name: msidbDialogAttributesSysModal
     * @type {Integer (Int32)}
     */
    static SysModal => 8

    /**
     * Native name: msidbDialogAttributesKeepModeless
     * @type {Integer (Int32)}
     */
    static KeepModeless => 16

    /**
     * Native name: msidbDialogAttributesTrackDiskSpace
     * @type {Integer (Int32)}
     */
    static TrackDiskSpace => 32

    /**
     * Native name: msidbDialogAttributesUseCustomPalette
     * @type {Integer (Int32)}
     */
    static UseCustomPalette => 64

    /**
     * Native name: msidbDialogAttributesRTLRO
     * @type {Integer (Int32)}
     */
    static AttributesRTLRO => 128

    /**
     * Native name: msidbDialogAttributesRightAligned
     * @type {Integer (Int32)}
     */
    static RightAligned => 256

    /**
     * Native name: msidbDialogAttributesLeftScroll
     * @type {Integer (Int32)}
     */
    static LeftScroll => 512

    /**
     * Native name: msidbDialogAttributesBiDi
     * @type {Integer (Int32)}
     */
    static BiDi => 896

    /**
     * Native name: msidbDialogAttributesError
     * @type {Integer (Int32)}
     */
    static Error => 65536
}
