#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IBasicVideo interface sets video properties such as the destination and source rectangles.
 * @see https://docs.microsoft.com/windows/win32/api//control/nn-control-ibasicvideo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBasicVideo extends IDispatch{
    /**
     * The interface identifier for IBasicVideo
     * @type {Guid}
     */
    static IID => Guid("{56a868b5-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Double>} pAvgTimePerFrame 
     * @returns {HRESULT} 
     */
    get_AvgTimePerFrame(pAvgTimePerFrame) {
        result := ComCall(7, this, "double*", pAvgTimePerFrame, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pBitRate 
     * @returns {HRESULT} 
     */
    get_BitRate(pBitRate) {
        result := ComCall(8, this, "int*", pBitRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pBitErrorRate 
     * @returns {HRESULT} 
     */
    get_BitErrorRate(pBitErrorRate) {
        result := ComCall(9, this, "int*", pBitErrorRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVideoWidth 
     * @returns {HRESULT} 
     */
    get_VideoWidth(pVideoWidth) {
        result := ComCall(10, this, "int*", pVideoWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVideoHeight 
     * @returns {HRESULT} 
     */
    get_VideoHeight(pVideoHeight) {
        result := ComCall(11, this, "int*", pVideoHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SourceLeft 
     * @returns {HRESULT} 
     */
    put_SourceLeft(SourceLeft) {
        result := ComCall(12, this, "int", SourceLeft, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pSourceLeft 
     * @returns {HRESULT} 
     */
    get_SourceLeft(pSourceLeft) {
        result := ComCall(13, this, "int*", pSourceLeft, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SourceWidth 
     * @returns {HRESULT} 
     */
    put_SourceWidth(SourceWidth) {
        result := ComCall(14, this, "int", SourceWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pSourceWidth 
     * @returns {HRESULT} 
     */
    get_SourceWidth(pSourceWidth) {
        result := ComCall(15, this, "int*", pSourceWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SourceTop 
     * @returns {HRESULT} 
     */
    put_SourceTop(SourceTop) {
        result := ComCall(16, this, "int", SourceTop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pSourceTop 
     * @returns {HRESULT} 
     */
    get_SourceTop(pSourceTop) {
        result := ComCall(17, this, "int*", pSourceTop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SourceHeight 
     * @returns {HRESULT} 
     */
    put_SourceHeight(SourceHeight) {
        result := ComCall(18, this, "int", SourceHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pSourceHeight 
     * @returns {HRESULT} 
     */
    get_SourceHeight(pSourceHeight) {
        result := ComCall(19, this, "int*", pSourceHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} DestinationLeft 
     * @returns {HRESULT} 
     */
    put_DestinationLeft(DestinationLeft) {
        result := ComCall(20, this, "int", DestinationLeft, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pDestinationLeft 
     * @returns {HRESULT} 
     */
    get_DestinationLeft(pDestinationLeft) {
        result := ComCall(21, this, "int*", pDestinationLeft, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} DestinationWidth 
     * @returns {HRESULT} 
     */
    put_DestinationWidth(DestinationWidth) {
        result := ComCall(22, this, "int", DestinationWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pDestinationWidth 
     * @returns {HRESULT} 
     */
    get_DestinationWidth(pDestinationWidth) {
        result := ComCall(23, this, "int*", pDestinationWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} DestinationTop 
     * @returns {HRESULT} 
     */
    put_DestinationTop(DestinationTop) {
        result := ComCall(24, this, "int", DestinationTop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pDestinationTop 
     * @returns {HRESULT} 
     */
    get_DestinationTop(pDestinationTop) {
        result := ComCall(25, this, "int*", pDestinationTop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} DestinationHeight 
     * @returns {HRESULT} 
     */
    put_DestinationHeight(DestinationHeight) {
        result := ComCall(26, this, "int", DestinationHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pDestinationHeight 
     * @returns {HRESULT} 
     */
    get_DestinationHeight(pDestinationHeight) {
        result := ComCall(27, this, "int*", pDestinationHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Left 
     * @param {Integer} Top 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @returns {HRESULT} 
     */
    SetSourcePosition(Left, Top, Width, Height) {
        result := ComCall(28, this, "int", Left, "int", Top, "int", Width, "int", Height, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pLeft 
     * @param {Pointer<Int32>} pTop 
     * @param {Pointer<Int32>} pWidth 
     * @param {Pointer<Int32>} pHeight 
     * @returns {HRESULT} 
     */
    GetSourcePosition(pLeft, pTop, pWidth, pHeight) {
        result := ComCall(29, this, "int*", pLeft, "int*", pTop, "int*", pWidth, "int*", pHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetDefaultSourcePosition() {
        result := ComCall(30, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Left 
     * @param {Integer} Top 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @returns {HRESULT} 
     */
    SetDestinationPosition(Left, Top, Width, Height) {
        result := ComCall(31, this, "int", Left, "int", Top, "int", Width, "int", Height, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pLeft 
     * @param {Pointer<Int32>} pTop 
     * @param {Pointer<Int32>} pWidth 
     * @param {Pointer<Int32>} pHeight 
     * @returns {HRESULT} 
     */
    GetDestinationPosition(pLeft, pTop, pWidth, pHeight) {
        result := ComCall(32, this, "int*", pLeft, "int*", pTop, "int*", pWidth, "int*", pHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetDefaultDestinationPosition() {
        result := ComCall(33, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pWidth 
     * @param {Pointer<Int32>} pHeight 
     * @returns {HRESULT} 
     */
    GetVideoSize(pWidth, pHeight) {
        result := ComCall(34, this, "int*", pWidth, "int*", pHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StartIndex 
     * @param {Integer} Entries 
     * @param {Pointer<Int32>} pRetrieved 
     * @param {Pointer<Int32>} pPalette 
     * @returns {HRESULT} 
     */
    GetVideoPaletteEntries(StartIndex, Entries, pRetrieved, pPalette) {
        result := ComCall(35, this, "int", StartIndex, "int", Entries, "int*", pRetrieved, "int*", pPalette, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pBufferSize 
     * @param {Pointer<Int32>} pDIBImage 
     * @returns {HRESULT} 
     */
    GetCurrentImage(pBufferSize, pDIBImage) {
        result := ComCall(36, this, "int*", pBufferSize, "int*", pDIBImage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsUsingDefaultSource() {
        result := ComCall(37, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsUsingDefaultDestination() {
        result := ComCall(38, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
