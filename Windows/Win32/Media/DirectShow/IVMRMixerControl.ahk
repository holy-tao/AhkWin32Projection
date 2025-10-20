#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRMixerControl interface is enables an application to manipulate the incoming video streams on the Video Mixing Renderer Filter 7 (VMR-7).
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivmrmixercontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRMixerControl extends IUnknown{
    /**
     * The interface identifier for IVMRMixerControl
     * @type {Guid}
     */
    static IID => Guid("{1c1a17b0-bed0-415d-974b-dc6696131599}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Float} Alpha 
     * @returns {HRESULT} 
     */
    SetAlpha(dwStreamID, Alpha) {
        result := ComCall(3, this, "uint", dwStreamID, "float", Alpha, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<Single>} pAlpha 
     * @returns {HRESULT} 
     */
    GetAlpha(dwStreamID, pAlpha) {
        result := ComCall(4, this, "uint", dwStreamID, "float*", pAlpha, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Integer} dwZ 
     * @returns {HRESULT} 
     */
    SetZOrder(dwStreamID, dwZ) {
        result := ComCall(5, this, "uint", dwStreamID, "uint", dwZ, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<UInt32>} pZ 
     * @returns {HRESULT} 
     */
    GetZOrder(dwStreamID, pZ) {
        result := ComCall(6, this, "uint", dwStreamID, "uint*", pZ, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<NORMALIZEDRECT>} pRect 
     * @returns {HRESULT} 
     */
    SetOutputRect(dwStreamID, pRect) {
        result := ComCall(7, this, "uint", dwStreamID, "ptr", pRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<NORMALIZEDRECT>} pRect 
     * @returns {HRESULT} 
     */
    GetOutputRect(dwStreamID, pRect) {
        result := ComCall(8, this, "uint", dwStreamID, "ptr", pRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {COLORREF} ClrBkg 
     * @returns {HRESULT} 
     */
    SetBackgroundClr(ClrBkg) {
        result := ComCall(9, this, "uint", ClrBkg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COLORREF>} lpClrBkg 
     * @returns {HRESULT} 
     */
    GetBackgroundClr(lpClrBkg) {
        result := ComCall(10, this, "ptr", lpClrBkg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMixerPrefs 
     * @returns {HRESULT} 
     */
    SetMixingPrefs(dwMixerPrefs) {
        result := ComCall(11, this, "uint", dwMixerPrefs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwMixerPrefs 
     * @returns {HRESULT} 
     */
    GetMixingPrefs(pdwMixerPrefs) {
        result := ComCall(12, this, "uint*", pdwMixerPrefs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
