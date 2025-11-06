#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRFilterConfig interface is used to configure the operating mode and video rendering mechanisms of the Video Mixing Renderer Filter 7 (VMR-7).
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivmrfilterconfig
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRFilterConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRFilterConfig
     * @type {Guid}
     */
    static IID => Guid("{9e5530c5-7034-48b4-bb46-0b8a6efc8e36}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetImageCompositor", "SetNumberOfStreams", "GetNumberOfStreams", "SetRenderingPrefs", "GetRenderingPrefs", "SetRenderingMode", "GetRenderingMode"]

    /**
     * 
     * @param {IVMRImageCompositor} lpVMRImgCompositor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrfilterconfig-setimagecompositor
     */
    SetImageCompositor(lpVMRImgCompositor) {
        result := ComCall(3, this, "ptr", lpVMRImgCompositor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMaxStreams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrfilterconfig-setnumberofstreams
     */
    SetNumberOfStreams(dwMaxStreams) {
        result := ComCall(4, this, "uint", dwMaxStreams, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrfilterconfig-getnumberofstreams
     */
    GetNumberOfStreams() {
        result := ComCall(5, this, "uint*", &pdwMaxStreams := 0, "HRESULT")
        return pdwMaxStreams
    }

    /**
     * 
     * @param {Integer} dwRenderFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrfilterconfig-setrenderingprefs
     */
    SetRenderingPrefs(dwRenderFlags) {
        result := ComCall(6, this, "uint", dwRenderFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrfilterconfig-getrenderingprefs
     */
    GetRenderingPrefs() {
        result := ComCall(7, this, "uint*", &pdwRenderFlags := 0, "HRESULT")
        return pdwRenderFlags
    }

    /**
     * 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrfilterconfig-setrenderingmode
     */
    SetRenderingMode(Mode) {
        result := ComCall(8, this, "uint", Mode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrfilterconfig-getrenderingmode
     */
    GetRenderingMode() {
        result := ComCall(9, this, "uint*", &pMode := 0, "HRESULT")
        return pMode
    }
}
