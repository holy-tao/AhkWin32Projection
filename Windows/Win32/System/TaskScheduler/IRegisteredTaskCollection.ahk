#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains all the tasks that are registered.
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-iregisteredtaskcollection
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IRegisteredTaskCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRegisteredTaskCollection
     * @type {Guid}
     */
    static IID => Guid("{86627eb4-42a7-41e4-a4d9-ac33a72f2d52}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_Item", "get__NewEnum"]

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtaskcollection-get_count
     */
    get_Count(pCount) {
        pCountMarshal := pCount is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} index 
     * @param {Pointer<IRegisteredTask>} ppRegisteredTask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtaskcollection-get_item
     */
    get_Item(index, ppRegisteredTask) {
        result := ComCall(8, this, "ptr", index, "ptr*", ppRegisteredTask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtaskcollection-get__newenum
     */
    get__NewEnum(ppEnum) {
        result := ComCall(9, this, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
