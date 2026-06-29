#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Parses the X.500 and Windows path in ADSI.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadspathname
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsPathname extends IDispatch {
    /**
     * The interface identifier for IADsPathname
     * @type {Guid}
     */
    static IID := Guid("{d592aed4-f420-11d0-a36e-00c04fb950dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsPathname interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Set               : IntPtr
        SetDisplayType    : IntPtr
        Retrieve          : IntPtr
        GetNumElements    : IntPtr
        GetElement        : IntPtr
        AddLeafElement    : IntPtr
        RemoveLeafElement : IntPtr
        CopyPath          : IntPtr
        GetEscapedElement : IntPtr
        get_EscapedMode   : IntPtr
        put_EscapedMode   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsPathname.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    EscapedMode {
        get => this.get_EscapedMode()
        set => this.put_EscapedMode(value)
    }

    /**
     * Sets up the Pathname object for parsing a directory path.
     * @remarks
     * This method will set the namespace as specified and identify the appropriate provider for performing the path cracking operation. Resetting to a different namespace will lose data already set by this method.
     * @param {BSTR} bstrADsPath Path of an ADSI object.
     * @param {Integer} lnSetType An <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_settype_enum">ADS_SETTYPE_ENUM</a> option that defines the format type to be retrieved.
     * @returns {HRESULT} This method supports the standard return values, as well as the following:
     * 
     * For more information and other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspathname-set
     */
    Set(bstrADsPath, lnSetType) {
        bstrADsPath := bstrADsPath is String ? BSTR.Alloc(bstrADsPath).Value : bstrADsPath

        result := ComCall(7, this, BSTR, bstrADsPath, "int", lnSetType, "HRESULT")
        return result
    }

    /**
     * Specifies how to display the path of an object.
     * @param {Integer} lnDisplayType The display type of a path  as defined in  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_display_enum">ADS_DISPLAY_ENUM</a>.
     * @returns {HRESULT} This method supports the standard return values, including the following:
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspathname-setdisplaytype
     */
    SetDisplayType(lnDisplayType) {
        result := ComCall(8, this, "int", lnDisplayType, "HRESULT")
        return result
    }

    /**
     * The IADsPathname::Retrieve method retrieves the path of the object with different format types.
     * @param {Integer} lnFormatType Specifies the format that the path should be retrieved in. This can be one of the values specified in the <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_format_enum">ADS_FORMAT_ENUM</a> enumeration.
     * @returns {BSTR} Contains a pointer to a <b>BSTR</b> value the receives the object path. The caller must free this memory with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspathname-retrieve
     */
    Retrieve(lnFormatType) {
        pbstrADsPath := BSTR.Owned()
        result := ComCall(9, this, "int", lnFormatType, BSTR.Ptr, pbstrADsPath, "HRESULT")
        return pbstrADsPath
    }

    /**
     * Retrieves the number of elements in the path.
     * @returns {Integer} The number of elements in the path.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspathname-getnumelements
     */
    GetNumElements() {
        result := ComCall(10, this, "int*", &plnNumPathElements := 0, "HRESULT")
        return plnNumPathElements
    }

    /**
     * Retrieves an element of a directory path.
     * @param {Integer} lnElementIndex The index of the element.
     * @returns {BSTR} The returned element.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspathname-getelement
     */
    GetElement(lnElementIndex) {
        pbstrElement := BSTR.Owned()
        result := ComCall(11, this, "int", lnElementIndex, BSTR.Ptr, pbstrElement, "HRESULT")
        return pbstrElement
    }

    /**
     * Adds an element to the end of the directory path already set on the Pathname object.
     * @param {BSTR} bstrLeafElement The name of the leaf element.
     * @returns {HRESULT} This method supports the standard return values, as well as the following:
     * 
     * For more information and other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspathname-addleafelement
     */
    AddLeafElement(bstrLeafElement) {
        bstrLeafElement := bstrLeafElement is String ? BSTR.Alloc(bstrLeafElement).Value : bstrLeafElement

        result := ComCall(12, this, BSTR, bstrLeafElement, "HRESULT")
        return result
    }

    /**
     * Removes the last element from the directory path that has been set on the Pathname object.
     * @returns {HRESULT} This method supports the standard return values, as well as the following:
     * 
     * For more information and  other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspathname-removeleafelement
     */
    RemoveLeafElement() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Creates a copy of the Pathname object.
     * @remarks
     * This method is used to modify the object path and retain the original object path.
     * @returns {IDispatch} The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface pointer on the 
     *       returned <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadspathname">IADsPathname</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspathname-copypath
     */
    CopyPath() {
        result := ComCall(14, this, "ptr*", &ppAdsPath := 0, "HRESULT")
        return IDispatch(ppAdsPath)
    }

    /**
     * Used to escape special characters in the input path.
     * @remarks
     * This method is used to handle a path that contains special characters in a unescaped string as input from a user interface. The input string must be a single element (name-value pair) of the path; that is, "CN=Smith,Jeff".
     * @param {Integer} lnReserved Reserved for future use.
     * @param {BSTR} bstrInStr An input string.
     * @returns {BSTR} An output string.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspathname-getescapedelement
     */
    GetEscapedElement(lnReserved, bstrInStr) {
        bstrInStr := bstrInStr is String ? BSTR.Alloc(bstrInStr).Value : bstrInStr

        pbstrOutStr := BSTR.Owned()
        result := ComCall(15, this, "int", lnReserved, BSTR, bstrInStr, BSTR.Ptr, pbstrOutStr, "HRESULT")
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

    Query(iid) {
        if (IADsPathname.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Set := CallbackCreate(GetMethod(implObj, "Set"), flags, 3)
        this.vtbl.SetDisplayType := CallbackCreate(GetMethod(implObj, "SetDisplayType"), flags, 2)
        this.vtbl.Retrieve := CallbackCreate(GetMethod(implObj, "Retrieve"), flags, 3)
        this.vtbl.GetNumElements := CallbackCreate(GetMethod(implObj, "GetNumElements"), flags, 2)
        this.vtbl.GetElement := CallbackCreate(GetMethod(implObj, "GetElement"), flags, 3)
        this.vtbl.AddLeafElement := CallbackCreate(GetMethod(implObj, "AddLeafElement"), flags, 2)
        this.vtbl.RemoveLeafElement := CallbackCreate(GetMethod(implObj, "RemoveLeafElement"), flags, 1)
        this.vtbl.CopyPath := CallbackCreate(GetMethod(implObj, "CopyPath"), flags, 2)
        this.vtbl.GetEscapedElement := CallbackCreate(GetMethod(implObj, "GetEscapedElement"), flags, 4)
        this.vtbl.get_EscapedMode := CallbackCreate(GetMethod(implObj, "get_EscapedMode"), flags, 2)
        this.vtbl.put_EscapedMode := CallbackCreate(GetMethod(implObj, "put_EscapedMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Set)
        CallbackFree(this.vtbl.SetDisplayType)
        CallbackFree(this.vtbl.Retrieve)
        CallbackFree(this.vtbl.GetNumElements)
        CallbackFree(this.vtbl.GetElement)
        CallbackFree(this.vtbl.AddLeafElement)
        CallbackFree(this.vtbl.RemoveLeafElement)
        CallbackFree(this.vtbl.CopyPath)
        CallbackFree(this.vtbl.GetEscapedElement)
        CallbackFree(this.vtbl.get_EscapedMode)
        CallbackFree(this.vtbl.put_EscapedMode)
    }
}
