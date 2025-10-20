#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMLine21Decoder interface sets and retrieves information about closed captions.The Line 21 Decoder filter exposes this interface.
 * @see https://docs.microsoft.com/windows/win32/api//il21dec/nn-il21dec-iamline21decoder
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMLine21Decoder extends IUnknown{
    /**
     * The interface identifier for IAMLine21Decoder
     * @type {Guid}
     */
    static IID => Guid("{6e8d4a21-310c-11d0-b79a-00aa003767a7}")

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
     * @param {Integer} Service 
     * @returns {HRESULT} 
     */
    SetCurrentService(Service) {
        result := ComCall(5, this, "int", Service, "int")
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
        result := ComCall(6, this, "int*", lpState, "int")
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
        result := ComCall(7, this, "int", State, "int")
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
        result := ComCall(8, this, "ptr", lpbmih, "int")
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
        result := ComCall(9, this, "ptr", lpbmi, "int")
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
        result := ComCall(10, this, "uint*", pdwPhysColor, "int")
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
        result := ComCall(11, this, "uint", dwPhysColor, "int")
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
        result := ComCall(12, this, "ptr", lpbOption, "int")
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
        result := ComCall(13, this, "int", bOption, "int")
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
        result := ComCall(14, this, "int*", lpMode, "int")
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
        result := ComCall(15, this, "int", Mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
