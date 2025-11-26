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
     * @type {Float} 
     */
    AvgTimePerFrame {
        get => this.get_AvgTimePerFrame()
    }

    /**
     * @type {Integer} 
     */
    BitRate {
        get => this.get_BitRate()
    }

    /**
     * @type {Integer} 
     */
    BitErrorRate {
        get => this.get_BitErrorRate()
    }

    /**
     * @type {Integer} 
     */
    VideoWidth {
        get => this.get_VideoWidth()
    }

    /**
     * @type {Integer} 
     */
    VideoHeight {
        get => this.get_VideoHeight()
    }

    /**
     * @type {Integer} 
     */
    SourceLeft {
        get => this.get_SourceLeft()
        set => this.put_SourceLeft(value)
    }

    /**
     * @type {Integer} 
     */
    SourceWidth {
        get => this.get_SourceWidth()
        set => this.put_SourceWidth(value)
    }

    /**
     * @type {Integer} 
     */
    SourceTop {
        get => this.get_SourceTop()
        set => this.put_SourceTop(value)
    }

    /**
     * @type {Integer} 
     */
    SourceHeight {
        get => this.get_SourceHeight()
        set => this.put_SourceHeight(value)
    }

    /**
     * @type {Integer} 
     */
    DestinationLeft {
        get => this.get_DestinationLeft()
        set => this.put_DestinationLeft(value)
    }

    /**
     * @type {Integer} 
     */
    DestinationWidth {
        get => this.get_DestinationWidth()
        set => this.put_DestinationWidth(value)
    }

    /**
     * @type {Integer} 
     */
    DestinationTop {
        get => this.get_DestinationTop()
        set => this.put_DestinationTop(value)
    }

    /**
     * @type {Integer} 
     */
    DestinationHeight {
        get => this.get_DestinationHeight()
        set => this.put_DestinationHeight(value)
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_avgtimeperframe
     */
    get_AvgTimePerFrame() {
        result := ComCall(7, this, "double*", &pAvgTimePerFrame := 0, "HRESULT")
        return pAvgTimePerFrame
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_bitrate
     */
    get_BitRate() {
        result := ComCall(8, this, "int*", &pBitRate := 0, "HRESULT")
        return pBitRate
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_biterrorrate
     */
    get_BitErrorRate() {
        result := ComCall(9, this, "int*", &pBitErrorRate := 0, "HRESULT")
        return pBitErrorRate
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_videowidth
     */
    get_VideoWidth() {
        result := ComCall(10, this, "int*", &pVideoWidth := 0, "HRESULT")
        return pVideoWidth
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_videoheight
     */
    get_VideoHeight() {
        result := ComCall(11, this, "int*", &pVideoHeight := 0, "HRESULT")
        return pVideoHeight
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_sourceleft
     */
    get_SourceLeft() {
        result := ComCall(13, this, "int*", &pSourceLeft := 0, "HRESULT")
        return pSourceLeft
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_sourcewidth
     */
    get_SourceWidth() {
        result := ComCall(15, this, "int*", &pSourceWidth := 0, "HRESULT")
        return pSourceWidth
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_sourcetop
     */
    get_SourceTop() {
        result := ComCall(17, this, "int*", &pSourceTop := 0, "HRESULT")
        return pSourceTop
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_sourceheight
     */
    get_SourceHeight() {
        result := ComCall(19, this, "int*", &pSourceHeight := 0, "HRESULT")
        return pSourceHeight
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_destinationleft
     */
    get_DestinationLeft() {
        result := ComCall(21, this, "int*", &pDestinationLeft := 0, "HRESULT")
        return pDestinationLeft
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_destinationwidth
     */
    get_DestinationWidth() {
        result := ComCall(23, this, "int*", &pDestinationWidth := 0, "HRESULT")
        return pDestinationWidth
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_destinationtop
     */
    get_DestinationTop() {
        result := ComCall(25, this, "int*", &pDestinationTop := 0, "HRESULT")
        return pDestinationTop
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-get_destinationheight
     */
    get_DestinationHeight() {
        result := ComCall(27, this, "int*", &pDestinationHeight := 0, "HRESULT")
        return pDestinationHeight
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
        pLeftMarshal := pLeft is VarRef ? "int*" : "ptr"
        pTopMarshal := pTop is VarRef ? "int*" : "ptr"
        pWidthMarshal := pWidth is VarRef ? "int*" : "ptr"
        pHeightMarshal := pHeight is VarRef ? "int*" : "ptr"

        result := ComCall(29, this, pLeftMarshal, pLeft, pTopMarshal, pTop, pWidthMarshal, pWidth, pHeightMarshal, pHeight, "HRESULT")
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
        pLeftMarshal := pLeft is VarRef ? "int*" : "ptr"
        pTopMarshal := pTop is VarRef ? "int*" : "ptr"
        pWidthMarshal := pWidth is VarRef ? "int*" : "ptr"
        pHeightMarshal := pHeight is VarRef ? "int*" : "ptr"

        result := ComCall(32, this, pLeftMarshal, pLeft, pTopMarshal, pTop, pWidthMarshal, pWidth, pHeightMarshal, pHeight, "HRESULT")
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
        pWidthMarshal := pWidth is VarRef ? "int*" : "ptr"
        pHeightMarshal := pHeight is VarRef ? "int*" : "ptr"

        result := ComCall(34, this, pWidthMarshal, pWidth, pHeightMarshal, pHeight, "HRESULT")
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
        pRetrievedMarshal := pRetrieved is VarRef ? "int*" : "ptr"
        pPaletteMarshal := pPalette is VarRef ? "int*" : "ptr"

        result := ComCall(35, this, "int", StartIndex, "int", Entries, pRetrievedMarshal, pRetrieved, pPaletteMarshal, pPalette, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pBufferSize 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ibasicvideo-getcurrentimage
     */
    GetCurrentImage(pBufferSize) {
        pBufferSizeMarshal := pBufferSize is VarRef ? "int*" : "ptr"

        result := ComCall(36, this, pBufferSizeMarshal, pBufferSize, "int*", &pDIBImage := 0, "HRESULT")
        return pDIBImage
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
