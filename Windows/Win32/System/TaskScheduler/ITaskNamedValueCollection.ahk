#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITaskNamedValuePair.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains a collection of ITaskNamedValuePair interface name-value pairs.
 * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nn-taskschd-itasknamedvaluecollection
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class ITaskNamedValueCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITaskNamedValueCollection
     * @type {Guid}
     */
    static IID => Guid("{b4ef826b-63c3-46e4-a504-ef69e4f7ea4d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_Item", "get__NewEnum", "Create", "Remove", "Clear"]

    /**
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Gets the number of name-value pairs in the collection.
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-itasknamedvaluecollection-get_count
     */
    get_Count(pCount) {
        pCountMarshal := pCount is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pCountMarshal, pCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the specified name-value pair from the collection.
     * @param {Integer} index 
     * @returns {ITaskNamedValuePair} 
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-itasknamedvaluecollection-get_item
     */
    get_Item(index) {
        result := ComCall(8, this, "int", index, "ptr*", &ppPair := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITaskNamedValuePair(ppPair)
    }

    /**
     * Gets the collection enumerator for the name-value pair collection.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-itasknamedvaluecollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppEnum)
    }

    /**
     * Creates a name-value pair in the collection.
     * @param {BSTR} name The name associated with a value in a name-value pair.
     * @param {BSTR} value The value associated with a name in a name-value pair.
     * @returns {ITaskNamedValuePair} The name-value pair created in the collection.
     * 
     * Pass in a reference to a <b>NULL</b> <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-itasknamedvaluepair">ITaskNamedValuePair</a> interface pointer. Referencing a non-<b>NULL</b> pointer can cause a memory leak because the pointer will be overwritten.
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-itasknamedvaluecollection-create
     */
    Create(name, value) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }
        if(value is String) {
            pin := BSTR.Alloc(value)
            value := pin.Value
        }

        result := ComCall(10, this, "ptr", name, "ptr", value, "ptr*", &ppPair := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITaskNamedValuePair(ppPair)
    }

    /**
     * Removes a selected name-value pair from the collection.
     * @param {Integer} index The index of the name-value pair to be removed.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-itasknamedvaluecollection-remove
     */
    Remove(index) {
        result := ComCall(11, this, "int", index, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Clears the entire collection of name-value pairs.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-itasknamedvaluecollection-clear
     */
    Clear() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
