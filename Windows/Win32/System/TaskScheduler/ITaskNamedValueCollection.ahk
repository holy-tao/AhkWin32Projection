#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains a collection of ITaskNamedValuePair interface name-value pairs.
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-itasknamedvaluecollection
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
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasknamedvaluecollection-get_count
     */
    get_Count(pCount) {
        result := ComCall(7, this, "int*", pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<ITaskNamedValuePair>} ppPair 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasknamedvaluecollection-get_item
     */
    get_Item(index, ppPair) {
        result := ComCall(8, this, "int", index, "ptr*", ppPair, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasknamedvaluecollection-get__newenum
     */
    get__NewEnum(ppEnum) {
        result := ComCall(9, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {BSTR} value 
     * @param {Pointer<ITaskNamedValuePair>} ppPair 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasknamedvaluecollection-create
     */
    Create(name, value, ppPair) {
        name := name is String ? BSTR.Alloc(name).Value : name
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(10, this, "ptr", name, "ptr", value, "ptr*", ppPair, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasknamedvaluecollection-remove
     */
    Remove(index) {
        result := ComCall(11, this, "int", index, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itasknamedvaluecollection-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
