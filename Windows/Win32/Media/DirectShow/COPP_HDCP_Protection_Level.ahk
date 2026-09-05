#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the HDCP protection level.
 * @remarks
 * Some televisions do not have robust support for switching HDCP protection on and off. Because of this limitation, the graphics driver might leave HDCP enabled when the application sets the protection level to zero. If the application sets the HDCP level to zero, therefore, it might receive a COPP status message indicating that HDCP is still enabled. This is not an error.
 * 
 * For more information about HDCP, see http://www.digital-cp.com/.
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ne-dxva9typ-copp_hdcp_protection_level
 * @namespace Windows.Win32.Media.DirectShow
 */
class COPP_HDCP_Protection_Level extends Win32Enum {

    /**
     * HDCP protection is not enabled. See Remarks.
     * Native name: COPP_HDCP_Level0
     * @type {Integer (Int32)}
     */
    static Level0 => 0

    /**
     * Minimum HDCP level. Equivalent to <b>COPP_HDCP_Level0</b>.
     * Native name: COPP_HDCP_LevelMin
     * @type {Integer (Int32)}
     */
    static Min => 0

    /**
     * HDCP is enabled.
     * Native name: COPP_HDCP_Level1
     * @type {Integer (Int32)}
     */
    static Level1 => 1

    /**
     * Maximum HDCP level. Equivalent to <b>COPP_HDCP_Level1</b>.
     * Native name: COPP_HDCP_LevelMax
     * @type {Integer (Int32)}
     */
    static Max => 1

    /**
     * Reserved.
     * Native name: COPP_HDCP_ForceDWORD
     * @type {Integer (Int32)}
     */
    static ForceDWORD => 2147483647
}
