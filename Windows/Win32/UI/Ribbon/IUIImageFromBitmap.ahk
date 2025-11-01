#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * IUIImageFromBitmap is a factory interface implemented by the Windows Ribbon framework that defines the method for creating an IUIImage object.
 * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nn-uiribbon-iuiimagefrombitmap
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class IUIImageFromBitmap extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIImageFromBitmap
     * @type {Guid}
     */
    static IID => Guid("{18aba7f3-4c1c-4ba2-bf6c-f5c3326fa816}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateImage"]

    /**
     * 
     * @param {HBITMAP} bitmap 
     * @param {Integer} options 
     * @param {Pointer<IUIImage>} image 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuiimagefrombitmap-createimage
     */
    CreateImage(bitmap, options, image) {
        bitmap := bitmap is Win32Handle ? NumGet(bitmap, "ptr") : bitmap

        result := ComCall(3, this, "ptr", bitmap, "int", options, "ptr*", image, "HRESULT")
        return result
    }
}
