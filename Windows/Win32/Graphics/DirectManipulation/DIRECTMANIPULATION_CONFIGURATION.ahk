#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the interaction configuration states available in Direct Manipulation.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/ne-directmanipulation-directmanipulation_configuration
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class DIRECTMANIPULATION_CONFIGURATION extends Win32BitflagEnum{

    /**
     * No interaction is defined.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_CONFIGURATION_NONE => 0

    /**
     * An interaction is defined. To enable interactions, this value must be included.
     * 
     * Required when setting a configuration other than <b>DIRECTMANIPULATION_CONFIGURATION_NONE</b>.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_CONFIGURATION_INTERACTION => 1

    /**
     * Translation in the horizontal axis.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_CONFIGURATION_TRANSLATION_X => 2

    /**
     * Translation in the vertical axis.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_CONFIGURATION_TRANSLATION_Y => 4

    /**
     * Zoom.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_CONFIGURATION_SCALING => 16

    /**
     * Inertia for translation as defined by <b>DIRECTMANIPULATION_CONFIGURATION_TRANSLATION_X</b> and <b>DIRECTMANIPULATION_CONFIGURATION_TRANSLATION_Y</b>.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_CONFIGURATION_TRANSLATION_INERTIA => 32

    /**
     * Inertia for zoom as defined by <b>DIRECTMANIPULATION_CONFIGURATION _SCALING</b>.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_CONFIGURATION_SCALING_INERTIA => 128

    /**
     * Rails on the horizontal axis.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_CONFIGURATION_RAILS_X => 256

    /**
     * Rails on the vertical axis.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_CONFIGURATION_RAILS_Y => 512
}
