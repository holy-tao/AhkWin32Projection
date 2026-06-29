#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct ISAXAttributes extends IUnknown {
    /**
     * The interface identifier for ISAXAttributes
     * @type {Guid}
     */
    static IID := Guid("{f078abe1-45d2-4832-91ea-4466ce2f25c9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISAXAttributes interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        getLength         : IntPtr
        getURI            : IntPtr
        getLocalName      : IntPtr
        getQName          : IntPtr
        getName           : IntPtr
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
            this.vtbl := ISAXAttributes.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    getLength() {
        result := ComCall(3, this, "int*", &pnLength := 0, "HRESULT")
        return pnLength
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<Pointer<Integer>>} ppwchUri 
     * @param {Pointer<Integer>} pcchUri 
     * @returns {HRESULT} 
     */
    getURI(nIndex, ppwchUri, pcchUri) {
        ppwchUriMarshal := ppwchUri is VarRef ? "ptr*" : "ptr"
        pcchUriMarshal := pcchUri is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "int", nIndex, ppwchUriMarshal, ppwchUri, pcchUriMarshal, pcchUri, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<Pointer<Integer>>} ppwchLocalName 
     * @param {Pointer<Integer>} pcchLocalName 
     * @returns {HRESULT} 
     */
    getLocalName(nIndex, ppwchLocalName, pcchLocalName) {
        ppwchLocalNameMarshal := ppwchLocalName is VarRef ? "ptr*" : "ptr"
        pcchLocalNameMarshal := pcchLocalName is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "int", nIndex, ppwchLocalNameMarshal, ppwchLocalName, pcchLocalNameMarshal, pcchLocalName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<Pointer<Integer>>} ppwchQName 
     * @param {Pointer<Integer>} pcchQName 
     * @returns {HRESULT} 
     */
    getQName(nIndex, ppwchQName, pcchQName) {
        ppwchQNameMarshal := ppwchQName is VarRef ? "ptr*" : "ptr"
        pcchQNameMarshal := pcchQName is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "int", nIndex, ppwchQNameMarshal, ppwchQName, pcchQNameMarshal, pcchQName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<Pointer<Integer>>} ppwchUri 
     * @param {Pointer<Integer>} pcchUri 
     * @param {Pointer<Pointer<Integer>>} ppwchLocalName 
     * @param {Pointer<Integer>} pcchLocalName 
     * @param {Pointer<Pointer<Integer>>} ppwchQName 
     * @param {Pointer<Integer>} pcchQName 
     * @returns {HRESULT} 
     */
    getName(nIndex, ppwchUri, pcchUri, ppwchLocalName, pcchLocalName, ppwchQName, pcchQName) {
        ppwchUriMarshal := ppwchUri is VarRef ? "ptr*" : "ptr"
        pcchUriMarshal := pcchUri is VarRef ? "int*" : "ptr"
        ppwchLocalNameMarshal := ppwchLocalName is VarRef ? "ptr*" : "ptr"
        pcchLocalNameMarshal := pcchLocalName is VarRef ? "int*" : "ptr"
        ppwchQNameMarshal := ppwchQName is VarRef ? "ptr*" : "ptr"
        pcchQNameMarshal := pcchQName is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "int", nIndex, ppwchUriMarshal, ppwchUri, pcchUriMarshal, pcchUri, ppwchLocalNameMarshal, ppwchLocalName, pcchLocalNameMarshal, pcchLocalName, ppwchQNameMarshal, ppwchQName, pcchQNameMarshal, pcchQName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchUri 
     * @param {Integer} cchUri 
     * @param {PWSTR} pwchLocalName 
     * @param {Integer} cchLocalName 
     * @returns {Integer} 
     */
    getIndexFromName(pwchUri, cchUri, pwchLocalName, cchLocalName) {
        pwchUri := pwchUri is String ? StrPtr(pwchUri) : pwchUri
        pwchLocalName := pwchLocalName is String ? StrPtr(pwchLocalName) : pwchLocalName

        result := ComCall(8, this, "ptr", pwchUri, "int", cchUri, "ptr", pwchLocalName, "int", cchLocalName, "int*", &pnIndex := 0, "HRESULT")
        return pnIndex
    }

    /**
     * 
     * @param {PWSTR} pwchQName 
     * @param {Integer} cchQName 
     * @returns {Integer} 
     */
    getIndexFromQName(pwchQName, cchQName) {
        pwchQName := pwchQName is String ? StrPtr(pwchQName) : pwchQName

        result := ComCall(9, this, "ptr", pwchQName, "int", cchQName, "int*", &pnIndex := 0, "HRESULT")
        return pnIndex
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<Pointer<Integer>>} ppwchType 
     * @param {Pointer<Integer>} pcchType 
     * @returns {HRESULT} 
     */
    getType(nIndex, ppwchType, pcchType) {
        ppwchTypeMarshal := ppwchType is VarRef ? "ptr*" : "ptr"
        pcchTypeMarshal := pcchType is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, "int", nIndex, ppwchTypeMarshal, ppwchType, pcchTypeMarshal, pcchType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchUri 
     * @param {Integer} cchUri 
     * @param {PWSTR} pwchLocalName 
     * @param {Integer} cchLocalName 
     * @param {Pointer<Pointer<Integer>>} ppwchType 
     * @param {Pointer<Integer>} pcchType 
     * @returns {HRESULT} 
     */
    getTypeFromName(pwchUri, cchUri, pwchLocalName, cchLocalName, ppwchType, pcchType) {
        pwchUri := pwchUri is String ? StrPtr(pwchUri) : pwchUri
        pwchLocalName := pwchLocalName is String ? StrPtr(pwchLocalName) : pwchLocalName

        ppwchTypeMarshal := ppwchType is VarRef ? "ptr*" : "ptr"
        pcchTypeMarshal := pcchType is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "ptr", pwchUri, "int", cchUri, "ptr", pwchLocalName, "int", cchLocalName, ppwchTypeMarshal, ppwchType, pcchTypeMarshal, pcchType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchQName 
     * @param {Integer} cchQName 
     * @param {Pointer<Pointer<Integer>>} ppwchType 
     * @param {Pointer<Integer>} pcchType 
     * @returns {HRESULT} 
     */
    getTypeFromQName(pwchQName, cchQName, ppwchType, pcchType) {
        pwchQName := pwchQName is String ? StrPtr(pwchQName) : pwchQName

        ppwchTypeMarshal := ppwchType is VarRef ? "ptr*" : "ptr"
        pcchTypeMarshal := pcchType is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, "ptr", pwchQName, "int", cchQName, ppwchTypeMarshal, ppwchType, pcchTypeMarshal, pcchType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<Pointer<Integer>>} ppwchValue 
     * @param {Pointer<Integer>} pcchValue 
     * @returns {HRESULT} 
     */
    getValue(nIndex, ppwchValue, pcchValue) {
        ppwchValueMarshal := ppwchValue is VarRef ? "ptr*" : "ptr"
        pcchValueMarshal := pcchValue is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, "int", nIndex, ppwchValueMarshal, ppwchValue, pcchValueMarshal, pcchValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchUri 
     * @param {Integer} cchUri 
     * @param {PWSTR} pwchLocalName 
     * @param {Integer} cchLocalName 
     * @param {Pointer<Pointer<Integer>>} ppwchValue 
     * @param {Pointer<Integer>} pcchValue 
     * @returns {HRESULT} 
     */
    getValueFromName(pwchUri, cchUri, pwchLocalName, cchLocalName, ppwchValue, pcchValue) {
        pwchUri := pwchUri is String ? StrPtr(pwchUri) : pwchUri
        pwchLocalName := pwchLocalName is String ? StrPtr(pwchLocalName) : pwchLocalName

        ppwchValueMarshal := ppwchValue is VarRef ? "ptr*" : "ptr"
        pcchValueMarshal := pcchValue is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, "ptr", pwchUri, "int", cchUri, "ptr", pwchLocalName, "int", cchLocalName, ppwchValueMarshal, ppwchValue, pcchValueMarshal, pcchValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchQName 
     * @param {Integer} cchQName 
     * @param {Pointer<Pointer<Integer>>} ppwchValue 
     * @param {Pointer<Integer>} pcchValue 
     * @returns {HRESULT} 
     */
    getValueFromQName(pwchQName, cchQName, ppwchValue, pcchValue) {
        pwchQName := pwchQName is String ? StrPtr(pwchQName) : pwchQName

        ppwchValueMarshal := ppwchValue is VarRef ? "ptr*" : "ptr"
        pcchValueMarshal := pcchValue is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, "ptr", pwchQName, "int", cchQName, ppwchValueMarshal, ppwchValue, pcchValueMarshal, pcchValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISAXAttributes.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.getLength := CallbackCreate(GetMethod(implObj, "getLength"), flags, 2)
        this.vtbl.getURI := CallbackCreate(GetMethod(implObj, "getURI"), flags, 4)
        this.vtbl.getLocalName := CallbackCreate(GetMethod(implObj, "getLocalName"), flags, 4)
        this.vtbl.getQName := CallbackCreate(GetMethod(implObj, "getQName"), flags, 4)
        this.vtbl.getName := CallbackCreate(GetMethod(implObj, "getName"), flags, 8)
        this.vtbl.getIndexFromName := CallbackCreate(GetMethod(implObj, "getIndexFromName"), flags, 6)
        this.vtbl.getIndexFromQName := CallbackCreate(GetMethod(implObj, "getIndexFromQName"), flags, 4)
        this.vtbl.getType := CallbackCreate(GetMethod(implObj, "getType"), flags, 4)
        this.vtbl.getTypeFromName := CallbackCreate(GetMethod(implObj, "getTypeFromName"), flags, 7)
        this.vtbl.getTypeFromQName := CallbackCreate(GetMethod(implObj, "getTypeFromQName"), flags, 5)
        this.vtbl.getValue := CallbackCreate(GetMethod(implObj, "getValue"), flags, 4)
        this.vtbl.getValueFromName := CallbackCreate(GetMethod(implObj, "getValueFromName"), flags, 7)
        this.vtbl.getValueFromQName := CallbackCreate(GetMethod(implObj, "getValueFromQName"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.getLength)
        CallbackFree(this.vtbl.getURI)
        CallbackFree(this.vtbl.getLocalName)
        CallbackFree(this.vtbl.getQName)
        CallbackFree(this.vtbl.getName)
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
