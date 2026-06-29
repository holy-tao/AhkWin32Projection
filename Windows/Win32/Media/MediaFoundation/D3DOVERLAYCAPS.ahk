#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies hardware overlay capabilities for a Direct3D device.
 * @see https://learn.microsoft.com/windows/win32/api/d3d9caps/ns-d3d9caps-d3doverlaycaps
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3DOVERLAYCAPS {
    #StructPack 4

    /**
     * Contains a bitwise <b>OR</b> of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DOVERLAYCAPS_FULLRANGERGB"></a><a id="d3doverlaycaps_fullrangergb"></a><dl>
     * <dt><b>D3DOVERLAYCAPS_FULLRANGERGB</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The overlay supports RGB with a nominal range of 0–255 per channel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DOVERLAYCAPS_LIMITEDRANGERGB"></a><a id="d3doverlaycaps_limitedrangergb"></a><dl>
     * <dt><b>D3DOVERLAYCAPS_LIMITEDRANGERGB</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The overlay supports RGB with a nominal range of 16–235 per channel. Reference black is (16,16,16) and reference white is (235,235,235).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DOVERLAYCAPS_YCbCr_BT601"></a><a id="d3doverlaycaps_ycbcr_bt601"></a><a id="D3DOVERLAYCAPS_YCBCR_BT601"></a><dl>
     * <dt><b>D3DOVERLAYCAPS_YCbCr_BT601</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The overlay supports the BT.601 definition of YUV.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DOVERLAYCAPS_YCbCr_BT709"></a><a id="d3doverlaycaps_ycbcr_bt709"></a><a id="D3DOVERLAYCAPS_YCBCR_BT709"></a><dl>
     * <dt><b>D3DOVERLAYCAPS_YCbCr_BT709</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The overlay supports the BT.709 definition of YUV.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DOVERLAYCAPS_YCbCr_BT601_xvYCC"></a><a id="d3doverlaycaps_ycbcr_bt601_xvycc"></a><a id="D3DOVERLAYCAPS_YCBCR_BT601_XVYCC"></a><dl>
     * <dt><b>D3DOVERLAYCAPS_YCbCr_BT601_xvYCC</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The overlay supports extended YCbCr (xvYCC) for BT.601 YUV.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DOVERLAYCAPS_YCbCr_BT709_xvYCC"></a><a id="d3doverlaycaps_ycbcr_bt709_xvycc"></a><a id="D3DOVERLAYCAPS_YCBCR_BT709_XVYCC"></a><dl>
     * <dt><b>D3DOVERLAYCAPS_YCbCr_BT709_xvYCC</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The overlay supports extended YCbCr (xvYCC) for BT.709 YUV.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DOVERLAYCAPS_STRETCHX"></a><a id="d3doverlaycaps_stretchx"></a><dl>
     * <dt><b>D3DOVERLAYCAPS_STRETCHX</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device can stretch and shrink the overlay data arbitrarily in the horizontal direction.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DOVERLAYCAPS_STRETCHY"></a><a id="d3doverlaycaps_stretchy"></a><dl>
     * <dt><b>D3DOVERLAYCAPS_STRETCHY</b></dt>
     * <dt>0x00000080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device can stretch and shrink the overlay data arbitrarily in the vertical direction.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Caps : UInt32

    /**
     * The maximum overlay width after stretching.
     */
    MaxOverlayDisplayWidth : UInt32

    /**
     * The maximum overlay height after stretching.
     */
    MaxOverlayDisplayHeight : UInt32

}
