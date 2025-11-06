#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRFilterConfig9 interface is implemented by the Video Mixing Renderer Filter 9.
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/nn-vmr9-ivmrfilterconfig9
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRFilterConfig9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRFilterConfig9
     * @type {Guid}
     */
    static IID => Guid("{5a804648-4f66-4867-9c43-4f5c822cf1b8}")

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
     * @param {IVMRImageCompositor9} lpVMRImgCompositor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrfilterconfig9-setimagecompositor
     */
    SetImageCompositor(lpVMRImgCompositor) {
        result := ComCall(3, this, "ptr", lpVMRImgCompositor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMaxStreams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrfilterconfig9-setnumberofstreams
     */
    SetNumberOfStreams(dwMaxStreams) {
        result := ComCall(4, this, "uint", dwMaxStreams, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrfilterconfig9-getnumberofstreams
     */
    GetNumberOfStreams() {
        result := ComCall(5, this, "uint*", &pdwMaxStreams := 0, "HRESULT")
        return pdwMaxStreams
    }

    /**
     * 
     * @param {Integer} dwRenderFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrfilterconfig9-setrenderingprefs
     */
    SetRenderingPrefs(dwRenderFlags) {
        result := ComCall(6, this, "uint", dwRenderFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrfilterconfig9-getrenderingprefs
     */
    GetRenderingPrefs() {
        result := ComCall(7, this, "uint*", &pdwRenderFlags := 0, "HRESULT")
        return pdwRenderFlags
    }

    /**
     * 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrfilterconfig9-setrenderingmode
     */
    SetRenderingMode(Mode) {
        result := ComCall(8, this, "uint", Mode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrfilterconfig9-getrenderingmode
     */
    GetRenderingMode() {
        result := ComCall(9, this, "uint*", &pMode := 0, "HRESULT")
        return pMode
    }
}
