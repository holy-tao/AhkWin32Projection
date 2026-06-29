#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
class IEnumManagerFrames extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumManagerFrames
     * @type {Guid}
     */
    static IID => Guid("{3caa826a-9b1f-4a79-bc81-f0430ded1648}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Count", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<Pointer<HWND>>} ppWindows 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, ppWindows, pceltFetched) {
        ppWindowsMarshal := ppWindows is VarRef ? "ptr*" : "ptr"
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, ppWindowsMarshal, ppWindows, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * Specifies the number of times that the Task Scheduler will attempt to restart the task.
     * @remarks
     * If this element is specified, the [**Interval**](taskschedulerschema-interval-restarttype-element.md) element must also be specified to tell the Task Scheduler how long to attempt to restart the task.
     * 
     * For C++ development, see [**RestartCount Property of ITaskSettings**](/windows/desktop/api/taskschd/nf-taskschd-itasksettings-get_restartcount).
     * 
     * For script development, see [**TaskSettings.RestartCount**](tasksettings-restartcount.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/TaskSchd/taskschedulerschema-count-restarttype-element
     */
    Count() {
        result := ComCall(4, this, "uint*", &pcelt := 0, "HRESULT")
        return pcelt
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     */
    Skip(celt) {
        result := ComCall(5, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumManagerFrames} 
     */
    Clone() {
        result := ComCall(7, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumManagerFrames(ppEnum)
    }
}
