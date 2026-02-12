#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class EVT_VHF_ASYNC_OPERATION extends IUnknown {

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
     * @param {Pointer<Void>} VhfClientContext 
     * @param {Pointer<Void>} VhfOperationHandle 
     * @param {Pointer<Void>} VhfOperationContext 
     * @param {Pointer<HID_XFER_PACKET>} HidTransferPacket 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(VhfClientContext, VhfOperationHandle, VhfOperationContext, HidTransferPacket) {
        VhfClientContextMarshal := VhfClientContext is VarRef ? "ptr" : "ptr"
        VhfOperationHandleMarshal := VhfOperationHandle is VarRef ? "ptr" : "ptr"
        VhfOperationContextMarshal := VhfOperationContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, VhfClientContextMarshal, VhfClientContext, VhfOperationHandleMarshal, VhfOperationHandle, VhfOperationContextMarshal, VhfOperationContext, "ptr", HidTransferPacket)
    }
}
