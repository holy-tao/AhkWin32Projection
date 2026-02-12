#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * An application-defined callback function that receives a wait chain. Specify this address when calling the OpenThreadWaitChainSession function.
 * @see https://learn.microsoft.com/windows/win32/api//content/wct/nc-wct-pwaitchaincallback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class PWAITCHAINCALLBACK extends IUnknown {

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
     * @param {Pointer<Void>} WctHandle 
     * @param {Pointer} Context_ 
     * @param {Integer} CallbackStatus 
     * @param {Pointer<Integer>} NodeCount 
     * @param {Pointer<WAITCHAIN_NODE_INFO>} NodeInfoArray 
     * @param {Pointer<BOOL>} IsCycle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(WctHandle, Context_, CallbackStatus, NodeCount, NodeInfoArray, IsCycle) {
        WctHandleMarshal := WctHandle is VarRef ? "ptr" : "ptr"
        NodeCountMarshal := NodeCount is VarRef ? "uint*" : "ptr"
        IsCycleMarshal := IsCycle is VarRef ? "int*" : "ptr"

        ComCall(3, this, WctHandleMarshal, WctHandle, "ptr", Context_, "uint", CallbackStatus, NodeCountMarshal, NodeCount, "ptr", NodeInfoArray, IsCycleMarshal, IsCycle)
    }
}
