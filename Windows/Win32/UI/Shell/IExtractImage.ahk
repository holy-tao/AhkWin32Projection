#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that request a thumbnail image from a Shell folder.
 * @remarks
 * 
  * There are two steps in the process: First, use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iextractimage-getlocation">GetLocation</a> to request the path description of an image and specify how the image should be rendered. Then, call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iextractimage-extract">Extract</a> to extract the image.
  * 
  * If the object is free-threaded it must also expose an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-irunnabletask">IRunnableTask</a> interface so it can be stopped and started as needed. This feature can be particularly useful when extraction may be slow.
  * 
  * Implement <b>IExtractImage</b> if your namespace extension needs to provide thumbnail images to be displayed in a Shellview.
  * 
  * Use <b>IExtractImage</b> if you are implementing a view of namespace objects, and want to display thumbnail images. You can use a Shell folder's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getuiobjectof">IShellFolder::GetUIObjectOf</a> method to bind to its <b>IExtractImage</b> interface.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iextractimage
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IExtractImage extends IUnknown{
    /**
     * The interface identifier for IExtractImage
     * @type {Guid}
     */
    static IID => Guid("{bb2e617c-0920-11d1-9a0b-00c04fc2d6c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszPathBuffer 
     * @param {Integer} cch 
     * @param {Pointer<UInt32>} pdwPriority 
     * @param {Pointer<SIZE>} prgSize 
     * @param {Integer} dwRecClrDepth 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetLocation(pszPathBuffer, cch, pdwPriority, prgSize, dwRecClrDepth, pdwFlags) {
        pszPathBuffer := pszPathBuffer is String ? StrPtr(pszPathBuffer) : pszPathBuffer

        result := ComCall(3, this, "ptr", pszPathBuffer, "uint", cch, "uint*", pdwPriority, "ptr", prgSize, "uint", dwRecClrDepth, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HBITMAP>} phBmpThumbnail 
     * @returns {HRESULT} 
     */
    Extract(phBmpThumbnail) {
        result := ComCall(4, this, "ptr", phBmpThumbnail, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
