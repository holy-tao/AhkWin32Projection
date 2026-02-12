#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class PROTOCOL_CL_MAKE_CALL_COMPLETE extends IUnknown {

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
     * @param {Integer} Status_ 
     * @param {Pointer<Void>} ProtocolVcContext 
     * @param {Pointer<Void>} NdisPartyHandle 
     * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Status_, ProtocolVcContext, NdisPartyHandle, CallParameters) {
        ProtocolVcContextMarshal := ProtocolVcContext is VarRef ? "ptr" : "ptr"
        NdisPartyHandleMarshal := NdisPartyHandle is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "int", Status_, ProtocolVcContextMarshal, ProtocolVcContext, NdisPartyHandleMarshal, NdisPartyHandle, "ptr", CallParameters)
    }
}
