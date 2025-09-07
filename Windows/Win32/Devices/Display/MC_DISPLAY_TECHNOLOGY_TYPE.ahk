#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies monitor display technologies.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/ne-highlevelmonitorconfigurationapi-mc_display_technology_type
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class MC_DISPLAY_TECHNOLOGY_TYPE{

    /**
     * Shadow-mask cathode ray tube (CRT).
     * @type {Integer (Int32)}
     */
    static MC_SHADOW_MASK_CATHODE_RAY_TUBE => 0

    /**
     * Aperture-grill CRT.
     * @type {Integer (Int32)}
     */
    static MC_APERTURE_GRILL_CATHODE_RAY_TUBE => 1

    /**
     * Thin-film transistor (TFT) display.
     * @type {Integer (Int32)}
     */
    static MC_THIN_FILM_TRANSISTOR => 2

    /**
     * Liquid crystal on silicon (LCOS) display.
     * @type {Integer (Int32)}
     */
    static MC_LIQUID_CRYSTAL_ON_SILICON => 3

    /**
     * Plasma display.
     * @type {Integer (Int32)}
     */
    static MC_PLASMA => 4

    /**
     * Organic light emitting diode (LED) display.
     * @type {Integer (Int32)}
     */
    static MC_ORGANIC_LIGHT_EMITTING_DIODE => 5

    /**
     * Electroluminescent display.
     * @type {Integer (Int32)}
     */
    static MC_ELECTROLUMINESCENT => 6

    /**
     * Microelectromechanical display.
     * @type {Integer (Int32)}
     */
    static MC_MICROELECTROMECHANICAL => 7

    /**
     * Field emission device (FED) display.
     * @type {Integer (Int32)}
     */
    static MC_FIELD_EMISSION_DEVICE => 8
}
