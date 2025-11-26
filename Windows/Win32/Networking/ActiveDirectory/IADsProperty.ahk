#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IADsCollection.ahk
#Include .\IADs.ahk

/**
 * The IADsProperty interface is designed to manage a single attribute definition for a schema class object.
 * @remarks
 * 
 * The <b>IADsProperty</b> interface methods can add new 
 *     attributes and property objects to a provider-specific implementation.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsproperty
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsProperty extends IADs{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsProperty
     * @type {Guid}
     */
    static IID => Guid("{c8f93dd3-4ae0-11cf-9e73-00aa004a5691}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OID", "put_OID", "get_Syntax", "put_Syntax", "get_MaxRange", "put_MaxRange", "get_MinRange", "put_MinRange", "get_MultiValued", "put_MultiValued", "Qualifiers"]

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
        retval := BSTR()
        result := ComCall(20, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrOID 
     * @returns {HRESULT} 
     */
    put_OID(bstrOID) {
        bstrOID := bstrOID is String ? BSTR.Alloc(bstrOID).Value : bstrOID

        result := ComCall(21, this, "ptr", bstrOID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Syntax() {
        retval := BSTR()
        result := ComCall(22, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrSyntax 
     * @returns {HRESULT} 
     */
    put_Syntax(bstrSyntax) {
        bstrSyntax := bstrSyntax is String ? BSTR.Alloc(bstrSyntax).Value : bstrSyntax

        result := ComCall(23, this, "ptr", bstrSyntax, "HRESULT")
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
        result := ComCall(28, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT_BOOL} fMultiValued 
     * @returns {HRESULT} 
     */
    put_MultiValued(fMultiValued) {
        result := ComCall(29, this, "short", fMultiValued, "HRESULT")
        return result
    }

    /**
     * Returns a collection of ADSI objects that describe additional qualifiers of this property.
     * @returns {IADsCollection} Indirect pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscollection">IADsCollection</a> interface on the ADSI collection object that represents additional limits for this property.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsproperty-qualifiers
     */
    Qualifiers() {
        result := ComCall(30, this, "ptr*", &ppQualifiers := 0, "HRESULT")
        return IADsCollection(ppQualifiers)
    }
}
