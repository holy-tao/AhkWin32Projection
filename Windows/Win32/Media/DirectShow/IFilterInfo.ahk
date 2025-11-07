#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IFilterInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFilterInfo
     * @type {Guid}
     */
    static IID => Guid("{56a868ba-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindPin", "get_Name", "get_VendorInfo", "get_Filter", "get_Pins", "get_IsFileSource", "get_Filename", "put_Filename"]

    /**
     * 
     * @param {BSTR} strPinID 
     * @returns {IDispatch} 
     */
    FindPin(strPinID) {
        strPinID := strPinID is String ? BSTR.Alloc(strPinID).Value : strPinID

        result := ComCall(7, this, "ptr", strPinID, "ptr*", &ppUnk := 0, "HRESULT")
        return IDispatch(ppUnk)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        strName := BSTR()
        result := ComCall(8, this, "ptr", strName, "HRESULT")
        return strName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_VendorInfo() {
        strVendorInfo := BSTR()
        result := ComCall(9, this, "ptr", strVendorInfo, "HRESULT")
        return strVendorInfo
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get_Filter() {
        result := ComCall(10, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Pins() {
        result := ComCall(11, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IDispatch(ppUnk)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IsFileSource() {
        result := ComCall(12, this, "int*", &pbIsSource := 0, "HRESULT")
        return pbIsSource
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Filename() {
        pstrFilename := BSTR()
        result := ComCall(13, this, "ptr", pstrFilename, "HRESULT")
        return pstrFilename
    }

    /**
     * 
     * @param {BSTR} strFilename 
     * @returns {HRESULT} 
     */
    put_Filename(strFilename) {
        strFilename := strFilename is String ? BSTR.Alloc(strFilename).Value : strFilename

        result := ComCall(14, this, "ptr", strFilename, "HRESULT")
        return result
    }
}
