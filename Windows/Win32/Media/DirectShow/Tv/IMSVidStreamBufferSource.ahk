#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidFilePlayback.ahk

/**
 * The IMSVidStreamBufferSource interface represents the Stream Buffer Source filter within the Video Control.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferSource)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidstreambuffersource
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidStreamBufferSource extends IMSVidFilePlayback{
    /**
     * The interface identifier for IMSVidStreamBufferSource
     * @type {Guid}
     */
    static IID => Guid("{eb0c8cf9-6950-4772-87b1-47d11cf3a02f}")

    /**
     * The class identifier for MSVidStreamBufferSource
     * @type {Guid}
     */
    static CLSID => Guid("{ad8e510d-217f-409b-8076-29c5e73b98e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 34

    /**
     * 
     * @param {Pointer<Int32>} lStart 
     * @returns {HRESULT} 
     */
    get_Start(lStart) {
        result := ComCall(34, this, "int*", lStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pRecordingAttribute 
     * @returns {HRESULT} 
     */
    get_RecordingAttribute(pRecordingAttribute) {
        result := ComCall(35, this, "ptr", pRecordingAttribute, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pEnSystem 
     * @param {Pointer<Int32>} pEnRating 
     * @param {Pointer<Int32>} pBfEnAttr 
     * @returns {HRESULT} 
     */
    CurrentRatings(pEnSystem, pEnRating, pBfEnAttr) {
        result := ComCall(36, this, "int*", pEnSystem, "int*", pEnRating, "int*", pBfEnAttr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enSystem 
     * @param {Integer} enRating 
     * @param {Integer} lbfEnAttr 
     * @returns {HRESULT} 
     */
    MaxRatingsLevel(enSystem, enRating, lbfEnAttr) {
        result := ComCall(37, this, "int", enSystem, "int", enRating, "int", lbfEnAttr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bBlock 
     * @returns {HRESULT} 
     */
    put_BlockUnrated(bBlock) {
        result := ComCall(38, this, "short", bBlock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwDelay 
     * @returns {HRESULT} 
     */
    put_UnratedDelay(dwDelay) {
        result := ComCall(39, this, "int", dwDelay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} sbeFilter 
     * @returns {HRESULT} 
     */
    get_SBESource(sbeFilter) {
        result := ComCall(40, this, "ptr", sbeFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
