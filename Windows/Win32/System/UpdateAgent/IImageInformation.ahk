#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains information about a localized image that is associated with an update or a category.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iimageinformation
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IImageInformation extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImageInformation
     * @type {Guid}
     */
    static IID => Guid("{7c907864-346c-4aeb-8f3f-57da289f969f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AltText", "get_Height", "get_Source", "get_Width"]

    /**
     * @type {BSTR} 
     */
    AltText {
        get => this.get_AltText()
    }

    /**
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * @type {BSTR} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
    }

    /**
     * Gets the alternate text for the image.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iimageinformation-get_alttext
     */
    get_AltText() {
        retval := BSTR()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets the height of the image, in pixels.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iimageinformation-get_height
     */
    get_Height() {
        result := ComCall(8, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the source location of the image.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iimageinformation-get_source
     */
    get_Source() {
        retval := BSTR()
        result := ComCall(9, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets the width of the image, in pixels.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iimageinformation-get_width
     */
    get_Width() {
        result := ComCall(10, this, "int*", &retval := 0, "HRESULT")
        return retval
    }
}
