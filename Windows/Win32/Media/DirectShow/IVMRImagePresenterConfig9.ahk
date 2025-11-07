#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRImagePresenterConfig interface provides methods for setting the renderering preferences on the allocator-presenter used by the Video Mixing Renderer Filter 9 (VMR-9).Applications should not use this interface directly.
 * @remarks
 * 
 * Include DShow.h and D3d9.h before Vmr9.h.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/nn-vmr9-ivmrimagepresenterconfig9
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRImagePresenterConfig9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRImagePresenterConfig9
     * @type {Guid}
     */
    static IID => Guid("{45c15cab-6e22-420a-8043-ae1f0ac02c7d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetRenderingPrefs", "GetRenderingPrefs"]

    /**
     * 
     * @param {Integer} dwRenderFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrimagepresenterconfig9-setrenderingprefs
     */
    SetRenderingPrefs(dwRenderFlags) {
        result := ComCall(3, this, "uint", dwRenderFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrimagepresenterconfig9-getrenderingprefs
     */
    GetRenderingPrefs() {
        result := ComCall(4, this, "uint*", &dwRenderFlags := 0, "HRESULT")
        return dwRenderFlags
    }
}
