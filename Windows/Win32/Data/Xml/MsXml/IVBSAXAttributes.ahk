#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IVBSAXAttributes extends IDispatch {
    /**
     * The interface identifier for IVBSAXAttributes
     * @type {Guid}
     */
    static IID := Guid("{10dc0586-132b-4cac-8bb3-db00ac8b7ee0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVBSAXAttributes interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_length        : IntPtr
        getURI            : IntPtr
        getLocalName      : IntPtr
        getQName          : IntPtr
        getIndexFromName  : IntPtr
        getIndexFromQName : IntPtr
        getType           : IntPtr
        getTypeFromName   : IntPtr
        getTypeFromQName  : IntPtr
        getValue          : IntPtr
        getValueFromName  : IntPtr
        getValueFromQName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVBSAXAttributes.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(7, this, "int*", &nLength := 0, "HRESULT")
        return nLength
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {BSTR} 
     */
    getURI(nIndex) {
        strURI := BSTR.Owned()
        result := ComCall(8, this, "int", nIndex, BSTR.Ptr, strURI, "HRESULT")
        return strURI
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {BSTR} 
     */
    getLocalName(nIndex) {
        strLocalName := BSTR.Owned()
        result := ComCall(9, this, "int", nIndex, BSTR.Ptr, strLocalName, "HRESULT")
        return strLocalName
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {BSTR} 
     */
    getQName(nIndex) {
        strQName := BSTR.Owned()
        result := ComCall(10, this, "int", nIndex, BSTR.Ptr, strQName, "HRESULT")
        return strQName
    }

    /**
     * 
     * @param {BSTR} strURI 
     * @param {BSTR} strLocalName 
     * @returns {Integer} 
     */
    getIndexFromName(strURI, strLocalName) {
        strURI := strURI is String ? BSTR.Alloc(strURI).Value : strURI
        strLocalName := strLocalName is String ? BSTR.Alloc(strLocalName).Value : strLocalName

        result := ComCall(11, this, BSTR, strURI, BSTR, strLocalName, "int*", &nIndex := 0, "HRESULT")
        return nIndex
    }

    /**
     * 
     * @param {BSTR} strQName 
     * @returns {Integer} 
     */
    getIndexFromQName(strQName) {
        strQName := strQName is String ? BSTR.Alloc(strQName).Value : strQName

        result := ComCall(12, this, BSTR, strQName, "int*", &nIndex := 0, "HRESULT")
        return nIndex
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {BSTR} 
     */
    getType(nIndex) {
        strType := BSTR.Owned()
        result := ComCall(13, this, "int", nIndex, BSTR.Ptr, strType, "HRESULT")
        return strType
    }

    /**
     * 
     * @param {BSTR} strURI 
     * @param {BSTR} strLocalName 
     * @returns {BSTR} 
     */
    getTypeFromName(strURI, strLocalName) {
        strURI := strURI is String ? BSTR.Alloc(strURI).Value : strURI
        strLocalName := strLocalName is String ? BSTR.Alloc(strLocalName).Value : strLocalName

        strType := BSTR.Owned()
        result := ComCall(14, this, BSTR, strURI, BSTR, strLocalName, BSTR.Ptr, strType, "HRESULT")
        return strType
    }

    /**
     * 
     * @param {BSTR} strQName 
     * @returns {BSTR} 
     */
    getTypeFromQName(strQName) {
        strQName := strQName is String ? BSTR.Alloc(strQName).Value : strQName

        strType := BSTR.Owned()
        result := ComCall(15, this, BSTR, strQName, BSTR.Ptr, strType, "HRESULT")
        return strType
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {BSTR} 
     */
    getValue(nIndex) {
        strValue := BSTR.Owned()
        result := ComCall(16, this, "int", nIndex, BSTR.Ptr, strValue, "HRESULT")
        return strValue
    }

    /**
     * 
     * @param {BSTR} strURI 
     * @param {BSTR} strLocalName 
     * @returns {BSTR} 
     */
    getValueFromName(strURI, strLocalName) {
        strURI := strURI is String ? BSTR.Alloc(strURI).Value : strURI
        strLocalName := strLocalName is String ? BSTR.Alloc(strLocalName).Value : strLocalName

        strValue := BSTR.Owned()
        result := ComCall(17, this, BSTR, strURI, BSTR, strLocalName, BSTR.Ptr, strValue, "HRESULT")
        return strValue
    }

    /**
     * 
     * @param {BSTR} strQName 
     * @returns {BSTR} 
     */
    getValueFromQName(strQName) {
        strQName := strQName is String ? BSTR.Alloc(strQName).Value : strQName

        strValue := BSTR.Owned()
        result := ComCall(18, this, BSTR, strQName, BSTR.Ptr, strValue, "HRESULT")
        return strValue
    }

    Query(iid) {
        if (IVBSAXAttributes.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_length := CallbackCreate(GetMethod(implObj, "get_length"), flags, 2)
        this.vtbl.getURI := CallbackCreate(GetMethod(implObj, "getURI"), flags, 3)
        this.vtbl.getLocalName := CallbackCreate(GetMethod(implObj, "getLocalName"), flags, 3)
        this.vtbl.getQName := CallbackCreate(GetMethod(implObj, "getQName"), flags, 3)
        this.vtbl.getIndexFromName := CallbackCreate(GetMethod(implObj, "getIndexFromName"), flags, 4)
        this.vtbl.getIndexFromQName := CallbackCreate(GetMethod(implObj, "getIndexFromQName"), flags, 3)
        this.vtbl.getType := CallbackCreate(GetMethod(implObj, "getType"), flags, 3)
        this.vtbl.getTypeFromName := CallbackCreate(GetMethod(implObj, "getTypeFromName"), flags, 4)
        this.vtbl.getTypeFromQName := CallbackCreate(GetMethod(implObj, "getTypeFromQName"), flags, 3)
        this.vtbl.getValue := CallbackCreate(GetMethod(implObj, "getValue"), flags, 3)
        this.vtbl.getValueFromName := CallbackCreate(GetMethod(implObj, "getValueFromName"), flags, 4)
        this.vtbl.getValueFromQName := CallbackCreate(GetMethod(implObj, "getValueFromQName"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_length)
        CallbackFree(this.vtbl.getURI)
        CallbackFree(this.vtbl.getLocalName)
        CallbackFree(this.vtbl.getQName)
        CallbackFree(this.vtbl.getIndexFromName)
        CallbackFree(this.vtbl.getIndexFromQName)
        CallbackFree(this.vtbl.getType)
        CallbackFree(this.vtbl.getTypeFromName)
        CallbackFree(this.vtbl.getTypeFromQName)
        CallbackFree(this.vtbl.getValue)
        CallbackFree(this.vtbl.getValueFromName)
        CallbackFree(this.vtbl.getValueFromQName)
    }
}
