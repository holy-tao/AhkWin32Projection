#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPControls interface provides a way to manipulate the playback of a media item.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpcontrols
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPControls extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPControls
     * @type {Guid}
     */
    static IID => Guid("{74c09e02-f828-11d2-a74b-00a0c905f36e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_isAvailable", "play", "stop", "pause", "fastForward", "fastReverse", "get_currentPosition", "put_currentPosition", "get_currentPositionString", "next", "previous", "get_currentItem", "put_currentItem", "get_currentMarker", "put_currentMarker", "playItem"]

    /**
     * 
     * @param {BSTR} bstrItem 
     * @param {Pointer<VARIANT_BOOL>} pIsAvailable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-get_isavailable
     */
    get_isAvailable(bstrItem, pIsAvailable) {
        bstrItem := bstrItem is String ? BSTR.Alloc(bstrItem).Value : bstrItem

        result := ComCall(7, this, "ptr", bstrItem, "ptr", pIsAvailable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-play
     */
    play() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-stop
     */
    stop() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-pause
     */
    pause() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-fastforward
     */
    fastForward() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-fastreverse
     */
    fastReverse() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pdCurrentPosition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-get_currentposition
     */
    get_currentPosition(pdCurrentPosition) {
        result := ComCall(13, this, "double*", pdCurrentPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} dCurrentPosition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-put_currentposition
     */
    put_currentPosition(dCurrentPosition) {
        result := ComCall(14, this, "double", dCurrentPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCurrentPosition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-get_currentpositionstring
     */
    get_currentPositionString(pbstrCurrentPosition) {
        result := ComCall(15, this, "ptr", pbstrCurrentPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-next
     */
    next() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-previous
     */
    previous() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWMPMedia>} ppIWMPMedia 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-get_currentitem
     */
    get_currentItem(ppIWMPMedia) {
        result := ComCall(18, this, "ptr*", ppIWMPMedia, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPMedia} pIWMPMedia 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-put_currentitem
     */
    put_currentItem(pIWMPMedia) {
        result := ComCall(19, this, "ptr", pIWMPMedia, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMarker 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-get_currentmarker
     */
    get_currentMarker(plMarker) {
        result := ComCall(20, this, "int*", plMarker, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lMarker 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-put_currentmarker
     */
    put_currentMarker(lMarker) {
        result := ComCall(21, this, "int", lMarker, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPMedia} pIWMPMedia 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcontrols-playitem
     */
    playItem(pIWMPMedia) {
        result := ComCall(22, this, "ptr", pIWMPMedia, "HRESULT")
        return result
    }
}
