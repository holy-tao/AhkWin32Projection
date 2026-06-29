#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IADsCollection.ahk" { IADsCollection }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IADs.ahk" { IADs }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IADsClass interface is designed for managing schema class objects that provide class definitions for any ADSI object. Other schema management interfaces include IADsProperty for attribute definitions and IADsSyntax for attribute syntax.
 * @remarks
 * Schema objects are organized in the schema container of a given directory. To access an object's schema class, use the object's <b>Schema</b> property (namely, call the <a href="https://docs.microsoft.com/windows/desktop/ADSI/iads-property-methods">IADs::get_Schema</a> property method) to obtain the ADsPath string and use that string to bind to its schema class object.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsclass
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsClass extends IADs {
    /**
     * The interface identifier for IADsClass
     * @type {Guid}
     */
    static IID := Guid("{c8f93dd0-4ae0-11cf-9e73-00aa004a5691}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsClass interfaces
    */
    struct Vtbl extends IADs.Vtbl {
        get_PrimaryInterface    : IntPtr
        get_CLSID               : IntPtr
        put_CLSID               : IntPtr
        get_OID                 : IntPtr
        put_OID                 : IntPtr
        get_Abstract            : IntPtr
        put_Abstract            : IntPtr
        get_Auxiliary           : IntPtr
        put_Auxiliary           : IntPtr
        get_MandatoryProperties : IntPtr
        put_MandatoryProperties : IntPtr
        get_OptionalProperties  : IntPtr
        put_OptionalProperties  : IntPtr
        get_NamingProperties    : IntPtr
        put_NamingProperties    : IntPtr
        get_DerivedFrom         : IntPtr
        put_DerivedFrom         : IntPtr
        get_AuxDerivedFrom      : IntPtr
        put_AuxDerivedFrom      : IntPtr
        get_PossibleSuperiors   : IntPtr
        put_PossibleSuperiors   : IntPtr
        get_Containment         : IntPtr
        put_Containment         : IntPtr
        get_Container           : IntPtr
        put_Container           : IntPtr
        get_HelpFileName        : IntPtr
        put_HelpFileName        : IntPtr
        get_HelpFileContext     : IntPtr
        put_HelpFileContext     : IntPtr
        Qualifiers              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsClass.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    PrimaryInterface {
        get => this.get_PrimaryInterface()
    }

    /**
     * @type {BSTR} 
     */
    CLSID {
        get => this.get_CLSID()
        set => this.put_CLSID(value)
    }

    /**
     * @type {BSTR} 
     */
    OID {
        get => this.get_OID()
        set => this.put_OID(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Abstract {
        get => this.get_Abstract()
        set => this.put_Abstract(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Auxiliary {
        get => this.get_Auxiliary()
        set => this.put_Auxiliary(value)
    }

    /**
     * @type {VARIANT} 
     */
    MandatoryProperties {
        get => this.get_MandatoryProperties()
        set => this.put_MandatoryProperties(value)
    }

    /**
     * @type {VARIANT} 
     */
    OptionalProperties {
        get => this.get_OptionalProperties()
        set => this.put_OptionalProperties(value)
    }

    /**
     * @type {VARIANT} 
     */
    NamingProperties {
        get => this.get_NamingProperties()
        set => this.put_NamingProperties(value)
    }

    /**
     * @type {VARIANT} 
     */
    DerivedFrom {
        get => this.get_DerivedFrom()
        set => this.put_DerivedFrom(value)
    }

    /**
     * @type {VARIANT} 
     */
    AuxDerivedFrom {
        get => this.get_AuxDerivedFrom()
        set => this.put_AuxDerivedFrom(value)
    }

    /**
     * @type {VARIANT} 
     */
    PossibleSuperiors {
        get => this.get_PossibleSuperiors()
        set => this.put_PossibleSuperiors(value)
    }

    /**
     * @type {VARIANT} 
     */
    Containment {
        get => this.get_Containment()
        set => this.put_Containment(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Container {
        get => this.get_Container()
        set => this.put_Container(value)
    }

    /**
     * @type {BSTR} 
     */
    HelpFileName {
        get => this.get_HelpFileName()
        set => this.put_HelpFileName(value)
    }

    /**
     * @type {Integer} 
     */
    HelpFileContext {
        get => this.get_HelpFileContext()
        set => this.put_HelpFileContext(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PrimaryInterface() {
        retval := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_CLSID() {
        retval := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrCLSID 
     * @returns {HRESULT} 
     */
    put_CLSID(bstrCLSID) {
        bstrCLSID := bstrCLSID is String ? BSTR.Alloc(bstrCLSID).Value : bstrCLSID

        result := ComCall(22, this, BSTR, bstrCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_OID() {
        retval := BSTR.Owned()
        result := ComCall(23, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrOID 
     * @returns {HRESULT} 
     */
    put_OID(bstrOID) {
        bstrOID := bstrOID is String ? BSTR.Alloc(bstrOID).Value : bstrOID

        result := ComCall(24, this, BSTR, bstrOID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Abstract() {
        result := ComCall(25, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT_BOOL} fAbstract 
     * @returns {HRESULT} 
     */
    put_Abstract(fAbstract) {
        result := ComCall(26, this, VARIANT_BOOL, fAbstract, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Auxiliary() {
        result := ComCall(27, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT_BOOL} fAuxiliary 
     * @returns {HRESULT} 
     */
    put_Auxiliary(fAuxiliary) {
        result := ComCall(28, this, VARIANT_BOOL, fAuxiliary, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_MandatoryProperties() {
        retval := VARIANT()
        result := ComCall(29, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vMandatoryProperties 
     * @returns {HRESULT} 
     */
    put_MandatoryProperties(vMandatoryProperties) {
        result := ComCall(30, this, VARIANT, vMandatoryProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_OptionalProperties() {
        retval := VARIANT()
        result := ComCall(31, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vOptionalProperties 
     * @returns {HRESULT} 
     */
    put_OptionalProperties(vOptionalProperties) {
        result := ComCall(32, this, VARIANT, vOptionalProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_NamingProperties() {
        retval := VARIANT()
        result := ComCall(33, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vNamingProperties 
     * @returns {HRESULT} 
     */
    put_NamingProperties(vNamingProperties) {
        result := ComCall(34, this, VARIANT, vNamingProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_DerivedFrom() {
        retval := VARIANT()
        result := ComCall(35, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vDerivedFrom 
     * @returns {HRESULT} 
     */
    put_DerivedFrom(vDerivedFrom) {
        result := ComCall(36, this, VARIANT, vDerivedFrom, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_AuxDerivedFrom() {
        retval := VARIANT()
        result := ComCall(37, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vAuxDerivedFrom 
     * @returns {HRESULT} 
     */
    put_AuxDerivedFrom(vAuxDerivedFrom) {
        result := ComCall(38, this, VARIANT, vAuxDerivedFrom, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_PossibleSuperiors() {
        retval := VARIANT()
        result := ComCall(39, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vPossibleSuperiors 
     * @returns {HRESULT} 
     */
    put_PossibleSuperiors(vPossibleSuperiors) {
        result := ComCall(40, this, VARIANT, vPossibleSuperiors, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Containment() {
        retval := VARIANT()
        result := ComCall(41, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vContainment 
     * @returns {HRESULT} 
     */
    put_Containment(vContainment) {
        result := ComCall(42, this, VARIANT, vContainment, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Container() {
        result := ComCall(43, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT_BOOL} fContainer 
     * @returns {HRESULT} 
     */
    put_Container(fContainer) {
        result := ComCall(44, this, VARIANT_BOOL, fContainer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_HelpFileName() {
        retval := BSTR.Owned()
        result := ComCall(45, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrHelpFileName 
     * @returns {HRESULT} 
     */
    put_HelpFileName(bstrHelpFileName) {
        bstrHelpFileName := bstrHelpFileName is String ? BSTR.Alloc(bstrHelpFileName).Value : bstrHelpFileName

        result := ComCall(46, this, BSTR, bstrHelpFileName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HelpFileContext() {
        result := ComCall(47, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnHelpFileContext 
     * @returns {HRESULT} 
     */
    put_HelpFileContext(lnHelpFileContext) {
        result := ComCall(48, this, "int", lnHelpFileContext, "HRESULT")
        return result
    }

    /**
     * Returns a collection of ADSI objects that describe additional qualifiers for this schema class.
     * @remarks
     * The qualifier objects are provider-specific. When supported, this method can be used to obtain extended schema data.
     * 
     * This method is not currently supported by any of Microsoft providers.
     * @returns {IADsCollection} Address of an <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscollection">IADsCollection</a> pointer variable that receives the interface pointer to the ADSI collection object that represents additional limits for this schema class.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsclass-qualifiers
     */
    Qualifiers() {
        result := ComCall(49, this, "ptr*", &ppQualifiers := 0, "HRESULT")
        return IADsCollection(ppQualifiers)
    }

    Query(iid) {
        if (IADsClass.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PrimaryInterface := CallbackCreate(GetMethod(implObj, "get_PrimaryInterface"), flags, 2)
        this.vtbl.get_CLSID := CallbackCreate(GetMethod(implObj, "get_CLSID"), flags, 2)
        this.vtbl.put_CLSID := CallbackCreate(GetMethod(implObj, "put_CLSID"), flags, 2)
        this.vtbl.get_OID := CallbackCreate(GetMethod(implObj, "get_OID"), flags, 2)
        this.vtbl.put_OID := CallbackCreate(GetMethod(implObj, "put_OID"), flags, 2)
        this.vtbl.get_Abstract := CallbackCreate(GetMethod(implObj, "get_Abstract"), flags, 2)
        this.vtbl.put_Abstract := CallbackCreate(GetMethod(implObj, "put_Abstract"), flags, 2)
        this.vtbl.get_Auxiliary := CallbackCreate(GetMethod(implObj, "get_Auxiliary"), flags, 2)
        this.vtbl.put_Auxiliary := CallbackCreate(GetMethod(implObj, "put_Auxiliary"), flags, 2)
        this.vtbl.get_MandatoryProperties := CallbackCreate(GetMethod(implObj, "get_MandatoryProperties"), flags, 2)
        this.vtbl.put_MandatoryProperties := CallbackCreate(GetMethod(implObj, "put_MandatoryProperties"), flags, 2)
        this.vtbl.get_OptionalProperties := CallbackCreate(GetMethod(implObj, "get_OptionalProperties"), flags, 2)
        this.vtbl.put_OptionalProperties := CallbackCreate(GetMethod(implObj, "put_OptionalProperties"), flags, 2)
        this.vtbl.get_NamingProperties := CallbackCreate(GetMethod(implObj, "get_NamingProperties"), flags, 2)
        this.vtbl.put_NamingProperties := CallbackCreate(GetMethod(implObj, "put_NamingProperties"), flags, 2)
        this.vtbl.get_DerivedFrom := CallbackCreate(GetMethod(implObj, "get_DerivedFrom"), flags, 2)
        this.vtbl.put_DerivedFrom := CallbackCreate(GetMethod(implObj, "put_DerivedFrom"), flags, 2)
        this.vtbl.get_AuxDerivedFrom := CallbackCreate(GetMethod(implObj, "get_AuxDerivedFrom"), flags, 2)
        this.vtbl.put_AuxDerivedFrom := CallbackCreate(GetMethod(implObj, "put_AuxDerivedFrom"), flags, 2)
        this.vtbl.get_PossibleSuperiors := CallbackCreate(GetMethod(implObj, "get_PossibleSuperiors"), flags, 2)
        this.vtbl.put_PossibleSuperiors := CallbackCreate(GetMethod(implObj, "put_PossibleSuperiors"), flags, 2)
        this.vtbl.get_Containment := CallbackCreate(GetMethod(implObj, "get_Containment"), flags, 2)
        this.vtbl.put_Containment := CallbackCreate(GetMethod(implObj, "put_Containment"), flags, 2)
        this.vtbl.get_Container := CallbackCreate(GetMethod(implObj, "get_Container"), flags, 2)
        this.vtbl.put_Container := CallbackCreate(GetMethod(implObj, "put_Container"), flags, 2)
        this.vtbl.get_HelpFileName := CallbackCreate(GetMethod(implObj, "get_HelpFileName"), flags, 2)
        this.vtbl.put_HelpFileName := CallbackCreate(GetMethod(implObj, "put_HelpFileName"), flags, 2)
        this.vtbl.get_HelpFileContext := CallbackCreate(GetMethod(implObj, "get_HelpFileContext"), flags, 2)
        this.vtbl.put_HelpFileContext := CallbackCreate(GetMethod(implObj, "put_HelpFileContext"), flags, 2)
        this.vtbl.Qualifiers := CallbackCreate(GetMethod(implObj, "Qualifiers"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PrimaryInterface)
        CallbackFree(this.vtbl.get_CLSID)
        CallbackFree(this.vtbl.put_CLSID)
        CallbackFree(this.vtbl.get_OID)
        CallbackFree(this.vtbl.put_OID)
        CallbackFree(this.vtbl.get_Abstract)
        CallbackFree(this.vtbl.put_Abstract)
        CallbackFree(this.vtbl.get_Auxiliary)
        CallbackFree(this.vtbl.put_Auxiliary)
        CallbackFree(this.vtbl.get_MandatoryProperties)
        CallbackFree(this.vtbl.put_MandatoryProperties)
        CallbackFree(this.vtbl.get_OptionalProperties)
        CallbackFree(this.vtbl.put_OptionalProperties)
        CallbackFree(this.vtbl.get_NamingProperties)
        CallbackFree(this.vtbl.put_NamingProperties)
        CallbackFree(this.vtbl.get_DerivedFrom)
        CallbackFree(this.vtbl.put_DerivedFrom)
        CallbackFree(this.vtbl.get_AuxDerivedFrom)
        CallbackFree(this.vtbl.put_AuxDerivedFrom)
        CallbackFree(this.vtbl.get_PossibleSuperiors)
        CallbackFree(this.vtbl.put_PossibleSuperiors)
        CallbackFree(this.vtbl.get_Containment)
        CallbackFree(this.vtbl.put_Containment)
        CallbackFree(this.vtbl.get_Container)
        CallbackFree(this.vtbl.put_Container)
        CallbackFree(this.vtbl.get_HelpFileName)
        CallbackFree(this.vtbl.put_HelpFileName)
        CallbackFree(this.vtbl.get_HelpFileContext)
        CallbackFree(this.vtbl.put_HelpFileContext)
        CallbackFree(this.vtbl.Qualifiers)
    }
}
