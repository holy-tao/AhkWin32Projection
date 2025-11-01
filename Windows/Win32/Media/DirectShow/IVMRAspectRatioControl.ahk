#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRAspectRatioControl interface controls whether the Video Mixing Renderer Filter 7 (VMR-7) preserves the aspect ratio of the source video.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivmraspectratiocontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRAspectRatioControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRAspectRatioControl
     * @type {Guid}
     */
    static IID => Guid("{ede80b5c-bad6-4623-b537-65586c9f8dfd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAspectRatioMode", "SetAspectRatioMode"]

    /**
     * 
     * @param {Pointer<Integer>} lpdwARMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmraspectratiocontrol-getaspectratiomode
     */
    GetAspectRatioMode(lpdwARMode) {
        lpdwARModeMarshal := lpdwARMode is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, lpdwARModeMarshal, lpdwARMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwARMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmraspectratiocontrol-setaspectratiomode
     */
    SetAspectRatioMode(dwARMode) {
        result := ComCall(4, this, "uint", dwARMode, "HRESULT")
        return result
    }
}
