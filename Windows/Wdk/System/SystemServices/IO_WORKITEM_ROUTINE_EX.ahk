#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class IO_WORKITEM_ROUTINE_EX extends IUnknown {

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
     * @param {Pointer<Void>} IoObject 
     * @param {Pointer<Void>} Context_ 
     * @param {PIO_WORKITEM} IoWorkItem 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(IoObject, Context_, IoWorkItem) {
        IoWorkItem := IoWorkItem is Win32Handle ? NumGet(IoWorkItem, "ptr") : IoWorkItem

        IoObjectMarshal := IoObject is VarRef ? "ptr" : "ptr"
        Context_Marshal := Context_ is VarRef ? "ptr" : "ptr"

        ComCall(3, this, IoObjectMarshal, IoObject, Context_Marshal, Context_, "ptr", IoWorkItem)
    }
}
