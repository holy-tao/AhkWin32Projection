#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of physical connector.
 * @remarks
 * 
 * If a connector is described as <i>embedded</i> or <i>integrated</i>, it implies that the connector  is internal. These connectors have "Embedded" in the name of the enumeration constant. 
 * 
 * Applications should ignore the <b>COPP_ConnectorType_Internal</b> flag and instead check for connector types with "Embedded" in the constant name.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxva9typ/ne-dxva9typ-copp_connectortype
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class COPP_ConnectorType extends Win32Enum{

    /**
     * Unknown connector type.
     * @type {Integer (Int32)}
     */
    static COPP_ConnectorType_Unknown => -1

    /**
     * VGA (Video Graphics Array) connector.
     * @type {Integer (Int32)}
     */
    static COPP_ConnectorType_VGA => 0

    /**
     * S-Video connector.
     * @type {Integer (Int32)}
     */
    static COPP_ConnectorType_SVideo => 1

    /**
     * Composite video connector.
     * @type {Integer (Int32)}
     */
    static COPP_ConnectorType_CompositeVideo => 2

    /**
     * Component video connector.
     * @type {Integer (Int32)}
     */
    static COPP_ConnectorType_ComponentVideo => 3

    /**
     * DVI (digital video interface) connector.
     * @type {Integer (Int32)}
     */
    static COPP_ConnectorType_DVI => 4

    /**
     * HDMI (high-definition multimedia interface) connector.
     * @type {Integer (Int32)}
     */
    static COPP_ConnectorType_HDMI => 5

    /**
     * LVDS (Low voltage differential signaling) connector.
     * @type {Integer (Int32)}
     */
    static COPP_ConnectorType_LVDS => 6

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static COPP_ConnectorType_TMDS => 7

    /**
     * Japanese D connector. (Connector conforming to the EIAJ RC-5237 standard.)
     * @type {Integer (Int32)}
     */
    static COPP_ConnectorType_D_JPN => 8

    /**
     * Internal connector. This flag can be combined with the other flags. This flag indicates that the connection between the graphics adapter and the display device is permanent and not accessible to the user.
     * @type {Integer (Int32)}
     */
    static COPP_ConnectorType_Internal => -2147483648

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static COPP_ConnectorType_ForceDWORD => 2147483647
}
