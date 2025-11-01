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
     * 
     * @param {Float} xOut 
     * @param {Float} yOut 
     * @param {Integer} dwOutputStreamIndex 
     * @param {Integer} dwInputStreamIndex 
     * @param {Pointer<Float>} pxIn 
     * @param {Pointer<Float>} pyIn 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideopositionmapper-mapoutputcoordinatetoinputstream
     */
    MapOutputCoordinateToInputStream(xOut, yOut, dwOutputStreamIndex, dwInputStreamIndex, pxIn, pyIn) {
        result := ComCall(3, this, "float", xOut, "float", yOut, "uint", dwOutputStreamIndex, "uint", dwInputStreamIndex, "float*", pxIn, "float*", pyIn, "HRESULT")
        return result
    }
}
