#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class msidbControlAttributes extends Win32Enum {

    /**
     * Native name: msidbControlAttributesVisible
     * @type {Integer (Int32)}
     */
    static Visible => 1

    /**
     * Native name: msidbControlAttributesEnabled
     * @type {Integer (Int32)}
     */
    static Enabled => 2

    /**
     * Native name: msidbControlAttributesSunken
     * @type {Integer (Int32)}
     */
    static Sunken => 4

    /**
     * Native name: msidbControlAttributesIndirect
     * @type {Integer (Int32)}
     */
    static Indirect => 8

    /**
     * Native name: msidbControlAttributesInteger
     * @type {Integer (Int32)}
     */
    static Integer => 16

    /**
     * Native name: msidbControlAttributesRTLRO
     * @type {Integer (Int32)}
     */
    static AttributesRTLRO => 32

    /**
     * Native name: msidbControlAttributesRightAligned
     * @type {Integer (Int32)}
     */
    static RightAligned => 64

    /**
     * Native name: msidbControlAttributesLeftScroll
     * @type {Integer (Int32)}
     */
    static LeftScroll => 128

    /**
     * Native name: msidbControlAttributesBiDi
     * @type {Integer (Int32)}
     */
    static BiDi => 224

    /**
     * Native name: msidbControlAttributesTransparent
     * @type {Integer (Int32)}
     */
    static Transparent => 65536

    /**
     * Native name: msidbControlAttributesNoPrefix
     * @type {Integer (Int32)}
     */
    static NoPrefix => 131072

    /**
     * Native name: msidbControlAttributesNoWrap
     * @type {Integer (Int32)}
     */
    static NoWrap => 262144

    /**
     * Native name: msidbControlAttributesFormatSize
     * @type {Integer (Int32)}
     */
    static FormatSize => 524288

    /**
     * Native name: msidbControlAttributesUsersLanguage
     * @type {Integer (Int32)}
     */
    static UsersLanguage => 1048576

    /**
     * Native name: msidbControlAttributesMultiline
     * @type {Integer (Int32)}
     */
    static Multiline => 65536

    /**
     * Native name: msidbControlAttributesPasswordInput
     * @type {Integer (Int32)}
     */
    static PasswordInput => 2097152

    /**
     * Native name: msidbControlAttributesProgress95
     * @type {Integer (Int32)}
     */
    static Progress95 => 65536

    /**
     * Native name: msidbControlAttributesRemovableVolume
     * @type {Integer (Int32)}
     */
    static RemovableVolume => 65536

    /**
     * Native name: msidbControlAttributesFixedVolume
     * @type {Integer (Int32)}
     */
    static FixedVolume => 131072

    /**
     * Native name: msidbControlAttributesRemoteVolume
     * @type {Integer (Int32)}
     */
    static RemoteVolume => 262144

    /**
     * Native name: msidbControlAttributesCDROMVolume
     * @type {Integer (Int32)}
     */
    static AttributesCDROMVolume => 524288

    /**
     * Native name: msidbControlAttributesRAMDiskVolume
     * @type {Integer (Int32)}
     */
    static AttributesRAMDiskVolume => 1048576

    /**
     * Native name: msidbControlAttributesFloppyVolume
     * @type {Integer (Int32)}
     */
    static FloppyVolume => 2097152

    /**
     * Native name: msidbControlShowRollbackCost
     * @type {Integer (Int32)}
     */
    static ShowRollbackCost => 4194304

    /**
     * Native name: msidbControlAttributesSorted
     * @type {Integer (Int32)}
     */
    static Sorted => 65536

    /**
     * Native name: msidbControlAttributesComboList
     * @type {Integer (Int32)}
     */
    static ComboList => 131072

    /**
     * Native name: msidbControlAttributesImageHandle
     * @type {Integer (Int32)}
     */
    static ImageHandle => 65536

    /**
     * Native name: msidbControlAttributesPushLike
     * @type {Integer (Int32)}
     */
    static PushLike => 131072

    /**
     * Native name: msidbControlAttributesBitmap
     * @type {Integer (Int32)}
     */
    static Bitmap => 262144

    /**
     * Native name: msidbControlAttributesIcon
     * @type {Integer (Int32)}
     */
    static Icon => 524288

    /**
     * Native name: msidbControlAttributesFixedSize
     * @type {Integer (Int32)}
     */
    static FixedSize => 1048576

    /**
     * Native name: msidbControlAttributesIconSize16
     * @type {Integer (Int32)}
     */
    static IconSize16 => 2097152

    /**
     * Native name: msidbControlAttributesIconSize32
     * @type {Integer (Int32)}
     */
    static IconSize32 => 4194304

    /**
     * Native name: msidbControlAttributesIconSize48
     * @type {Integer (Int32)}
     */
    static IconSize48 => 6291456

    /**
     * Native name: msidbControlAttributesElevationShield
     * @type {Integer (Int32)}
     */
    static ElevationShield => 8388608

    /**
     * Native name: msidbControlAttributesHasBorder
     * @type {Integer (Int32)}
     */
    static HasBorder => 16777216
}
