#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class msidbFeatureAttributes extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static msidbFeatureAttributesFavorLocal => 0

    /**
     * @type {Integer (Int32)}
     */
    static msidbFeatureAttributesFavorSource => 1

    /**
     * @type {Integer (Int32)}
     */
    static msidbFeatureAttributesFollowParent => 2

    /**
     * @type {Integer (Int32)}
     */
    static msidbFeatureAttributesFavorAdvertise => 4

    /**
     * @type {Integer (Int32)}
     */
    static msidbFeatureAttributesDisallowAdvertise => 8

    /**
     * @type {Integer (Int32)}
     */
    static msidbFeatureAttributesUIDisallowAbsent => 16

    /**
     * @type {Integer (Int32)}
     */
    static msidbFeatureAttributesNoUnsupportedAdvertise => 32
}
