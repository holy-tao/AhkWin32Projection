#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_OID(retval) {
        result := ComCall(20, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Syntax(retval) {
        result := ComCall(22, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_MaxRange(retval) {
        result := ComCall(24, this, "int*", retval, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_MinRange(retval) {
        result := ComCall(26, this, "int*", retval, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_MultiValued(retval) {
        result := ComCall(28, this, "ptr", retval, "HRESULT")
        return result
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
     * 
     * @param {Pointer<IADsCollection>} ppQualifiers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsproperty-qualifiers
     */
    Qualifiers(ppQualifiers) {
        result := ComCall(30, this, "ptr*", ppQualifiers, "HRESULT")
        return result
    }
}
