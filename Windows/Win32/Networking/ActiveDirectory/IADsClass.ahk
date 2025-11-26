#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IADsCollection.ahk
#Include .\IADs.ahk

/**
 * The IADsClass interface is designed for managing schema class objects that provide class definitions for any ADSI object. Other schema management interfaces include IADsProperty for attribute definitions and IADsSyntax for attribute syntax.
 * @remarks
 * 
 * Schema objects are organized in the schema container of a given directory. To access an object's schema class, use the object's <b>Schema</b> property (namely, call the <a href="https://docs.microsoft.com/windows/desktop/ADSI/iads-property-methods">IADs::get_Schema</a> property method) to obtain the ADsPath string and use that string to bind to its schema class object.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsclass
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsClass extends IADs{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsClass
     * @type {Guid}
     */
    static IID => Guid("{c8f93dd0-4ae0-11cf-9e73-00aa004a5691}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PrimaryInterface", "get_CLSID", "put_CLSID", "get_OID", "put_OID", "get_Abstract", "put_Abstract", "get_Auxiliary", "put_Auxiliary", "get_MandatoryProperties", "put_MandatoryProperties", "get_OptionalProperties", "put_OptionalProperties", "get_NamingProperties", "put_NamingProperties", "get_DerivedFrom", "put_DerivedFrom", "get_AuxDerivedFrom", "put_AuxDerivedFrom", "get_PossibleSuperiors", "put_PossibleSuperiors", "get_Containment", "put_Containment", "get_Container", "put_Container", "get_HelpFileName", "put_HelpFileName", "get_HelpFileContext", "put_HelpFileContext", "Qualifiers"]

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
        retval := BSTR()
        result := ComCall(20, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_CLSID() {
        retval := BSTR()
        result := ComCall(21, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrCLSID 
     * @returns {HRESULT} 
     */
    put_CLSID(bstrCLSID) {
        bstrCLSID := bstrCLSID is String ? BSTR.Alloc(bstrCLSID).Value : bstrCLSID

        result := ComCall(22, this, "ptr", bstrCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_OID() {
        retval := BSTR()
        result := ComCall(23, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrOID 
     * @returns {HRESULT} 
     */
    put_OID(bstrOID) {
        bstrOID := bstrOID is String ? BSTR.Alloc(bstrOID).Value : bstrOID

        result := ComCall(24, this, "ptr", bstrOID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Abstract() {
        result := ComCall(25, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT_BOOL} fAbstract 
     * @returns {HRESULT} 
     */
    put_Abstract(fAbstract) {
        result := ComCall(26, this, "short", fAbstract, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Auxiliary() {
        result := ComCall(27, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT_BOOL} fAuxiliary 
     * @returns {HRESULT} 
     */
    put_Auxiliary(fAuxiliary) {
        result := ComCall(28, this, "short", fAuxiliary, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_MandatoryProperties() {
        retval := VARIANT()
        result := ComCall(29, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vMandatoryProperties 
     * @returns {HRESULT} 
     */
    put_MandatoryProperties(vMandatoryProperties) {
        result := ComCall(30, this, "ptr", vMandatoryProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_OptionalProperties() {
        retval := VARIANT()
        result := ComCall(31, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vOptionalProperties 
     * @returns {HRESULT} 
     */
    put_OptionalProperties(vOptionalProperties) {
        result := ComCall(32, this, "ptr", vOptionalProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_NamingProperties() {
        retval := VARIANT()
        result := ComCall(33, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vNamingProperties 
     * @returns {HRESULT} 
     */
    put_NamingProperties(vNamingProperties) {
        result := ComCall(34, this, "ptr", vNamingProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_DerivedFrom() {
        retval := VARIANT()
        result := ComCall(35, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vDerivedFrom 
     * @returns {HRESULT} 
     */
    put_DerivedFrom(vDerivedFrom) {
        result := ComCall(36, this, "ptr", vDerivedFrom, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_AuxDerivedFrom() {
        retval := VARIANT()
        result := ComCall(37, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vAuxDerivedFrom 
     * @returns {HRESULT} 
     */
    put_AuxDerivedFrom(vAuxDerivedFrom) {
        result := ComCall(38, this, "ptr", vAuxDerivedFrom, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_PossibleSuperiors() {
        retval := VARIANT()
        result := ComCall(39, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vPossibleSuperiors 
     * @returns {HRESULT} 
     */
    put_PossibleSuperiors(vPossibleSuperiors) {
        result := ComCall(40, this, "ptr", vPossibleSuperiors, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Containment() {
        retval := VARIANT()
        result := ComCall(41, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vContainment 
     * @returns {HRESULT} 
     */
    put_Containment(vContainment) {
        result := ComCall(42, this, "ptr", vContainment, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Container() {
        result := ComCall(43, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT_BOOL} fContainer 
     * @returns {HRESULT} 
     */
    put_Container(fContainer) {
        result := ComCall(44, this, "short", fContainer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_HelpFileName() {
        retval := BSTR()
        result := ComCall(45, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrHelpFileName 
     * @returns {HRESULT} 
     */
    put_HelpFileName(bstrHelpFileName) {
        bstrHelpFileName := bstrHelpFileName is String ? BSTR.Alloc(bstrHelpFileName).Value : bstrHelpFileName

        result := ComCall(46, this, "ptr", bstrHelpFileName, "HRESULT")
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
     * 
     * @returns {IADsCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsclass-qualifiers
     */
    Qualifiers() {
        result := ComCall(49, this, "ptr*", &ppQualifiers := 0, "HRESULT")
        return IADsCollection(ppQualifiers)
    }
}
