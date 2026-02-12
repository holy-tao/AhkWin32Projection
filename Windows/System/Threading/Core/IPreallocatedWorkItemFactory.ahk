#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PreallocatedWorkItem.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Threading.Core
 * @version WindowsRuntime 1.4
 */
class IPreallocatedWorkItemFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPreallocatedWorkItemFactory
     * @type {Guid}
     */
    static IID => Guid("{e3d32b45-dfea-469b-82c5-f6e3cefdeafb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWorkItem", "CreateWorkItemWithPriority", "CreateWorkItemWithPriorityAndOptions"]

    /**
     * 
     * @param {WorkItemHandler} handler 
     * @returns {PreallocatedWorkItem} 
     */
    CreateWorkItem(handler) {
        result := ComCall(6, this, "ptr", handler, "ptr*", &workItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PreallocatedWorkItem(workItem)
    }

    /**
     * 
     * @param {WorkItemHandler} handler 
     * @param {Integer} priority_ 
     * @returns {PreallocatedWorkItem} 
     */
    CreateWorkItemWithPriority(handler, priority_) {
        result := ComCall(7, this, "ptr", handler, "int", priority_, "ptr*", &WorkItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PreallocatedWorkItem(WorkItem)
    }

    /**
     * 
     * @param {WorkItemHandler} handler 
     * @param {Integer} priority_ 
     * @param {Integer} options 
     * @returns {PreallocatedWorkItem} 
     */
    CreateWorkItemWithPriorityAndOptions(handler, priority_, options) {
        result := ComCall(8, this, "ptr", handler, "int", priority_, "uint", options, "ptr*", &WorkItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PreallocatedWorkItem(WorkItem)
    }
}
