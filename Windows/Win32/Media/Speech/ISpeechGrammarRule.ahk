#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISpeechGrammarRuleState.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechGrammarRule extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechGrammarRule
     * @type {Guid}
     */
    static IID => Guid("{afe719cf-5dd1-44f2-999c-7a399f1cfccc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Attributes", "get_InitialState", "get_Name", "get_Id", "Clear", "AddResource", "AddState"]

    /**
     * @type {Integer} 
     */
    Attributes {
        get => this.get_Attributes()
    }

    /**
     * @type {ISpeechGrammarRuleState} 
     */
    InitialState {
        get => this.get_InitialState()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Attributes() {
        result := ComCall(7, this, "int*", &Attributes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Attributes
    }

    /**
     * 
     * @returns {ISpeechGrammarRuleState} 
     */
    get_InitialState() {
        result := ComCall(8, this, "ptr*", &State := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpeechGrammarRuleState(State)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        Name := BSTR()
        result := ComCall(9, this, "ptr", Name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Name
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        result := ComCall(10, this, "int*", &Id := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Id
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
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds a SYSTEM_RESOURCE_ATTRIBUTE_ACEaccess control entry (ACE) to the end of a system access control list (SACL).
     * @param {BSTR} ResourceName 
     * @param {BSTR} ResourceValue 
     * @returns {HRESULT} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/securitybaseapi/nf-securitybaseapi-addresourceattributeace
     */
    AddResource(ResourceName, ResourceValue) {
        if(ResourceName is String) {
            pin := BSTR.Alloc(ResourceName)
            ResourceName := pin.Value
        }
        if(ResourceValue is String) {
            pin := BSTR.Alloc(ResourceValue)
            ResourceValue := pin.Value
        }

        result := ComCall(12, this, "ptr", ResourceName, "ptr", ResourceValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ISpeechGrammarRuleState} 
     */
    AddState() {
        result := ComCall(13, this, "ptr*", &State := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpeechGrammarRuleState(State)
    }
}
