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
     * 
     * @param {BSTR} strPinID 
     * @param {Pointer<IDispatch>} ppUnk 
     * @returns {HRESULT} 
     */
    FindPin(strPinID, ppUnk) {
        strPinID := strPinID is String ? BSTR.Alloc(strPinID).Value : strPinID

        result := ComCall(7, this, "ptr", strPinID, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strName 
     * @returns {HRESULT} 
     */
    get_Name(strName) {
        result := ComCall(8, this, "ptr", strName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strVendorInfo 
     * @returns {HRESULT} 
     */
    get_VendorInfo(strVendorInfo) {
        result := ComCall(9, this, "ptr", strVendorInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    get_Filter(ppUnk) {
        result := ComCall(10, this, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppUnk 
     * @returns {HRESULT} 
     */
    get_Pins(ppUnk) {
        result := ComCall(11, this, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pbIsSource 
     * @returns {HRESULT} 
     */
    get_IsFileSource(pbIsSource) {
        result := ComCall(12, this, "int*", pbIsSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pstrFilename 
     * @returns {HRESULT} 
     */
    get_Filename(pstrFilename) {
        result := ComCall(13, this, "ptr", pstrFilename, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strFilename 
     * @returns {HRESULT} 
     */
    put_Filename(strFilename) {
        strFilename := strFilename is String ? BSTR.Alloc(strFilename).Value : strFilename

        result := ComCall(14, this, "ptr", strFilename, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
