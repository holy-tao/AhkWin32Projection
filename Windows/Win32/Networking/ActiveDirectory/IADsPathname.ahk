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
     * @type {Integer} 
     */
    EscapedMode {
        get => this.get_EscapedMode()
        set => this.put_EscapedMode(value)
    }

    /**
     * Sets up the Pathname object for parsing a directory path.
     * @param {BSTR} bstrADsPath Path of an ADSI object.
     * @param {Integer} lnSetType An <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_settype_enum">ADS_SETTYPE_ENUM</a> option that defines the format type to be retrieved.
     * @returns {HRESULT} This method supports the standard return values, as well as the following:
     * 
     * For more information and other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadspathname-set
     */
    Set(bstrADsPath, lnSetType) {
        bstrADsPath := bstrADsPath is String ? BSTR.Alloc(bstrADsPath).Value : bstrADsPath

        result := ComCall(7, this, "ptr", bstrADsPath, "int", lnSetType, "HRESULT")
        return result
    }

    /**
     * Specifies how to display the path of an object.
     * @param {Integer} lnDisplayType The display type of a path  as defined in  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_display_enum">ADS_DISPLAY_ENUM</a>.
     * @returns {HRESULT} This method supports the standard return values, including the following:
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadspathname-setdisplaytype
     */
    SetDisplayType(lnDisplayType) {
        result := ComCall(8, this, "int", lnDisplayType, "HRESULT")
        return result
    }

    /**
     * The IADsPathname::Retrieve method retrieves the path of the object with different format types.
     * @param {Integer} lnFormatType Specifies the format that the path should be retrieved in. This can be one of the values specified in the <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_format_enum">ADS_FORMAT_ENUM</a> enumeration.
     * @returns {BSTR} Contains a pointer to a <b>BSTR</b> value the receives the object path. The caller must free this memory with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function when it is no longer required.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadspathname-retrieve
     */
    Retrieve(lnFormatType) {
        pbstrADsPath := BSTR()
        result := ComCall(9, this, "int", lnFormatType, "ptr", pbstrADsPath, "HRESULT")
        return pbstrADsPath
    }

    /**
     * Retrieves the number of elements in the path.
     * @returns {Integer} The number of elements in the path.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadspathname-getnumelements
     */
    GetNumElements() {
        result := ComCall(10, this, "int*", &plnNumPathElements := 0, "HRESULT")
        return plnNumPathElements
    }

    /**
     * Retrieves an element of a directory path.
     * @param {Integer} lnElementIndex The index of the element.
     * @returns {BSTR} The returned element.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadspathname-getelement
     */
    GetElement(lnElementIndex) {
        pbstrElement := BSTR()
        result := ComCall(11, this, "int", lnElementIndex, "ptr", pbstrElement, "HRESULT")
        return pbstrElement
    }

    /**
     * Adds an element to the end of the directory path already set on the Pathname object.
     * @param {BSTR} bstrLeafElement The name of the leaf element.
     * @returns {HRESULT} This method supports the standard return values, as well as the following:
     * 
     * For more information and other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadspathname-addleafelement
     */
    AddLeafElement(bstrLeafElement) {
        bstrLeafElement := bstrLeafElement is String ? BSTR.Alloc(bstrLeafElement).Value : bstrLeafElement

        result := ComCall(12, this, "ptr", bstrLeafElement, "HRESULT")
        return result
    }

    /**
     * Removes the last element from the directory path that has been set on the Pathname object.
     * @returns {HRESULT} This method supports the standard return values, as well as the following:
     * 
     * For more information and  other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadspathname-removeleafelement
     */
    RemoveLeafElement() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Creates a copy of the Pathname object.
     * @returns {IDispatch} The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface pointer on the 
     *       returned <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadspathname">IADsPathname</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadspathname-copypath
     */
    CopyPath() {
        result := ComCall(14, this, "ptr*", &ppAdsPath := 0, "HRESULT")
        return IDispatch(ppAdsPath)
    }

    /**
     * Used to escape special characters in the input path.
     * @param {Integer} lnReserved Reserved for future use.
     * @param {BSTR} bstrInStr An input string.
     * @returns {BSTR} An output string.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadspathname-getescapedelement
     */
    GetEscapedElement(lnReserved, bstrInStr) {
        bstrInStr := bstrInStr is String ? BSTR.Alloc(bstrInStr).Value : bstrInStr

        pbstrOutStr := BSTR()
        result := ComCall(15, this, "int", lnReserved, "ptr", bstrInStr, "ptr", pbstrOutStr, "HRESULT")
        return pbstrOutStr
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EscapedMode() {
        result := ComCall(16, this, "int*", &retval := 0, "HRESULT")
        return retval
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
