#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWRITE_PANOSE_DECORATIVE_TOPOLOGY enumeration contains values that specify the overall shape characteristics of the font.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_decorative_topology
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PANOSE_DECORATIVE_TOPOLOGY extends Win32Enum {

    /**
     * Any decorative topology.
     * Native name: DWRITE_PANOSE_DECORATIVE_TOPOLOGY_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 0

    /**
     * No fit for decorative topology.
     * Native name: DWRITE_PANOSE_DECORATIVE_TOPOLOGY_NO_FIT
     * @type {Integer (Int32)}
     */
    static NO_FIT => 1

    /**
     * Standard decorative topology.
     * Native name: DWRITE_PANOSE_DECORATIVE_TOPOLOGY_STANDARD
     * @type {Integer (Int32)}
     */
    static STANDARD => 2

    /**
     * Square decorative topology.
     * Native name: DWRITE_PANOSE_DECORATIVE_TOPOLOGY_SQUARE
     * @type {Integer (Int32)}
     */
    static SQUARE => 3

    /**
     * Multiple segment decorative topology.
     * Native name: DWRITE_PANOSE_DECORATIVE_TOPOLOGY_MULTIPLE_SEGMENT
     * @type {Integer (Int32)}
     */
    static MULTIPLE_SEGMENT => 4

    /**
     * Art deco decorative topology.
     * Native name: DWRITE_PANOSE_DECORATIVE_TOPOLOGY_ART_DECO
     * @type {Integer (Int32)}
     */
    static ART_DECO => 5

    /**
     * Uneven weighting decorative topology.
     * Native name: DWRITE_PANOSE_DECORATIVE_TOPOLOGY_UNEVEN_WEIGHTING
     * @type {Integer (Int32)}
     */
    static UNEVEN_WEIGHTING => 6

    /**
     * Diverse arms decorative topology.
     * Native name: DWRITE_PANOSE_DECORATIVE_TOPOLOGY_DIVERSE_ARMS
     * @type {Integer (Int32)}
     */
    static DIVERSE_ARMS => 7

    /**
     * Diverse forms decorative topology.
     * Native name: DWRITE_PANOSE_DECORATIVE_TOPOLOGY_DIVERSE_FORMS
     * @type {Integer (Int32)}
     */
    static DIVERSE_FORMS => 8

    /**
     * Lombardic forms decorative topology.
     * Native name: DWRITE_PANOSE_DECORATIVE_TOPOLOGY_LOMBARDIC_FORMS
     * @type {Integer (Int32)}
     */
    static LOMBARDIC_FORMS => 9

    /**
     * Upper case in lower case decorative topology.
     * Native name: DWRITE_PANOSE_DECORATIVE_TOPOLOGY_UPPER_CASE_IN_LOWER_CASE
     * @type {Integer (Int32)}
     */
    static UPPER_CASE_IN_LOWER_CASE => 10

    /**
     * The decorative topology is implied.
     * Native name: DWRITE_PANOSE_DECORATIVE_TOPOLOGY_IMPLIED_TOPOLOGY
     * @type {Integer (Int32)}
     */
    static IMPLIED_TOPOLOGY => 11

    /**
     * Horseshoe E and A decorative topology.
     * Native name: DWRITE_PANOSE_DECORATIVE_TOPOLOGY_HORSESHOE_E_AND_A
     * @type {Integer (Int32)}
     */
    static HORSESHOE_E_AND_A => 12

    /**
     * Cursive decorative topology.
     * Native name: DWRITE_PANOSE_DECORATIVE_TOPOLOGY_CURSIVE
     * @type {Integer (Int32)}
     */
    static CURSIVE => 13

    /**
     * Blackletter decorative topology.
     * Native name: DWRITE_PANOSE_DECORATIVE_TOPOLOGY_BLACKLETTER
     * @type {Integer (Int32)}
     */
    static BLACKLETTER => 14

    /**
     * Swash variance decorative topology.
     * Native name: DWRITE_PANOSE_DECORATIVE_TOPOLOGY_SWASH_VARIANCE
     * @type {Integer (Int32)}
     */
    static SWASH_VARIANCE => 15
}
