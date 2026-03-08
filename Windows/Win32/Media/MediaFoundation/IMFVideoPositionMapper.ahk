#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Maps a position on an input video stream to the corresponding position on an output video stream.
 * @see https://learn.microsoft.com/windows/win32/api/evr/nn-evr-imfvideopositionmapper
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVideoPositionMapper extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFVideoPositionMapper
     * @type {Guid}
     */
    static IID => Guid("{1f6a9f17-e70b-4e24-8ae4-0b2c3ba7a4ae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MapOutputCoordinateToInputStream"]

    /**
     * Maps output image coordinates to input image coordinates.
     * @remarks
     * In the following diagram, R(dest) is the destination rectangle for the video. You can obtain this rectangle by calling <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imfvideodisplaycontrol-getvideoposition">IMFVideoDisplayControl::GetVideoPosition</a>. The rectangle R1 is a substream within the video. The point P has pixel coordinates (x,y) relative to R(dest).
     * 
     * <img alt="Illustration showing a rectangle labeled R dest surrounding one labeled R1, which contains a point P located at (x,y)" border="" src="./images/imfvideopositionmapper.gif"/>
     * 
     * The position of P relative to R(dest) in <i>normalized</i> coordinates is calculated as follows:
     * 
     * 
     * ``` syntax
     * float xn = float(x + 0.5) / widthDest;
     * float xy = float(y + 0.5) / heightDest;
     * 
     * ```
     * 
     * where <i>widthDest</i> and <i>heightDest</i> are the width and height of R(dest) in pixels.
     * 
     * To calculate the position of P relative to R1, call <b>MapOutputCoordinateToInputStream</b> as follows:
     * 
     * 
     * ``` syntax
     * float x1 = 0, y1 = 0;
     * hr = pMap-&gt;MapOutputCoordinateToInputStream(xn, yn, 0, dwInputStreamIndex, &amp;x1, &amp;y1);
     * ```
     * 
     * The values returned in <i>x1</i> and <i>y1</i> are normalized to the range [0...1]. To convert back to pixel coordinates, scale these values by the size of R1:
     * 
     * 
     * ``` syntax
     * int scaledx = int(floor(x1 * widthR1));
     * int scaledy = int(floor(xy * heightR1));
     * ```
     * 
     * Note that <i>x1</i> and <i>y1</i> might fall outside the range [0...1] if P lies outside of R1.
     * @param {Float} xOut X-coordinate of the output image, normalized to the range [0...1].
     * @param {Float} yOut Y-coordinate of the output image, normalized to the range [0...1].
     * @param {Integer} dwOutputStreamIndex Output stream index for the coordinate mapping.
     * @param {Integer} dwInputStreamIndex Input stream index for the coordinate mapping.
     * @param {Pointer<Float>} pxIn Receives the mapped x-coordinate of the input image, normalized to the range [0...1].
     * @param {Pointer<Float>} pyIn Receives the mapped y-coordinate of the input image, normalized to the range [0...1].
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer has been shut down.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideopositionmapper-mapoutputcoordinatetoinputstream
     */
    MapOutputCoordinateToInputStream(xOut, yOut, dwOutputStreamIndex, dwInputStreamIndex, pxIn, pyIn) {
        pxInMarshal := pxIn is VarRef ? "float*" : "ptr"
        pyInMarshal := pyIn is VarRef ? "float*" : "ptr"

        result := ComCall(3, this, "float", xOut, "float", yOut, "uint", dwOutputStreamIndex, "uint", dwInputStreamIndex, pxInMarshal, pxIn, pyInMarshal, pyIn, "HRESULT")
        return result
    }
}
