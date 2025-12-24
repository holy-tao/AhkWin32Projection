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
     * The get_AvgTimePerFrame method retrieves the average time between successive frames.
     * @returns {Float} Pointer to a variable of type <a href="https://docs.microsoft.com/windows/desktop/DirectShow/reftime">REFTIME</a> that receives the average frame time, in seconds.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-get_avgtimeperframe
     */
    get_AvgTimePerFrame() {
        result := ComCall(7, this, "double*", &pAvgTimePerFrame := 0, "HRESULT")
        return pAvgTimePerFrame
    }

    /**
     * The get_BitRate method retrieves the approximate bit rate of the video stream.
     * @returns {Integer} Pointer to a variable that receives the approximate bit rate, in bits per second.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-get_bitrate
     */
    get_BitRate() {
        result := ComCall(8, this, "int*", &pBitRate := 0, "HRESULT")
        return pBitRate
    }

    /**
     * The get_BitErrorRate method retrieves the approximate bit error rate of the video stream.
     * @returns {Integer} Pointer to a variable that receives the approximate number of bits per error.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-get_biterrorrate
     */
    get_BitErrorRate() {
        result := ComCall(9, this, "int*", &pBitErrorRate := 0, "HRESULT")
        return pBitErrorRate
    }

    /**
     * The get_VideoWidth method retrieves the native width of the video.
     * @returns {Integer} Pointer to a variable that receives the width of the video, in pixels.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-get_videowidth
     */
    get_VideoWidth() {
        result := ComCall(10, this, "int*", &pVideoWidth := 0, "HRESULT")
        return pVideoWidth
    }

    /**
     * The get_VideoHeight method retrieves the native height of the video.
     * @returns {Integer} Pointer to a variable that receives the height, in pixels.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-get_videoheight
     */
    get_VideoHeight() {
        result := ComCall(11, this, "int*", &pVideoHeight := 0, "HRESULT")
        return pVideoHeight
    }

    /**
     * The put_SourceLeft method sets the x-coordinate of the source rectangle.
     * @param {Integer} SourceLeft Specifies the x-coordinate, in pixels.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer's input pin is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-put_sourceleft
     */
    put_SourceLeft(SourceLeft) {
        result := ComCall(12, this, "int", SourceLeft, "HRESULT")
        return result
    }

    /**
     * The get_SourceLeft method retrieves the x-coordinate of the source rectangle.
     * @returns {Integer} Pointer to a variable that receives the x-coordinate, in pixels.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-get_sourceleft
     */
    get_SourceLeft() {
        result := ComCall(13, this, "int*", &pSourceLeft := 0, "HRESULT")
        return pSourceLeft
    }

    /**
     * The put_SourceWidth method sets the width of the source rectangle.
     * @param {Integer} SourceWidth Specifies the width, in pixels.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-put_sourcewidth
     */
    put_SourceWidth(SourceWidth) {
        result := ComCall(14, this, "int", SourceWidth, "HRESULT")
        return result
    }

    /**
     * The get_SourceWidth method retrieves the width of the source rectangle.
     * @returns {Integer} Pointer to a variable that receives the width, in pixels.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-get_sourcewidth
     */
    get_SourceWidth() {
        result := ComCall(15, this, "int*", &pSourceWidth := 0, "HRESULT")
        return pSourceWidth
    }

    /**
     * The put_SourceTop method sets the y-coordinate of the source rectangle.
     * @param {Integer} SourceTop Specifies the y-coordinate, in pixels.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer's input pin is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-put_sourcetop
     */
    put_SourceTop(SourceTop) {
        result := ComCall(16, this, "int", SourceTop, "HRESULT")
        return result
    }

    /**
     * The get_SourceTop method retrieves the y-coordinate of the source rectangle.
     * @returns {Integer} Pointer a variable that receives the y-coordinate, in pixels.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-get_sourcetop
     */
    get_SourceTop() {
        result := ComCall(17, this, "int*", &pSourceTop := 0, "HRESULT")
        return pSourceTop
    }

    /**
     * The put_SourceHeight method sets the height of the source rectangle.
     * @param {Integer} SourceHeight Specifies the height, in pixels.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-put_sourceheight
     */
    put_SourceHeight(SourceHeight) {
        result := ComCall(18, this, "int", SourceHeight, "HRESULT")
        return result
    }

    /**
     * The get_SourceHeight method retrieves the height of the source rectangle.
     * @returns {Integer} Pointer to a variable that receives the current height, in pixels.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-get_sourceheight
     */
    get_SourceHeight() {
        result := ComCall(19, this, "int*", &pSourceHeight := 0, "HRESULT")
        return pSourceHeight
    }

    /**
     * The put_DestinationLeft method sets the x-coordinate of the destination rectangle.
     * @param {Integer} DestinationLeft Specifies the x-coordinate, in pixels.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-put_destinationleft
     */
    put_DestinationLeft(DestinationLeft) {
        result := ComCall(20, this, "int", DestinationLeft, "HRESULT")
        return result
    }

    /**
     * The get_DestinationLeft method retrieves the x-coordinate of the destination rectangle.
     * @returns {Integer} Pointer to a variable that receives the x-coordinate, in pixels.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-get_destinationleft
     */
    get_DestinationLeft() {
        result := ComCall(21, this, "int*", &pDestinationLeft := 0, "HRESULT")
        return pDestinationLeft
    }

    /**
     * The put_DestinationWidth method sets the width of the destination rectangle.
     * @param {Integer} DestinationWidth Specifies the width, in pixels.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument. <i>DestinationWidth</i> must be larger than zero.
     * 
     * </td>
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
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-put_destinationwidth
     */
    put_DestinationWidth(DestinationWidth) {
        result := ComCall(22, this, "int", DestinationWidth, "HRESULT")
        return result
    }

    /**
     * The get_DestinationWidth method retrieves the width of the destination rectangle.
     * @returns {Integer} Pointer to a variable that receives the width, in pixels.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-get_destinationwidth
     */
    get_DestinationWidth() {
        result := ComCall(23, this, "int*", &pDestinationWidth := 0, "HRESULT")
        return pDestinationWidth
    }

    /**
     * The put_DestinationTop method sets the y-coordinate of the destination rectangle.
     * @param {Integer} DestinationTop Specifies the y-coordinate, in pixels.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-put_destinationtop
     */
    put_DestinationTop(DestinationTop) {
        result := ComCall(24, this, "int", DestinationTop, "HRESULT")
        return result
    }

    /**
     * The get_DestinationTop method retrieves the y-coordinate of the destination rectangle.
     * @returns {Integer} Pointer to a variable that receives the y-coordinate, in pixels.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-get_destinationtop
     */
    get_DestinationTop() {
        result := ComCall(25, this, "int*", &pDestinationTop := 0, "HRESULT")
        return pDestinationTop
    }

    /**
     * The put_DestinationHeight method sets the height of the destination rectangle.
     * @param {Integer} DestinationHeight Specifies the height, in pixels.
     * @returns {HRESULT} Returns an <code>HRESULT</code> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument. <i>DestinationHeight</i> must be larger than zero.
     * 
     * </td>
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
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-put_destinationheight
     */
    put_DestinationHeight(DestinationHeight) {
        result := ComCall(26, this, "int", DestinationHeight, "HRESULT")
        return result
    }

    /**
     * The get_DestinationHeight method retrieves the height of the destination rectangle.
     * @returns {Integer} Pointer to a variable that receives the height, in pixels.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-get_destinationheight
     */
    get_DestinationHeight() {
        result := ComCall(27, this, "int*", &pDestinationHeight := 0, "HRESULT")
        return pDestinationHeight
    }

    /**
     * The SetSourcePosition method sets the source rectangle.
     * @param {Integer} Left Specifies the x-coordinate, in pixels.
     * @param {Integer} Top Specifies the y-coordinate, in pixels.
     * @param {Integer} Width Specifies the width, in pixels.
     * @param {Integer} Height Specifies the height, in pixels.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-setsourceposition
     */
    SetSourcePosition(Left, Top, Width, Height) {
        result := ComCall(28, this, "int", Left, "int", Top, "int", Width, "int", Height, "HRESULT")
        return result
    }

    /**
     * The GetSourcePosition method retrieves the position of the source rectangle.
     * @param {Pointer<Integer>} pLeft Pointer to a variable that receives the x-coordinate, in pixels.
     * @param {Pointer<Integer>} pTop Pointer to a variable that receives the y-coordinate, in pixels.
     * @param {Pointer<Integer>} pWidth Pointer to a variable that receives the width, in pixels.
     * @param {Pointer<Integer>} pHeight Pointer to a variable that receives the height, in pixels.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-getsourceposition
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
     * The SetDefaultSourcePosition method reverts to the default source rectangle. After this method is called, the video renderer uses the entire video image, without cropping.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-setdefaultsourceposition
     */
    SetDefaultSourcePosition() {
        result := ComCall(30, this, "HRESULT")
        return result
    }

    /**
     * The SetDestinationPosition method sets the destination rectangle.
     * @param {Integer} Left Specifies the x-coordinate, in pixels.
     * @param {Integer} Top Specifies the y-coordinate, in pixels.
     * @param {Integer} Width Specifies the width, in pixels.
     * @param {Integer} Height Specifies the height, in pixels.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument. <i>Width</i> and <i>Height</i> must be larger than zero.
     * 
     * </td>
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
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-setdestinationposition
     */
    SetDestinationPosition(Left, Top, Width, Height) {
        result := ComCall(31, this, "int", Left, "int", Top, "int", Width, "int", Height, "HRESULT")
        return result
    }

    /**
     * The GetDestinationPosition method retrieves the position of the destination rectangle.
     * @param {Pointer<Integer>} pLeft Pointer to a variable that receives the x-coordinate, in pixels.
     * @param {Pointer<Integer>} pTop Pointer to a variable that receives the y-coordinate, in pixels.
     * @param {Pointer<Integer>} pWidth Pointer to a variable that receives the width, in pixels.
     * @param {Pointer<Integer>} pHeight Pointer to a variable that receives the height, in pixels.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-getdestinationposition
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
     * The SetDefaultDestinationPosition method reverts to the default destination rectangle. After this method is called, the video renderer uses the entire window for playback.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-setdefaultdestinationposition
     */
    SetDefaultDestinationPosition() {
        result := ComCall(33, this, "HRESULT")
        return result
    }

    /**
     * The GetVideoSize method retrieves the native video dimensions.
     * @param {Pointer<Integer>} pWidth Pointer to a variable that receives the width of the video image, in pixels.
     * @param {Pointer<Integer>} pHeight Pointer to a variable that receives the height of the video image, in pixels.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-getvideosize
     */
    GetVideoSize(pWidth, pHeight) {
        pWidthMarshal := pWidth is VarRef ? "int*" : "ptr"
        pHeightMarshal := pHeight is VarRef ? "int*" : "ptr"

        result := ComCall(34, this, pWidthMarshal, pWidth, pHeightMarshal, pHeight, "HRESULT")
        return result
    }

    /**
     * The GetVideoPaletteEntries method retrieves the palette colors for the video.
     * @param {Integer} StartIndex Start index for the palette.
     * @param {Integer} Entries Number of palette entries to retrieve.
     * @param {Pointer<Integer>} pRetrieved Pointer to a variable that receives the number of entries returned in <i>pPallette</i>.
     * @param {Pointer<Integer>} pPalette Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/dd162769(v=vs.85)">PALETTEENTRY</a> structures of size <i>Entries</i>. Cast the pointer to a long pointer type. The method fills the array.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NO_PALETTE_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No palette is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Video Renderer's input pin is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-getvideopaletteentries
     */
    GetVideoPaletteEntries(StartIndex, Entries, pRetrieved, pPalette) {
        pRetrievedMarshal := pRetrieved is VarRef ? "int*" : "ptr"
        pPaletteMarshal := pPalette is VarRef ? "int*" : "ptr"

        result := ComCall(35, this, "int", StartIndex, "int", Entries, pRetrievedMarshal, pRetrieved, pPaletteMarshal, pPalette, "HRESULT")
        return result
    }

    /**
     * The GetCurrentImage method retrieves the current image waiting at the renderer.
     * @param {Pointer<Integer>} pBufferSize Pointer to a variable that contains the size of the buffer that the caller is passing in. If <i>pDIBImage</i> is <b>NULL</b>, this parameter receives the required buffer size.
     * @returns {Integer} Pointer to a buffer where the complete image will be stored in device-independent bitmap (DIB) format. Cast the pointer to a long pointer type.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-getcurrentimage
     */
    GetCurrentImage(pBufferSize) {
        pBufferSizeMarshal := pBufferSize is VarRef ? "int*" : "ptr"

        result := ComCall(36, this, pBufferSizeMarshal, pBufferSize, "int*", &pDIBImage := 0, "HRESULT")
        return pDIBImage
    }

    /**
     * The IsUsingDefaultSource method queries whether the renderer is using the default source rectangle.
     * @returns {HRESULT} Returns S_OK if the renderer is using the default source rectangle, or S_FALSE otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-isusingdefaultsource
     */
    IsUsingDefaultSource() {
        result := ComCall(37, this, "HRESULT")
        return result
    }

    /**
     * The IsUsingDefaultDestination method queries whether the renderer is using the default destination rectangle.
     * @returns {HRESULT} Returns S_OK if the renderer is using the default destination rectangle, or S_FALSE otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ibasicvideo-isusingdefaultdestination
     */
    IsUsingDefaultDestination() {
        result := ComCall(38, this, "HRESULT")
        return result
    }
}
