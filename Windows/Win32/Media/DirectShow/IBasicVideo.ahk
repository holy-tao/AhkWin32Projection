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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AvgTimePerFrame", "get_BitRate", "get_BitErrorRate", "get_VideoWidth", "get_VideoHeight", "put_SourceLeft", "get_SourceLeft", "put_SourceWidth", "get_SourceWidth", "put_SourceTop", "get_SourceTop", "put_SourceHeight", "get_SourceHeight", "put_DestinationLeft", "get_DestinationLeft", "put_DestinationWidth", "get_DestinationWidth", "put_DestinationTop", "get_DestinationTop", "put_DestinationHeight", "get_DestinationHeight", "SetSourcePosition", "GetSourcePosition", "SetDefaultSourcePosition", "SetDestinationPosition", "GetDestinationPosition", "SetDefaultDestinationPosition", "GetVideoSize", "GetVideoPaletteEntries", "GetCurrentImage", "IsUsingDefaultSource", "IsUsingDefaultDestination"]

    /**
     * 
     * @param {Pointer<Float>} pAvgTimePerFrame 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_avgtimeperframe
     */
    get_AvgTimePerFrame(pAvgTimePerFrame) {
        result := ComCall(7, this, "double*", pAvgTimePerFrame, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pBitRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_bitrate
     */
    get_BitRate(pBitRate) {
        result := ComCall(8, this, "int*", pBitRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pBitErrorRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_biterrorrate
     */
    get_BitErrorRate(pBitErrorRate) {
        result := ComCall(9, this, "int*", pBitErrorRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVideoWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_videowidth
     */
    get_VideoWidth(pVideoWidth) {
        result := ComCall(10, this, "int*", pVideoWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVideoHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_videoheight
     */
    get_VideoHeight(pVideoHeight) {
        result := ComCall(11, this, "int*", pVideoHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SourceLeft 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-put_sourceleft
     */
    put_SourceLeft(SourceLeft) {
        result := ComCall(12, this, "int", SourceLeft, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pSourceLeft 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_sourceleft
     */
    get_SourceLeft(pSourceLeft) {
        result := ComCall(13, this, "int*", pSourceLeft, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SourceWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-put_sourcewidth
     */
    put_SourceWidth(SourceWidth) {
        result := ComCall(14, this, "int", SourceWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pSourceWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_sourcewidth
     */
    get_SourceWidth(pSourceWidth) {
        result := ComCall(15, this, "int*", pSourceWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SourceTop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-put_sourcetop
     */
    put_SourceTop(SourceTop) {
        result := ComCall(16, this, "int", SourceTop, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pSourceTop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_sourcetop
     */
    get_SourceTop(pSourceTop) {
        result := ComCall(17, this, "int*", pSourceTop, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SourceHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-put_sourceheight
     */
    put_SourceHeight(SourceHeight) {
        result := ComCall(18, this, "int", SourceHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pSourceHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_sourceheight
     */
    get_SourceHeight(pSourceHeight) {
        result := ComCall(19, this, "int*", pSourceHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} DestinationLeft 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-put_destinationleft
     */
    put_DestinationLeft(DestinationLeft) {
        result := ComCall(20, this, "int", DestinationLeft, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pDestinationLeft 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_destinationleft
     */
    get_DestinationLeft(pDestinationLeft) {
        result := ComCall(21, this, "int*", pDestinationLeft, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} DestinationWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-put_destinationwidth
     */
    put_DestinationWidth(DestinationWidth) {
        result := ComCall(22, this, "int", DestinationWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pDestinationWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_destinationwidth
     */
    get_DestinationWidth(pDestinationWidth) {
        result := ComCall(23, this, "int*", pDestinationWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} DestinationTop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-put_destinationtop
     */
    put_DestinationTop(DestinationTop) {
        result := ComCall(24, this, "int", DestinationTop, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pDestinationTop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_destinationtop
     */
    get_DestinationTop(pDestinationTop) {
        result := ComCall(25, this, "int*", pDestinationTop, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} DestinationHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-put_destinationheight
     */
    put_DestinationHeight(DestinationHeight) {
        result := ComCall(26, this, "int", DestinationHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pDestinationHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_destinationheight
     */
    get_DestinationHeight(pDestinationHeight) {
        result := ComCall(27, this, "int*", pDestinationHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Left 
     * @param {Integer} Top 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-setsourceposition
     */
    SetSourcePosition(Left, Top, Width, Height) {
        result := ComCall(28, this, "int", Left, "int", Top, "int", Width, "int", Height, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pLeft 
     * @param {Pointer<Integer>} pTop 
     * @param {Pointer<Integer>} pWidth 
     * @param {Pointer<Integer>} pHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-getsourceposition
     */
    GetSourcePosition(pLeft, pTop, pWidth, pHeight) {
        result := ComCall(29, this, "int*", pLeft, "int*", pTop, "int*", pWidth, "int*", pHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-setdefaultsourceposition
     */
    SetDefaultSourcePosition() {
        result := ComCall(30, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Left 
     * @param {Integer} Top 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-setdestinationposition
     */
    SetDestinationPosition(Left, Top, Width, Height) {
        result := ComCall(31, this, "int", Left, "int", Top, "int", Width, "int", Height, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pLeft 
     * @param {Pointer<Integer>} pTop 
     * @param {Pointer<Integer>} pWidth 
     * @param {Pointer<Integer>} pHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-getdestinationposition
     */
    GetDestinationPosition(pLeft, pTop, pWidth, pHeight) {
        result := ComCall(32, this, "int*", pLeft, "int*", pTop, "int*", pWidth, "int*", pHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-setdefaultdestinationposition
     */
    SetDefaultDestinationPosition() {
        result := ComCall(33, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pWidth 
     * @param {Pointer<Integer>} pHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-getvideosize
     */
    GetVideoSize(pWidth, pHeight) {
        result := ComCall(34, this, "int*", pWidth, "int*", pHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StartIndex 
     * @param {Integer} Entries 
     * @param {Pointer<Integer>} pRetrieved 
     * @param {Pointer<Integer>} pPalette 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-getvideopaletteentries
     */
    GetVideoPaletteEntries(StartIndex, Entries, pRetrieved, pPalette) {
        result := ComCall(35, this, "int", StartIndex, "int", Entries, "int*", pRetrieved, "int*", pPalette, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pBufferSize 
     * @param {Pointer<Integer>} pDIBImage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-getcurrentimage
     */
    GetCurrentImage(pBufferSize, pDIBImage) {
        result := ComCall(36, this, "int*", pBufferSize, "int*", pDIBImage, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-isusingdefaultsource
     */
    IsUsingDefaultSource() {
        result := ComCall(37, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-isusingdefaultdestination
     */
    IsUsingDefaultDestination() {
        result := ComCall(38, this, "HRESULT")
        return result
    }
}
