#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRMixerControl9 interface enables an application to manipulate the incoming video streams on the Video Mixing Renderer Filter 9 (VMR-9). This interface is intended for use by applications only; it should not be used by upstream filters.
 * @remarks
 * 
  * The VMR-9 supports this interface in mixing mode only. To enable mixing mode, call <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrfilterconfig9-setnumberofstreams">IVMRFilterConfig9::SetNumberOfStreams</a>. Otherwise, <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> returns <b>E_NOINTERFACE</b>. 
  * 
  * Include DShow.h and D3d9.h before Vmr9.h.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/nn-vmr9-ivmrmixercontrol9
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRMixerControl9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRMixerControl9
     * @type {Guid}
     */
    static IID => Guid("{1a777eaa-47c8-4930-b2c9-8fee1c1b0f3b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAlpha", "GetAlpha", "SetZOrder", "GetZOrder", "SetOutputRect", "GetOutputRect", "SetBackgroundClr", "GetBackgroundClr", "SetMixingPrefs", "GetMixingPrefs", "SetProcAmpControl", "GetProcAmpControl", "GetProcAmpControlRange"]

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Float} Alpha 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-setalpha
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-getalpha
     */
    GetAlpha(dwStreamID, pAlpha) {
        result := ComCall(4, this, "uint", dwStreamID, "float*", pAlpha, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Integer} dwZ 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-setzorder
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-getzorder
     */
    GetZOrder(dwStreamID, pZ) {
        result := ComCall(6, this, "uint", dwStreamID, "uint*", pZ, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<VMR9NormalizedRect>} pRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-setoutputrect
     */
    SetOutputRect(dwStreamID, pRect) {
        result := ComCall(7, this, "uint", dwStreamID, "ptr", pRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<VMR9NormalizedRect>} pRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-getoutputrect
     */
    GetOutputRect(dwStreamID, pRect) {
        result := ComCall(8, this, "uint", dwStreamID, "ptr", pRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {COLORREF} ClrBkg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-setbackgroundclr
     */
    SetBackgroundClr(ClrBkg) {
        result := ComCall(9, this, "uint", ClrBkg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COLORREF>} lpClrBkg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-getbackgroundclr
     */
    GetBackgroundClr(lpClrBkg) {
        result := ComCall(10, this, "ptr", lpClrBkg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMixerPrefs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-setmixingprefs
     */
    SetMixingPrefs(dwMixerPrefs) {
        result := ComCall(11, this, "uint", dwMixerPrefs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwMixerPrefs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-getmixingprefs
     */
    GetMixingPrefs(pdwMixerPrefs) {
        result := ComCall(12, this, "uint*", pdwMixerPrefs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<VMR9ProcAmpControl>} lpClrControl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-setprocampcontrol
     */
    SetProcAmpControl(dwStreamID, lpClrControl) {
        result := ComCall(13, this, "uint", dwStreamID, "ptr", lpClrControl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<VMR9ProcAmpControl>} lpClrControl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-getprocampcontrol
     */
    GetProcAmpControl(dwStreamID, lpClrControl) {
        result := ComCall(14, this, "uint", dwStreamID, "ptr", lpClrControl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<VMR9ProcAmpControlRange>} lpClrControl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmixercontrol9-getprocampcontrolrange
     */
    GetProcAmpControlRange(dwStreamID, lpClrControl) {
        result := ComCall(15, this, "uint", dwStreamID, "ptr", lpClrControl, "HRESULT")
        return result
    }
}
