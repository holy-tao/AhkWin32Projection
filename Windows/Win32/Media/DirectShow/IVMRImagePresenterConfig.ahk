#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRImagePresenterConfig interface provides methods for setting the renderering preferences on the allocator-presenter used by the Video Mixing Renderer Filter 7 (VMR-7).Applications should not use this interface directly.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivmrimagepresenterconfig
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRImagePresenterConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRImagePresenterConfig
     * @type {Guid}
     */
    static IID => Guid("{9f3a1c85-8555-49ba-935f-be5b5b29d178}")

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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrimagepresenterconfig-setrenderingprefs
     */
    SetRenderingPrefs(dwRenderFlags) {
        result := ComCall(3, this, "uint", dwRenderFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} dwRenderFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrimagepresenterconfig-getrenderingprefs
     */
    GetRenderingPrefs(dwRenderFlags) {
        result := ComCall(4, this, "uint*", dwRenderFlags, "HRESULT")
        return result
    }
}
