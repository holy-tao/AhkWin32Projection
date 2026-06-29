#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IMXAttributes extends IDispatch {
    /**
     * The interface identifier for IMXAttributes
     * @type {Guid}
     */
    static IID := Guid("{f10d27cc-3ec0-415c-8ed8-77ab1c5e7262}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMXAttributes interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        addAttribute          : IntPtr
        addAttributeFromIndex : IntPtr
        clear                 : IntPtr
        removeAttribute       : IntPtr
        setAttribute          : IntPtr
        setAttributes         : IntPtr
        setLocalName          : IntPtr
        setQName              : IntPtr
        setType               : IntPtr
        setURI                : IntPtr
        setValue              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMXAttributes.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} strURI 
     * @param {BSTR} strLocalName 
     * @param {BSTR} strQName 
     * @param {BSTR} strType 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     */
    addAttribute(strURI, strLocalName, strQName, strType, strValue) {
        strURI := strURI is String ? BSTR.Alloc(strURI).Value : strURI
        strLocalName := strLocalName is String ? BSTR.Alloc(strLocalName).Value : strLocalName
        strQName := strQName is String ? BSTR.Alloc(strQName).Value : strQName
        strType := strType is String ? BSTR.Alloc(strType).Value : strType
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(7, this, BSTR, strURI, BSTR, strLocalName, BSTR, strQName, BSTR, strType, BSTR, strValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varAtts 
     * @param {Integer} nIndex 
     * @returns {HRESULT} 
     */
    addAttributeFromIndex(varAtts, nIndex) {
        result := ComCall(8, this, VARIANT, varAtts, "int", nIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    clear() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {HRESULT} 
     */
    removeAttribute(nIndex) {
        result := ComCall(10, this, "int", nIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {BSTR} strURI 
     * @param {BSTR} strLocalName 
     * @param {BSTR} strQName 
     * @param {BSTR} strType 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     */
    setAttribute(nIndex, strURI, strLocalName, strQName, strType, strValue) {
        strURI := strURI is String ? BSTR.Alloc(strURI).Value : strURI
        strLocalName := strLocalName is String ? BSTR.Alloc(strLocalName).Value : strLocalName
        strQName := strQName is String ? BSTR.Alloc(strQName).Value : strQName
        strType := strType is String ? BSTR.Alloc(strType).Value : strType
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(11, this, "int", nIndex, BSTR, strURI, BSTR, strLocalName, BSTR, strQName, BSTR, strType, BSTR, strValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varAtts 
     * @returns {HRESULT} 
     */
    setAttributes(varAtts) {
        result := ComCall(12, this, VARIANT, varAtts, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {BSTR} strLocalName 
     * @returns {HRESULT} 
     */
    setLocalName(nIndex, strLocalName) {
        strLocalName := strLocalName is String ? BSTR.Alloc(strLocalName).Value : strLocalName

        result := ComCall(13, this, "int", nIndex, BSTR, strLocalName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {BSTR} strQName 
     * @returns {HRESULT} 
     */
    setQName(nIndex, strQName) {
        strQName := strQName is String ? BSTR.Alloc(strQName).Value : strQName

        result := ComCall(14, this, "int", nIndex, BSTR, strQName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {BSTR} strType 
     * @returns {HRESULT} 
     */
    setType(nIndex, strType) {
        strType := strType is String ? BSTR.Alloc(strType).Value : strType

        result := ComCall(15, this, "int", nIndex, BSTR, strType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {BSTR} strURI 
     * @returns {HRESULT} 
     */
    setURI(nIndex, strURI) {
        strURI := strURI is String ? BSTR.Alloc(strURI).Value : strURI

        result := ComCall(16, this, "int", nIndex, BSTR, strURI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     */
    setValue(nIndex, strValue) {
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(17, this, "int", nIndex, BSTR, strValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMXAttributes.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.addAttribute := CallbackCreate(GetMethod(implObj, "addAttribute"), flags, 6)
        this.vtbl.addAttributeFromIndex := CallbackCreate(GetMethod(implObj, "addAttributeFromIndex"), flags, 3)
        this.vtbl.clear := CallbackCreate(GetMethod(implObj, "clear"), flags, 1)
        this.vtbl.removeAttribute := CallbackCreate(GetMethod(implObj, "removeAttribute"), flags, 2)
        this.vtbl.setAttribute := CallbackCreate(GetMethod(implObj, "setAttribute"), flags, 7)
        this.vtbl.setAttributes := CallbackCreate(GetMethod(implObj, "setAttributes"), flags, 2)
        this.vtbl.setLocalName := CallbackCreate(GetMethod(implObj, "setLocalName"), flags, 3)
        this.vtbl.setQName := CallbackCreate(GetMethod(implObj, "setQName"), flags, 3)
        this.vtbl.setType := CallbackCreate(GetMethod(implObj, "setType"), flags, 3)
        this.vtbl.setURI := CallbackCreate(GetMethod(implObj, "setURI"), flags, 3)
        this.vtbl.setValue := CallbackCreate(GetMethod(implObj, "setValue"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.addAttribute)
        CallbackFree(this.vtbl.addAttributeFromIndex)
        CallbackFree(this.vtbl.clear)
        CallbackFree(this.vtbl.removeAttribute)
        CallbackFree(this.vtbl.setAttribute)
        CallbackFree(this.vtbl.setAttributes)
        CallbackFree(this.vtbl.setLocalName)
        CallbackFree(this.vtbl.setQName)
        CallbackFree(this.vtbl.setType)
        CallbackFree(this.vtbl.setURI)
        CallbackFree(this.vtbl.setValue)
    }
}
