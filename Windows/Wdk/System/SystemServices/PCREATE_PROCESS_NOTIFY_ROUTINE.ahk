#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCREATE_PROCESS_NOTIFY_ROUTINE extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HANDLE} ParentId 
     * @param {HANDLE} ProcessId 
     * @param {BOOLEAN} Create 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ParentId, ProcessId, Create) {
        ParentId := ParentId is Win32Handle ? NumGet(ParentId, "ptr") : ParentId
        ProcessId := ProcessId is Win32Handle ? NumGet(ProcessId, "ptr") : ProcessId

        ComCall(3, this, "ptr", ParentId, "ptr", ProcessId, "char", Create)
    }
}
