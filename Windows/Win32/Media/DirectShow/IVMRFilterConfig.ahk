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
     * 
     * @param {Pointer<IVMRImageCompositor>} lpVMRImgCompositor 
     * @returns {HRESULT} 
     */
    SetImageCompositor(lpVMRImgCompositor) {
        result := ComCall(3, this, "ptr", lpVMRImgCompositor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMaxStreams 
     * @returns {HRESULT} 
     */
    SetNumberOfStreams(dwMaxStreams) {
        result := ComCall(4, this, "uint", dwMaxStreams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwMaxStreams 
     * @returns {HRESULT} 
     */
    GetNumberOfStreams(pdwMaxStreams) {
        result := ComCall(5, this, "uint*", pdwMaxStreams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRenderFlags 
     * @returns {HRESULT} 
     */
    SetRenderingPrefs(dwRenderFlags) {
        result := ComCall(6, this, "uint", dwRenderFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwRenderFlags 
     * @returns {HRESULT} 
     */
    GetRenderingPrefs(pdwRenderFlags) {
        result := ComCall(7, this, "uint*", pdwRenderFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     */
    SetRenderingMode(Mode) {
        result := ComCall(8, this, "uint", Mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pMode 
     * @returns {HRESULT} 
     */
    GetRenderingMode(pMode) {
        result := ComCall(9, this, "uint*", pMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
