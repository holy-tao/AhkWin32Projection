#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMWstDecoder interface sets and retrieves information about World Standard Teletext (WST). The WST Decoder filter implements this interface.
 * @see https://docs.microsoft.com/windows/win32/api//iwstdec/nn-iwstdec-iamwstdecoder
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMWstDecoder extends IUnknown{
    /**
     * The interface identifier for IAMWstDecoder
     * @type {Guid}
     */
    static IID => Guid("{c056de21-75c2-11d3-a184-00105aef9f33}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} lpLevel 
     * @returns {HRESULT} 
     */
    GetDecoderLevel(lpLevel) {
        result := ComCall(3, this, "int*", lpLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lpService 
     * @returns {HRESULT} 
     */
    GetCurrentService(lpService) {
        result := ComCall(4, this, "int*", lpService, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lpState 
     * @returns {HRESULT} 
     */
    GetServiceState(lpState) {
        result := ComCall(5, this, "int*", lpState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} State 
     * @returns {HRESULT} 
     */
    SetServiceState(State) {
        result := ComCall(6, this, "int", State, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BITMAPINFOHEADER>} lpbmih 
     * @returns {HRESULT} 
     */
    GetOutputFormat(lpbmih) {
        result := ComCall(7, this, "ptr", lpbmih, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BITMAPINFO>} lpbmi 
     * @returns {HRESULT} 
     */
    SetOutputFormat(lpbmi) {
        result := ComCall(8, this, "ptr", lpbmi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwPhysColor 
     * @returns {HRESULT} 
     */
    GetBackgroundColor(pdwPhysColor) {
        result := ComCall(9, this, "uint*", pdwPhysColor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwPhysColor 
     * @returns {HRESULT} 
     */
    SetBackgroundColor(dwPhysColor) {
        result := ComCall(10, this, "uint", dwPhysColor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} lpbOption 
     * @returns {HRESULT} 
     */
    GetRedrawAlways(lpbOption) {
        result := ComCall(11, this, "ptr", lpbOption, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bOption 
     * @returns {HRESULT} 
     */
    SetRedrawAlways(bOption) {
        result := ComCall(12, this, "int", bOption, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lpMode 
     * @returns {HRESULT} 
     */
    GetDrawBackgroundMode(lpMode) {
        result := ComCall(13, this, "int*", lpMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     */
    SetDrawBackgroundMode(Mode) {
        result := ComCall(14, this, "int", Mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bAnswer 
     * @returns {HRESULT} 
     */
    SetAnswerMode(bAnswer) {
        result := ComCall(15, this, "int", bAnswer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbAnswer 
     * @returns {HRESULT} 
     */
    GetAnswerMode(pbAnswer) {
        result := ComCall(16, this, "ptr", pbAnswer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bHoldPage 
     * @returns {HRESULT} 
     */
    SetHoldPage(bHoldPage) {
        result := ComCall(17, this, "int", bHoldPage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbHoldPage 
     * @returns {HRESULT} 
     */
    GetHoldPage(pbHoldPage) {
        result := ComCall(18, this, "ptr", pbHoldPage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<AM_WST_PAGE>} pWstPage 
     * @returns {HRESULT} 
     */
    GetCurrentPage(pWstPage) {
        result := ComCall(19, this, "ptr", pWstPage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {AM_WST_PAGE} WstPage 
     * @returns {HRESULT} 
     */
    SetCurrentPage(WstPage) {
        result := ComCall(20, this, "ptr", WstPage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
