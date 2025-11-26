#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMDecoderCaps interface returns capabilities information from an MPEG decoder filter.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamdecodercaps
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMDecoderCaps extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMDecoderCaps
     * @type {Guid}
     */
    static IID => Guid("{c0dff467-d499-4986-972b-e1d9090fa941}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDecoderCaps"]

    /**
     * The GetDecoderCaps method queries the decoder for its capabilities.
     * @param {Integer} dwCapIndex Specifies the capability being queried for.
     * 
     * <table>
     * <tr>
     * <th>Constant
     *                 </th>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>AM_QUERY_DECODER_VMR_SUPPORT</td>
     * <td>0x00000001</td>
     * <td>Video Mixing Renderer Filter 7 (VMR-7) support</td>
     * </tr>
     * <tr>
     * <td>AM_QUERY_DECODER_DXVA_1_SUPPORT</td>
     * <td>0x00000002</td>
     * <td>DirectX Video Acceleration support</td>
     * </tr>
     * <tr>
     * <td>AM_QUERY_DECODER_DVD_SUPPORT</td>
     * <td>0x00000003</td>
     * <td>DVD Video support</td>
     * </tr>
     * <tr>
     * <td>AM_QUERY_DECODER_ATSC_SD_SUPPORT</td>
     * <td>0x00000004</td>
     * <td>Standard-definition (SD) ATSC video support</td>
     * </tr>
     * <tr>
     * <td>AM_QUERY_DECODER_ATSC_HD_SUPPORT</td>
     * <td>0x00000005</td>
     * <td>High-definition (HD) ATSC video support</td>
     * </tr>
     * <tr>
     * <td>AM_GETDECODERCAP_QUERY_VMR9_SUPPORT</td>
     * <td>0x00000006</td>
     * <td>Video Mixing Renderer Filter 9 (VMR-9) support</td>
     * </tr>
     * <tr>
     * <td>AM_GETDECODERCAP_QUERY_EVR_SUPPORT</td>
     * <td>0x00000007</td>
     * <td>Enhanced Video Renderer (EVR) support.</td>
     * </tr>
     * </table>
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamdecodercaps-getdecodercaps
     */
    GetDecoderCaps(dwCapIndex) {
        result := ComCall(3, this, "uint", dwCapIndex, "uint*", &lpdwCap := 0, "HRESULT")
        return lpdwCap
    }
}
