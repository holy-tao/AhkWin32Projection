#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IADsCollection.ahk" { IADsCollection }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IADs.ahk" { IADs }

/**
 * The IADsProperty interface is designed to manage a single attribute definition for a schema class object.
 * @remarks
 * The <b>IADsProperty</b> interface methods can add new 
 *     attributes and property objects to a provider-specific implementation.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsproperty
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsProperty extends IADs {
    /**
     * The interface identifier for IADsProperty
     * @type {Guid}
     */
    static IID := Guid("{c8f93dd3-4ae0-11cf-9e73-00aa004a5691}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsProperty interfaces
    */
    struct Vtbl extends IADs.Vtbl {
        get_OID         : IntPtr
        put_OID         : IntPtr
        get_Syntax      : IntPtr
        put_Syntax      : IntPtr
        get_MaxRange    : IntPtr
        put_MaxRange    : IntPtr
        get_MinRange    : IntPtr
        put_MinRange    : IntPtr
        get_MultiValued : IntPtr
        put_MultiValued : IntPtr
        Qualifiers      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsProperty.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    OID {
        get => this.get_OID()
        set => this.put_OID(value)
    }

    /**
     * @type {BSTR} 
     */
    Syntax {
        get => this.get_Syntax()
        set => this.put_Syntax(value)
    }

    /**
     * @type {Integer} 
     */
    MaxRange {
        get => this.get_MaxRange()
        set => this.put_MaxRange(value)
    }

    /**
     * @type {Integer} 
     */
    MinRange {
        get => this.get_MinRange()
        set => this.put_MinRange(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    MultiValued {
        get => this.get_MultiValued()
        set => this.put_MultiValued(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_OID() {
        retval := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrOID 
     * @returns {HRESULT} 
     */
    put_OID(bstrOID) {
        bstrOID := bstrOID is String ? BSTR.Alloc(bstrOID).Value : bstrOID

        result := ComCall(21, this, BSTR, bstrOID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Syntax() {
        retval := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrSyntax 
     * @returns {HRESULT} 
     */
    put_Syntax(bstrSyntax) {
        bstrSyntax := bstrSyntax is String ? BSTR.Alloc(bstrSyntax).Value : bstrSyntax

        result := ComCall(23, this, BSTR, bstrSyntax, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxRange() {
        result := ComCall(24, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnMaxRange 
     * @returns {HRESULT} 
     */
    put_MaxRange(lnMaxRange) {
        result := ComCall(25, this, "int", lnMaxRange, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinRange() {
        result := ComCall(26, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnMinRange 
     * @returns {HRESULT} 
     */
    put_MinRange(lnMinRange) {
        result := ComCall(27, this, "int", lnMinRange, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_MultiValued() {
        result := ComCall(28, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT_BOOL} fMultiValued 
     * @returns {HRESULT} 
     */
    put_MultiValued(fMultiValued) {
        result := ComCall(29, this, VARIANT_BOOL, fMultiValued, "HRESULT")
        return result
    }

    /**
     * Returns a collection of ADSI objects that describe additional qualifiers of this property.
     * @remarks
     * The qualifier objects are provider-specific. When supported, this method can be used to obtain extended schema data.
     * 
     * This method is not currently supported by any of the providers supplied by Microsoft.
     * @returns {IADsCollection} Indirect pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscollection">IADsCollection</a> interface on the ADSI collection object that represents additional limits for this property.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsproperty-qualifiers
     */
    Qualifiers() {
        result := ComCall(30, this, "ptr*", &ppQualifiers := 0, "HRESULT")
        return IADsCollection(ppQualifiers)
    }

    Query(iid) {
        if (IADsProperty.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_OID := CallbackCreate(GetMethod(implObj, "get_OID"), flags, 2)
        this.vtbl.put_OID := CallbackCreate(GetMethod(implObj, "put_OID"), flags, 2)
        this.vtbl.get_Syntax := CallbackCreate(GetMethod(implObj, "get_Syntax"), flags, 2)
        this.vtbl.put_Syntax := CallbackCreate(GetMethod(implObj, "put_Syntax"), flags, 2)
        this.vtbl.get_MaxRange := CallbackCreate(GetMethod(implObj, "get_MaxRange"), flags, 2)
        this.vtbl.put_MaxRange := CallbackCreate(GetMethod(implObj, "put_MaxRange"), flags, 2)
        this.vtbl.get_MinRange := CallbackCreate(GetMethod(implObj, "get_MinRange"), flags, 2)
        this.vtbl.put_MinRange := CallbackCreate(GetMethod(implObj, "put_MinRange"), flags, 2)
        this.vtbl.get_MultiValued := CallbackCreate(GetMethod(implObj, "get_MultiValued"), flags, 2)
        this.vtbl.put_MultiValued := CallbackCreate(GetMethod(implObj, "put_MultiValued"), flags, 2)
        this.vtbl.Qualifiers := CallbackCreate(GetMethod(implObj, "Qualifiers"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_OID)
        CallbackFree(this.vtbl.put_OID)
        CallbackFree(this.vtbl.get_Syntax)
        CallbackFree(this.vtbl.put_Syntax)
        CallbackFree(this.vtbl.get_MaxRange)
        CallbackFree(this.vtbl.put_MaxRange)
        CallbackFree(this.vtbl.get_MinRange)
        CallbackFree(this.vtbl.put_MinRange)
        CallbackFree(this.vtbl.get_MultiValued)
        CallbackFree(this.vtbl.put_MultiValued)
        CallbackFree(this.vtbl.Qualifiers)
    }
}
