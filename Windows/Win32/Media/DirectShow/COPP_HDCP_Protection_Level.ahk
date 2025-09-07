#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the HDCP protection level.
 * @remarks
 * Some televisions do not have robust support for switching HDCP protection on and off. Because of this limitation, the graphics driver might leave HDCP enabled when the application sets the protection level to zero. If the application sets the HDCP level to zero, therefore, it might receive a COPP status message indicating that HDCP is still enabled. This is not an error.
  * 
  * For more information about HDCP, see http://www.digital-cp.com/.
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ne-dxva9typ-copp_hdcp_protection_level
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class COPP_HDCP_Protection_Level{

    /**
     * HDCP protection is not enabled. See Remarks.
     * @type {Integer (Int32)}
     */
    static COPP_HDCP_Level0 => 0

    /**
     * Minimum HDCP level. Equivalent to <b>COPP_HDCP_Level0</b>.
     * @type {Integer (Int32)}
     */
    static COPP_HDCP_LevelMin => 0

    /**
     * HDCP is enabled.
     * @type {Integer (Int32)}
     */
    static COPP_HDCP_Level1 => 1

    /**
     * Maximum HDCP level. Equivalent to <b>COPP_HDCP_Level1</b>.
     * @type {Integer (Int32)}
     */
    static COPP_HDCP_LevelMax => 1

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static COPP_HDCP_ForceDWORD => 2147483647
}
