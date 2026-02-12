#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ITypeNameBuilder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITypeNameBuilder
     * @type {Guid}
     */
    static IID => Guid("{b81ff171-20f3-11d2-8dcc-00a0c9b00523}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenGenericArguments", "CloseGenericArguments", "OpenGenericArgument", "CloseGenericArgument", "AddName", "AddPointer", "AddByRef", "AddSzArray", "AddArray", "AddAssemblySpec", "ToString", "Clear"]

    /**
     * 
     * @returns {HRESULT} 
     */
    OpenGenericArguments() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CloseGenericArguments() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OpenGenericArgument() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CloseGenericArgument() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} szName 
     * @returns {HRESULT} 
     */
    AddName(szName) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(7, this, "ptr", szName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Include the specified pointer in the set of pointers processed by the Interaction Context object.
     * @remarks
     * Turn pointer filtering on by setting INTERACTION_CONTEXT_PROPERTY_FILTER_POINTERS in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/nf-interactioncontext-setpropertyinteractioncontext">SetPropertyInteractionContext</a>.
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/interactioncontext/nf-interactioncontext-addpointerinteractioncontext
     */
    AddPointer() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AddByRef() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AddSzArray() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} rank 
     * @returns {HRESULT} 
     */
    AddArray(rank) {
        result := ComCall(11, this, "uint", rank, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} szAssemblySpec 
     * @returns {HRESULT} 
     */
    AddAssemblySpec(szAssemblySpec) {
        szAssemblySpec := szAssemblySpec is String ? StrPtr(szAssemblySpec) : szAssemblySpec

        result := ComCall(12, this, "ptr", szAssemblySpec, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * ToString (geometry Data Type)
     * @remarks
     * This method will return the string "Null" when called on null instances.  
     *   
     *  On non-null instances, this method is equivalent to using `AsTextZM().`
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/sql/ocs/docs/t-sql/spatial-geometry/tostring-geometry-data-type
     */
    ToString() {
        pszStringRepresentation := BSTR()
        result := ComCall(13, this, "ptr", pszStringRepresentation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pszStringRepresentation
    }

    /**
     * Clear Method (ADO)
     * @remarks
     * Use the **Clear** method on the [Errors](./errors-collection-ado.md) collection to remove all existing [Error](./error-object.md) objects from the collection. When an error occurs, ADO automatically clears the **Errors** collection and fills it with **Error** objects based on the new error.  
     *   
     *  Some properties and methods return warnings that appear as **Error** objects in the **Errors** collection but do not halt a program's execution. Before you call the [Resync](./resync-method.md), [UpdateBatch](./updatebatch-method.md), or [CancelBatch](./cancelbatch-method-ado.md) methods on a [Recordset](./recordset-object-ado.md) object; the [Open](./open-method-ado-connection.md) method on a [Connection](./connection-object-ado.md) object; or set the [Filter](./filter-property.md) property on a **Recordset** object, call the **Clear** method on the **Errors** collection. That way, you can read the [Count](./count-property-ado.md) property of the **Errors** collection to test for returned warnings.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/clear-method-ado
     */
    Clear() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
