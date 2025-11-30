#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class msidbControlAttributes extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesVisible => 1

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesEnabled => 2

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesSunken => 4

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesIndirect => 8

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesInteger => 16

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesRTLRO => 32

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesRightAligned => 64

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesLeftScroll => 128

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesBiDi => 224

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesTransparent => 65536

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesNoPrefix => 131072

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesNoWrap => 262144

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesFormatSize => 524288

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesUsersLanguage => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesMultiline => 65536

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesPasswordInput => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesProgress95 => 65536

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesRemovableVolume => 65536

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesFixedVolume => 131072

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesRemoteVolume => 262144

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesCDROMVolume => 524288

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesRAMDiskVolume => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesFloppyVolume => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlShowRollbackCost => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesSorted => 65536

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesComboList => 131072

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesImageHandle => 65536

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesPushLike => 131072

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesBitmap => 262144

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesIcon => 524288

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesFixedSize => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesIconSize16 => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesIconSize32 => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesIconSize48 => 6291456

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesElevationShield => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static msidbControlAttributesHasBorder => 16777216
}
