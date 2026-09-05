#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the interaction configuration states available in Direct Manipulation.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/ne-directmanipulation-directmanipulation_configuration
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
class DIRECTMANIPULATION_CONFIGURATION extends Win32BitflagEnum {

    /**
     * No interaction is defined.
     * Native name: DIRECTMANIPULATION_CONFIGURATION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * An interaction is defined. To enable interactions, this value must be included.
     * 
     * Required when setting a configuration other than <b>DIRECTMANIPULATION_CONFIGURATION_NONE</b>.
     * Native name: DIRECTMANIPULATION_CONFIGURATION_INTERACTION
     * @type {Integer (Int32)}
     */
    static INTERACTION => 1

    /**
     * Translation in the horizontal axis.
     * Native name: DIRECTMANIPULATION_CONFIGURATION_TRANSLATION_X
     * @type {Integer (Int32)}
     */
    static TRANSLATION_X => 2

    /**
     * Translation in the vertical axis.
     * Native name: DIRECTMANIPULATION_CONFIGURATION_TRANSLATION_Y
     * @type {Integer (Int32)}
     */
    static TRANSLATION_Y => 4

    /**
     * Zoom.
     * Native name: DIRECTMANIPULATION_CONFIGURATION_SCALING
     * @type {Integer (Int32)}
     */
    static SCALING => 16

    /**
     * Inertia for translation as defined by <b>DIRECTMANIPULATION_CONFIGURATION_TRANSLATION_X</b> and <b>DIRECTMANIPULATION_CONFIGURATION_TRANSLATION_Y</b>.
     * Native name: DIRECTMANIPULATION_CONFIGURATION_TRANSLATION_INERTIA
     * @type {Integer (Int32)}
     */
    static TRANSLATION_INERTIA => 32

    /**
     * Inertia for zoom as defined by <b>DIRECTMANIPULATION_CONFIGURATION _SCALING</b>.
     * Native name: DIRECTMANIPULATION_CONFIGURATION_SCALING_INERTIA
     * @type {Integer (Int32)}
     */
    static SCALING_INERTIA => 128

    /**
     * Rails on the horizontal axis.
     * Native name: DIRECTMANIPULATION_CONFIGURATION_RAILS_X
     * @type {Integer (Int32)}
     */
    static RAILS_X => 256

    /**
     * Rails on the vertical axis.
     * Native name: DIRECTMANIPULATION_CONFIGURATION_RAILS_Y
     * @type {Integer (Int32)}
     */
    static RAILS_Y => 512
}
