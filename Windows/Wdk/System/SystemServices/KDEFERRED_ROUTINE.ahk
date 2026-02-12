#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class KDEFERRED_ROUTINE extends IUnknown {

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
     * @param {Pointer<KDPC>} Dpc 
     * @param {Pointer<Void>} DeferredContext 
     * @param {Pointer<Void>} SystemArgument1 
     * @param {Pointer<Void>} SystemArgument2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Dpc, DeferredContext, SystemArgument1, SystemArgument2) {
        DeferredContextMarshal := DeferredContext is VarRef ? "ptr" : "ptr"
        SystemArgument1Marshal := SystemArgument1 is VarRef ? "ptr" : "ptr"
        SystemArgument2Marshal := SystemArgument2 is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", Dpc, DeferredContextMarshal, DeferredContext, SystemArgument1Marshal, SystemArgument1, SystemArgument2Marshal, SystemArgument2)
    }
}
