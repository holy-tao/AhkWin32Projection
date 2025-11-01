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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Set", "SetDisplayType", "Retrieve", "GetNumElements", "GetElement", "AddLeafElement", "RemoveLeafElement", "CopyPath", "GetEscapedElement", "get_EscapedMode", "put_EscapedMode"]

    /**
     * 
     * @param {BSTR} bstrADsPath 
     * @param {Integer} lnSetType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspathname-set
     */
    Set(bstrADsPath, lnSetType) {
        bstrADsPath := bstrADsPath is String ? BSTR.Alloc(bstrADsPath).Value : bstrADsPath

        result := ComCall(7, this, "ptr", bstrADsPath, "int", lnSetType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnDisplayType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspathname-setdisplaytype
     */
    SetDisplayType(lnDisplayType) {
        result := ComCall(8, this, "int", lnDisplayType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnFormatType 
     * @param {Pointer<BSTR>} pbstrADsPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspathname-retrieve
     */
    Retrieve(lnFormatType, pbstrADsPath) {
        result := ComCall(9, this, "int", lnFormatType, "ptr", pbstrADsPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plnNumPathElements 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspathname-getnumelements
     */
    GetNumElements(plnNumPathElements) {
        plnNumPathElementsMarshal := plnNumPathElements is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, plnNumPathElementsMarshal, plnNumPathElements, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnElementIndex 
     * @param {Pointer<BSTR>} pbstrElement 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspathname-getelement
     */
    GetElement(lnElementIndex, pbstrElement) {
        result := ComCall(11, this, "int", lnElementIndex, "ptr", pbstrElement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrLeafElement 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspathname-addleafelement
     */
    AddLeafElement(bstrLeafElement) {
        bstrLeafElement := bstrLeafElement is String ? BSTR.Alloc(bstrLeafElement).Value : bstrLeafElement

        result := ComCall(12, this, "ptr", bstrLeafElement, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspathname-removeleafelement
     */
    RemoveLeafElement() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppAdsPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspathname-copypath
     */
    CopyPath(ppAdsPath) {
        result := ComCall(14, this, "ptr*", ppAdsPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnReserved 
     * @param {BSTR} bstrInStr 
     * @param {Pointer<BSTR>} pbstrOutStr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspathname-getescapedelement
     */
    GetEscapedElement(lnReserved, bstrInStr, pbstrOutStr) {
        bstrInStr := bstrInStr is String ? BSTR.Alloc(bstrInStr).Value : bstrInStr

        result := ComCall(15, this, "int", lnReserved, "ptr", bstrInStr, "ptr", pbstrOutStr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_EscapedMode(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnEscapedMode 
     * @returns {HRESULT} 
     */
    put_EscapedMode(lnEscapedMode) {
        result := ComCall(17, this, "int", lnEscapedMode, "HRESULT")
        return result
    }
}
