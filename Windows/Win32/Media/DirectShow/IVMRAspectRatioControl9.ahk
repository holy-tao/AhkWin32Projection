#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRAspectRatioControl9 interface controls whether the Video Mixing Renderer Filter 9 (VMR-9) preserves the aspect ratio of the source video.
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/nn-vmr9-ivmraspectratiocontrol9
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRAspectRatioControl9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRAspectRatioControl9
     * @type {Guid}
     */
    static IID => Guid("{00d96c29-bbde-4efc-9901-bb5036392146}")

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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmraspectratiocontrol9-getaspectratiomode
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmraspectratiocontrol9-setaspectratiomode
     */
    SetAspectRatioMode(dwARMode) {
        result := ComCall(4, this, "uint", dwARMode, "HRESULT")
        return result
    }
}
