#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

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
     * @param {Pointer<IDispatch>} ppUnk 
     * @returns {HRESULT} 
     */
    FindPin(strPinID, ppUnk) {
        strPinID := strPinID is String ? BSTR.Alloc(strPinID).Value : strPinID

        result := ComCall(7, this, "ptr", strPinID, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strName 
     * @returns {HRESULT} 
     */
    get_Name(strName) {
        result := ComCall(8, this, "ptr", strName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strVendorInfo 
     * @returns {HRESULT} 
     */
    get_VendorInfo(strVendorInfo) {
        result := ComCall(9, this, "ptr", strVendorInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    get_Filter(ppUnk) {
        result := ComCall(10, this, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppUnk 
     * @returns {HRESULT} 
     */
    get_Pins(ppUnk) {
        result := ComCall(11, this, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbIsSource 
     * @returns {HRESULT} 
     */
    get_IsFileSource(pbIsSource) {
        pbIsSourceMarshal := pbIsSource is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pbIsSourceMarshal, pbIsSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pstrFilename 
     * @returns {HRESULT} 
     */
    get_Filename(pstrFilename) {
        result := ComCall(13, this, "ptr", pstrFilename, "HRESULT")
        return result
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
