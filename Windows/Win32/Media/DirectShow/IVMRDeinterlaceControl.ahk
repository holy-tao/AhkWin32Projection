#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRDeinterlaceControl interface provides support for advanced hardware-accelerated deinterlacing using the Video Mixing Renderer Filter 7 (VMR-7).
 * @remarks
 * 
  * This interface is applicable only when the VMR is in mixer mode. All methods in this interface return VFW_E_VMR_NOT_IN_MIXER_MODE if the VMR is not in mixer mode.
  * 
  * Deinterlacing modes are identified by GUIDs. The graphics device driver returns an array of GUIDs for the modes that it supports. The array is sorted in order of quality, from best quality to lowest quality. To retrieve the list of GUIDs, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ivmrdeinterlacecontrol-getnumberofdeinterlacemodes">GetNumberOfDeinterlaceModes</a> method. To obtain more information about a particular mode, pass this GUID to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ivmrdeinterlacecontrol-getdeinterlacemodecaps">GetDeinterlaceModeCaps</a> method. To configure the VMR to use a particular mode, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ivmrdeinterlacecontrol-setdeinterlacemode">SetDeinterlaceMode</a> method.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivmrdeinterlacecontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRDeinterlaceControl extends IUnknown{
    /**
     * The interface identifier for IVMRDeinterlaceControl
     * @type {Guid}
     */
    static IID => Guid("{bb057577-0db8-4e6a-87a7-1a8c9a505a0f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<VMRVideoDesc>} lpVideoDescription 
     * @param {Pointer<UInt32>} lpdwNumDeinterlaceModes 
     * @param {Pointer<Guid>} lpDeinterlaceModes 
     * @returns {HRESULT} 
     */
    GetNumberOfDeinterlaceModes(lpVideoDescription, lpdwNumDeinterlaceModes, lpDeinterlaceModes) {
        result := ComCall(3, this, "ptr", lpVideoDescription, "uint*", lpdwNumDeinterlaceModes, "ptr", lpDeinterlaceModes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} lpDeinterlaceMode 
     * @param {Pointer<VMRVideoDesc>} lpVideoDescription 
     * @param {Pointer<VMRDeinterlaceCaps>} lpDeinterlaceCaps 
     * @returns {HRESULT} 
     */
    GetDeinterlaceModeCaps(lpDeinterlaceMode, lpVideoDescription, lpDeinterlaceCaps) {
        result := ComCall(4, this, "ptr", lpDeinterlaceMode, "ptr", lpVideoDescription, "ptr", lpDeinterlaceCaps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<Guid>} lpDeinterlaceMode 
     * @returns {HRESULT} 
     */
    GetDeinterlaceMode(dwStreamID, lpDeinterlaceMode) {
        result := ComCall(5, this, "uint", dwStreamID, "ptr", lpDeinterlaceMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<Guid>} lpDeinterlaceMode 
     * @returns {HRESULT} 
     */
    SetDeinterlaceMode(dwStreamID, lpDeinterlaceMode) {
        result := ComCall(6, this, "uint", dwStreamID, "ptr", lpDeinterlaceMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} lpdwDeinterlacePrefs 
     * @returns {HRESULT} 
     */
    GetDeinterlacePrefs(lpdwDeinterlacePrefs) {
        result := ComCall(7, this, "uint*", lpdwDeinterlacePrefs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwDeinterlacePrefs 
     * @returns {HRESULT} 
     */
    SetDeinterlacePrefs(dwDeinterlacePrefs) {
        result := ComCall(8, this, "uint", dwDeinterlacePrefs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<Guid>} lpDeinterlaceMode 
     * @returns {HRESULT} 
     */
    GetActualDeinterlaceMode(dwStreamID, lpDeinterlaceMode) {
        result := ComCall(9, this, "uint", dwStreamID, "ptr", lpDeinterlaceMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
