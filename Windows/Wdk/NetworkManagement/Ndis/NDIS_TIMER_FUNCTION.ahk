#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_TIMER_FUNCTION extends IUnknown {

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
     * @param {Pointer<Void>} SystemSpecific1 
     * @param {Pointer<Void>} FunctionContext 
     * @param {Pointer<Void>} SystemSpecific2 
     * @param {Pointer<Void>} SystemSpecific3 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(SystemSpecific1, FunctionContext, SystemSpecific2, SystemSpecific3) {
        SystemSpecific1Marshal := SystemSpecific1 is VarRef ? "ptr" : "ptr"
        FunctionContextMarshal := FunctionContext is VarRef ? "ptr" : "ptr"
        SystemSpecific2Marshal := SystemSpecific2 is VarRef ? "ptr" : "ptr"
        SystemSpecific3Marshal := SystemSpecific3 is VarRef ? "ptr" : "ptr"

        ComCall(3, this, SystemSpecific1Marshal, SystemSpecific1, FunctionContextMarshal, FunctionContext, SystemSpecific2Marshal, SystemSpecific2, SystemSpecific3Marshal, SystemSpecific3)
    }
}
