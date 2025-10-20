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
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_OID(retval) {
        result := ComCall(20, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrOID 
     * @returns {HRESULT} 
     */
    put_OID(bstrOID) {
        bstrOID := bstrOID is String ? BSTR.Alloc(bstrOID).Value : bstrOID

        result := ComCall(21, this, "ptr", bstrOID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Syntax(retval) {
        result := ComCall(22, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrSyntax 
     * @returns {HRESULT} 
     */
    put_Syntax(bstrSyntax) {
        bstrSyntax := bstrSyntax is String ? BSTR.Alloc(bstrSyntax).Value : bstrSyntax

        result := ComCall(23, this, "ptr", bstrSyntax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_MaxRange(retval) {
        result := ComCall(24, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lnMaxRange 
     * @returns {HRESULT} 
     */
    put_MaxRange(lnMaxRange) {
        result := ComCall(25, this, "int", lnMaxRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_MinRange(retval) {
        result := ComCall(26, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lnMinRange 
     * @returns {HRESULT} 
     */
    put_MinRange(lnMinRange) {
        result := ComCall(27, this, "int", lnMinRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_MultiValued(retval) {
        result := ComCall(28, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fMultiValued 
     * @returns {HRESULT} 
     */
    put_MultiValued(fMultiValued) {
        result := ComCall(29, this, "short", fMultiValued, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IADsCollection>} ppQualifiers 
     * @returns {HRESULT} 
     */
    Qualifiers(ppQualifiers) {
        result := ComCall(30, this, "ptr", ppQualifiers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
