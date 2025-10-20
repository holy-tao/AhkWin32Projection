#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Parses the X.500 and Windows path in ADSI.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadspathname
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsPathname extends IDispatch{
    /**
     * The interface identifier for IADsPathname
     * @type {Guid}
     */
    static IID => Guid("{d592aed4-f420-11d0-a36e-00c04fb950dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {BSTR} bstrADsPath 
     * @param {Integer} lnSetType 
     * @returns {HRESULT} 
     */
    Set(bstrADsPath, lnSetType) {
        bstrADsPath := bstrADsPath is String ? BSTR.Alloc(bstrADsPath).Value : bstrADsPath

        result := ComCall(7, this, "ptr", bstrADsPath, "int", lnSetType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lnDisplayType 
     * @returns {HRESULT} 
     */
    SetDisplayType(lnDisplayType) {
        result := ComCall(8, this, "int", lnDisplayType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lnFormatType 
     * @param {Pointer<BSTR>} pbstrADsPath 
     * @returns {HRESULT} 
     */
    Retrieve(lnFormatType, pbstrADsPath) {
        result := ComCall(9, this, "int", lnFormatType, "ptr", pbstrADsPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plnNumPathElements 
     * @returns {HRESULT} 
     */
    GetNumElements(plnNumPathElements) {
        result := ComCall(10, this, "int*", plnNumPathElements, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lnElementIndex 
     * @param {Pointer<BSTR>} pbstrElement 
     * @returns {HRESULT} 
     */
    GetElement(lnElementIndex, pbstrElement) {
        result := ComCall(11, this, "int", lnElementIndex, "ptr", pbstrElement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrLeafElement 
     * @returns {HRESULT} 
     */
    AddLeafElement(bstrLeafElement) {
        bstrLeafElement := bstrLeafElement is String ? BSTR.Alloc(bstrLeafElement).Value : bstrLeafElement

        result := ComCall(12, this, "ptr", bstrLeafElement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveLeafElement() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppAdsPath 
     * @returns {HRESULT} 
     */
    CopyPath(ppAdsPath) {
        result := ComCall(14, this, "ptr", ppAdsPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lnReserved 
     * @param {BSTR} bstrInStr 
     * @param {Pointer<BSTR>} pbstrOutStr 
     * @returns {HRESULT} 
     */
    GetEscapedElement(lnReserved, bstrInStr, pbstrOutStr) {
        bstrInStr := bstrInStr is String ? BSTR.Alloc(bstrInStr).Value : bstrInStr

        result := ComCall(15, this, "int", lnReserved, "ptr", bstrInStr, "ptr", pbstrOutStr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_EscapedMode(retval) {
        result := ComCall(16, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lnEscapedMode 
     * @returns {HRESULT} 
     */
    put_EscapedMode(lnEscapedMode) {
        result := ComCall(17, this, "int", lnEscapedMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
