#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of physical connector.
 * @remarks
 * If a connector is described as <i>embedded</i> or <i>integrated</i>, it implies that the connector  is internal. These connectors have "Embedded" in the name of the enumeration constant. 
 * 
 * Applications should ignore the <b>COPP_ConnectorType_Internal</b> flag and instead check for connector types with "Embedded" in the constant name.
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ne-dxva9typ-copp_connectortype
 * @namespace Windows.Win32.Media.DirectShow
 */
class COPP_ConnectorType extends Win32Enum {

    /**
     * Unknown connector type.
     * Native name: COPP_ConnectorType_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => -1

    /**
     * VGA (Video Graphics Array) connector.
     * Native name: COPP_ConnectorType_VGA
     * @type {Integer (Int32)}
     */
    static VGA => 0

    /**
     * S-Video connector.
     * Native name: COPP_ConnectorType_SVideo
     * @type {Integer (Int32)}
     */
    static SVideo => 1

    /**
     * Composite video connector.
     * Native name: COPP_ConnectorType_CompositeVideo
     * @type {Integer (Int32)}
     */
    static CompositeVideo => 2

    /**
     * Component video connector.
     * Native name: COPP_ConnectorType_ComponentVideo
     * @type {Integer (Int32)}
     */
    static ComponentVideo => 3

    /**
     * DVI (digital video interface) connector.
     * Native name: COPP_ConnectorType_DVI
     * @type {Integer (Int32)}
     */
    static DVI => 4

    /**
     * HDMI (high-definition multimedia interface) connector.
     * Native name: COPP_ConnectorType_HDMI
     * @type {Integer (Int32)}
     */
    static HDMI => 5

    /**
     * LVDS (Low voltage differential signaling) connector.
     * Native name: COPP_ConnectorType_LVDS
     * @type {Integer (Int32)}
     */
    static LVDS => 6

    /**
     * Reserved.
     * Native name: COPP_ConnectorType_TMDS
     * @type {Integer (Int32)}
     */
    static TMDS => 7

    /**
     * Japanese D connector. (Connector conforming to the EIAJ RC-5237 standard.)
     * Native name: COPP_ConnectorType_D_JPN
     * @type {Integer (Int32)}
     */
    static D_JPN => 8

    /**
     * Internal connector. This flag can be combined with the other flags. This flag indicates that the connection between the graphics adapter and the display device is permanent and not accessible to the user.
     * Native name: COPP_ConnectorType_Internal
     * @type {Integer (Int32)}
     */
    static Internal => -2147483648

    /**
     * Reserved. Do not use.
     * Native name: COPP_ConnectorType_ForceDWORD
     * @type {Integer (Int32)}
     */
    static ForceDWORD => 2147483647
}
