#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DWRITE_PANOSE_DECORATIVE_TOPOLOGY enumeration contains values that specify the overall shape characteristics of the font.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_decorative_topology
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PANOSE_DECORATIVE_TOPOLOGY{

    /**
     * Any decorative topology.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_TOPOLOGY_ANY => 0

    /**
     * No fit for decorative topology.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_TOPOLOGY_NO_FIT => 1

    /**
     * Standard decorative topology.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_TOPOLOGY_STANDARD => 2

    /**
     * Square decorative topology.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_TOPOLOGY_SQUARE => 3

    /**
     * Multiple segment decorative topology.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_TOPOLOGY_MULTIPLE_SEGMENT => 4

    /**
     * Art deco decorative topology.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_TOPOLOGY_ART_DECO => 5

    /**
     * Uneven weighting decorative topology.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_TOPOLOGY_UNEVEN_WEIGHTING => 6

    /**
     * Diverse arms decorative topology.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_TOPOLOGY_DIVERSE_ARMS => 7

    /**
     * Diverse forms decorative topology.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_TOPOLOGY_DIVERSE_FORMS => 8

    /**
     * Lombardic forms decorative topology.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_TOPOLOGY_LOMBARDIC_FORMS => 9

    /**
     * Upper case in lower case decorative topology.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_TOPOLOGY_UPPER_CASE_IN_LOWER_CASE => 10

    /**
     * The decorative topology is implied.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_TOPOLOGY_IMPLIED_TOPOLOGY => 11

    /**
     * Horseshoe E and A decorative topology.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_TOPOLOGY_HORSESHOE_E_AND_A => 12

    /**
     * Cursive decorative topology.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_TOPOLOGY_CURSIVE => 13

    /**
     * Blackletter decorative topology.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_TOPOLOGY_BLACKLETTER => 14

    /**
     * Swash variance decorative topology.
     * @type {Integer (Int32)}
     */
    static DWRITE_PANOSE_DECORATIVE_TOPOLOGY_SWASH_VARIANCE => 15
}
