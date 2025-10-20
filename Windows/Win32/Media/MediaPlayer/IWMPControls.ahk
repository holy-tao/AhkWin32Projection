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
     * 
     * @param {BSTR} bstrItem 
     * @param {Pointer<VARIANT_BOOL>} pIsAvailable 
     * @returns {HRESULT} 
     */
    get_isAvailable(bstrItem, pIsAvailable) {
        bstrItem := bstrItem is String ? BSTR.Alloc(bstrItem).Value : bstrItem

        result := ComCall(7, this, "ptr", bstrItem, "ptr", pIsAvailable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    play() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    stop() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    pause() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    fastForward() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    fastReverse() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pdCurrentPosition 
     * @returns {HRESULT} 
     */
    get_currentPosition(pdCurrentPosition) {
        result := ComCall(13, this, "double*", pdCurrentPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} dCurrentPosition 
     * @returns {HRESULT} 
     */
    put_currentPosition(dCurrentPosition) {
        result := ComCall(14, this, "double", dCurrentPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCurrentPosition 
     * @returns {HRESULT} 
     */
    get_currentPositionString(pbstrCurrentPosition) {
        result := ComCall(15, this, "ptr", pbstrCurrentPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    next() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    previous() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPMedia>} ppIWMPMedia 
     * @returns {HRESULT} 
     */
    get_currentItem(ppIWMPMedia) {
        result := ComCall(18, this, "ptr", ppIWMPMedia, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPMedia>} pIWMPMedia 
     * @returns {HRESULT} 
     */
    put_currentItem(pIWMPMedia) {
        result := ComCall(19, this, "ptr", pIWMPMedia, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMarker 
     * @returns {HRESULT} 
     */
    get_currentMarker(plMarker) {
        result := ComCall(20, this, "int*", plMarker, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lMarker 
     * @returns {HRESULT} 
     */
    put_currentMarker(lMarker) {
        result := ComCall(21, this, "int", lMarker, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPMedia>} pIWMPMedia 
     * @returns {HRESULT} 
     */
    playItem(pIWMPMedia) {
        result := ComCall(22, this, "ptr", pIWMPMedia, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
