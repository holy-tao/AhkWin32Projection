#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Creates a name-value pair in which the name is associated with the value.
 * @remarks
 * 
  * When reading or writing your own XML for a task, a name-value pair is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-valuequeries-eventtriggertype-element">ValueQueries</a> element of the Task Scheduler schema.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-itasknamedvaluepair
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class ITaskNamedValuePair extends IDispatch{
    /**
     * The interface identifier for ITaskNamedValuePair
     * @type {Guid}
     */
    static IID => Guid("{39038068-2b46-4afd-8662-7bb6f868d221}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     */
    get_Name(pName) {
        result := ComCall(7, this, "ptr", pName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_Value(pValue) {
        result := ComCall(9, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
