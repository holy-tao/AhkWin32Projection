#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies monitor display technologies.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/ne-highlevelmonitorconfigurationapi-mc_display_technology_type
 * @namespace Windows.Win32.Devices.Display
 */
class MC_DISPLAY_TECHNOLOGY_TYPE extends Win32Enum {

    /**
     * Shadow-mask cathode ray tube (CRT).
     * Native name: MC_SHADOW_MASK_CATHODE_RAY_TUBE
     * @type {Integer (Int32)}
     */
    static SHADOW_MASK_CATHODE_RAY_TUBE => 0

    /**
     * Aperture-grill CRT.
     * Native name: MC_APERTURE_GRILL_CATHODE_RAY_TUBE
     * @type {Integer (Int32)}
     */
    static APERTURE_GRILL_CATHODE_RAY_TUBE => 1

    /**
     * Thin-film transistor (TFT) display.
     * Native name: MC_THIN_FILM_TRANSISTOR
     * @type {Integer (Int32)}
     */
    static THIN_FILM_TRANSISTOR => 2

    /**
     * Liquid crystal on silicon (LCOS) display.
     * Native name: MC_LIQUID_CRYSTAL_ON_SILICON
     * @type {Integer (Int32)}
     */
    static LIQUID_CRYSTAL_ON_SILICON => 3

    /**
     * Plasma display.
     * Native name: MC_PLASMA
     * @type {Integer (Int32)}
     */
    static PLASMA => 4

    /**
     * Organic light emitting diode (LED) display.
     * Native name: MC_ORGANIC_LIGHT_EMITTING_DIODE
     * @type {Integer (Int32)}
     */
    static ORGANIC_LIGHT_EMITTING_DIODE => 5

    /**
     * Electroluminescent display.
     * Native name: MC_ELECTROLUMINESCENT
     * @type {Integer (Int32)}
     */
    static ELECTROLUMINESCENT => 6

    /**
     * Microelectromechanical display.
     * Native name: MC_MICROELECTROMECHANICAL
     * @type {Integer (Int32)}
     */
    static MICROELECTROMECHANICAL => 7

    /**
     * Field emission device (FED) display.
     * Native name: MC_FIELD_EMISSION_DEVICE
     * @type {Integer (Int32)}
     */
    static FIELD_EMISSION_DEVICE => 8
}
