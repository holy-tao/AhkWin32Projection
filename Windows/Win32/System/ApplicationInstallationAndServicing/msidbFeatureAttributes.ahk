#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class msidbFeatureAttributes extends Win32Enum {

    /**
     * Native name: msidbFeatureAttributesFavorLocal
     * @type {Integer (Int32)}
     */
    static FavorLocal => 0

    /**
     * Native name: msidbFeatureAttributesFavorSource
     * @type {Integer (Int32)}
     */
    static FavorSource => 1

    /**
     * Native name: msidbFeatureAttributesFollowParent
     * @type {Integer (Int32)}
     */
    static FollowParent => 2

    /**
     * Native name: msidbFeatureAttributesFavorAdvertise
     * @type {Integer (Int32)}
     */
    static FavorAdvertise => 4

    /**
     * Native name: msidbFeatureAttributesDisallowAdvertise
     * @type {Integer (Int32)}
     */
    static DisallowAdvertise => 8

    /**
     * Native name: msidbFeatureAttributesUIDisallowAbsent
     * @type {Integer (Int32)}
     */
    static AttributesUIDisallowAbsent => 16

    /**
     * Native name: msidbFeatureAttributesNoUnsupportedAdvertise
     * @type {Integer (Int32)}
     */
    static NoUnsupportedAdvertise => 32
}
