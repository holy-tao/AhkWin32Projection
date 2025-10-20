#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IUIImage interface is implemented by the application and defines the method for retrieving an image to display in the ribbon and context popup UI of the Windows Ribbon framework .
 * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nn-uiribbon-iuiimage
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class IUIImage extends IUnknown{
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
     * 
     * @param {Pointer<HBITMAP>} bitmap 
     * @returns {HRESULT} 
     */
    GetBitmap(bitmap) {
        result := ComCall(3, this, "ptr", bitmap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
