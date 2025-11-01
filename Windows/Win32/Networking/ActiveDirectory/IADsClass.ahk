#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_PrimaryInterface(retval) {
        result := ComCall(20, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_CLSID(retval) {
        result := ComCall(21, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_OID(retval) {
        result := ComCall(23, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_Abstract(retval) {
        result := ComCall(25, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_Auxiliary(retval) {
        result := ComCall(27, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_MandatoryProperties(retval) {
        result := ComCall(29, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_OptionalProperties(retval) {
        result := ComCall(31, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_NamingProperties(retval) {
        result := ComCall(33, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_DerivedFrom(retval) {
        result := ComCall(35, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_AuxDerivedFrom(retval) {
        result := ComCall(37, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_PossibleSuperiors(retval) {
        result := ComCall(39, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_Containment(retval) {
        result := ComCall(41, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_Container(retval) {
        result := ComCall(43, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_HelpFileName(retval) {
        result := ComCall(45, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_HelpFileContext(retval) {
        result := ComCall(47, this, "int*", retval, "HRESULT")
        return result
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
     * @param {Pointer<IADsCollection>} ppQualifiers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsclass-qualifiers
     */
    Qualifiers(ppQualifiers) {
        result := ComCall(49, this, "ptr*", ppQualifiers, "HRESULT")
        return result
    }
}
