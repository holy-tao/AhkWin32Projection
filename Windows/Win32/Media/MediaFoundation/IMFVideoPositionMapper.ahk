#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Maps a position on an input video stream to the corresponding position on an output video stream.
 * @see https://docs.microsoft.com/windows/win32/api//evr/nn-evr-imfvideopositionmapper
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
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideopositionmapper-mapoutputcoordinatetoinputstream
     */
    MapOutputCoordinateToInputStream(xOut, yOut, dwOutputStreamIndex, dwInputStreamIndex, pxIn, pyIn) {
        pxInMarshal := pxIn is VarRef ? "float*" : "ptr"
        pyInMarshal := pyIn is VarRef ? "float*" : "ptr"

        result := ComCall(3, this, "float", xOut, "float", yOut, "uint", dwOutputStreamIndex, "uint", dwInputStreamIndex, pxInMarshal, pxIn, pyInMarshal, pyIn, "HRESULT")
        return result
    }
}
