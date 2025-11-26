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
     * The SetRenderingPrefs method sets the rendering preferences on the VMR-7 filter's allocator-presenter.
     * @param {Integer} dwRenderFlags A bitwise OR combination of <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmrrenderprefs">VMRRenderPrefs</a> flags that will be used to configure the allocator-presenter.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrimagepresenterconfig-setrenderingprefs
     */
    SetRenderingPrefs(dwRenderFlags) {
        result := ComCall(3, this, "uint", dwRenderFlags, "HRESULT")
        return result
    }

    /**
     * The GetRenderingPrefs method retrieves the current rendering preferences from the VMR-7 filter's allocator-presenter.
     * @returns {Integer} Receives a bitwise OR of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmrrenderprefs">VMRRenderPrefs</a> enumeration, indicating the current rendering settings on the allocator-presenter.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrimagepresenterconfig-getrenderingprefs
     */
    GetRenderingPrefs() {
        result := ComCall(4, this, "uint*", &dwRenderFlags := 0, "HRESULT")
        return dwRenderFlags
    }
}
