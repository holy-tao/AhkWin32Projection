#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMVideoDecimationProperties interface controls how the Overlay Mixer performs video decimationIf a video window is smaller than the native size of the video being displayed, the video renderer must decimate the incoming video�that is, scale the video down to the smaller size. Decimation can be performed in one of the following places.The overlay hardware on the VGA chip.The scaler built in to the video port (if the connection is through a video port).The decoder supplying video to the renderer.An application can call methods on this interface to select a particular decimation strategy, in order to optimize performance. However, most applications will have no occasion to use this interface. Unless your application is designed to support particular hardware, there is no reason to modify the Overlay Mixer filter's default behavior for decimation.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamvideodecimationproperties
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMVideoDecimationProperties extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMVideoDecimationProperties
     * @type {Guid}
     */
    static IID => Guid("{60d32930-13da-11d3-9ec6-c4fcaef5c7be}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryDecimationUsage", "SetDecimationUsage"]

    /**
     * 
     * @param {Pointer<Integer>} lpUsage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideodecimationproperties-querydecimationusage
     */
    QueryDecimationUsage(lpUsage) {
        result := ComCall(3, this, "int*", lpUsage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Usage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideodecimationproperties-setdecimationusage
     */
    SetDecimationUsage(Usage) {
        result := ComCall(4, this, "int", Usage, "HRESULT")
        return result
    }
}
