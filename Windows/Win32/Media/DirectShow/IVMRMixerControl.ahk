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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAlpha", "GetAlpha", "SetZOrder", "GetZOrder", "SetOutputRect", "GetOutputRect", "SetBackgroundClr", "GetBackgroundClr", "SetMixingPrefs", "GetMixingPrefs"]

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Float} Alpha 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixercontrol-setalpha
     */
    SetAlpha(dwStreamID, Alpha) {
        result := ComCall(3, this, "uint", dwStreamID, "float", Alpha, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<Float>} pAlpha 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixercontrol-getalpha
     */
    GetAlpha(dwStreamID, pAlpha) {
        pAlphaMarshal := pAlpha is VarRef ? "float*" : "ptr"

        result := ComCall(4, this, "uint", dwStreamID, pAlphaMarshal, pAlpha, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Integer} dwZ 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixercontrol-setzorder
     */
    SetZOrder(dwStreamID, dwZ) {
        result := ComCall(5, this, "uint", dwStreamID, "uint", dwZ, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<Integer>} pZ 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixercontrol-getzorder
     */
    GetZOrder(dwStreamID, pZ) {
        pZMarshal := pZ is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", dwStreamID, pZMarshal, pZ, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<NORMALIZEDRECT>} pRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixercontrol-setoutputrect
     */
    SetOutputRect(dwStreamID, pRect) {
        result := ComCall(7, this, "uint", dwStreamID, "ptr", pRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<NORMALIZEDRECT>} pRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixercontrol-getoutputrect
     */
    GetOutputRect(dwStreamID, pRect) {
        result := ComCall(8, this, "uint", dwStreamID, "ptr", pRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {COLORREF} ClrBkg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixercontrol-setbackgroundclr
     */
    SetBackgroundClr(ClrBkg) {
        result := ComCall(9, this, "uint", ClrBkg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COLORREF>} lpClrBkg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixercontrol-getbackgroundclr
     */
    GetBackgroundClr(lpClrBkg) {
        result := ComCall(10, this, "ptr", lpClrBkg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMixerPrefs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixercontrol-setmixingprefs
     */
    SetMixingPrefs(dwMixerPrefs) {
        result := ComCall(11, this, "uint", dwMixerPrefs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwMixerPrefs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixercontrol-getmixingprefs
     */
    GetMixingPrefs(pdwMixerPrefs) {
        pdwMixerPrefsMarshal := pdwMixerPrefs is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pdwMixerPrefsMarshal, pdwMixerPrefs, "HRESULT")
        return result
    }
}
