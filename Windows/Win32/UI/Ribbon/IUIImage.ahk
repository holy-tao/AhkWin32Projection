#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IUIImage interface is implemented by the application and defines the method for retrieving an image to display in the ribbon and context popup UI of the Windows Ribbon framework .
 * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nn-uiribbon-iuiimage
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class IUIImage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIImage
     * @type {Guid}
     */
    static IID => Guid("{23c8c838-4de6-436b-ab01-5554bb7c30dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBitmap"]

    /**
     * 
     * @returns {HBITMAP} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuiimage-getbitmap
     */
    GetBitmap() {
        bitmap := HBITMAP()
        result := ComCall(3, this, "ptr", bitmap, "HRESULT")
        return bitmap
    }
}
