#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Wdk.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class HumanInterfaceDevice {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer<VHF_CONFIG>} VhfConfig 
     * @param {Pointer<Pointer<Void>>} VhfHandle 
     * @returns {NTSTATUS} 
     */
    static VhfCreate(VhfConfig, VhfHandle) {
        VhfHandleMarshal := VhfHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("VhfUm.DLL\VhfCreate", "ptr", VhfConfig, VhfHandleMarshal, VhfHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} VhfHandle 
     * @returns {NTSTATUS} 
     */
    static VhfStart(VhfHandle) {
        VhfHandleMarshal := VhfHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("VhfUm.DLL\VhfStart", VhfHandleMarshal, VhfHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} VhfHandle 
     * @param {BOOLEAN} Wait 
     * @returns {String} Nothing - always returns an empty string
     */
    static VhfDelete(VhfHandle, Wait) {
        VhfHandleMarshal := VhfHandle is VarRef ? "ptr" : "ptr"

        DllCall("VhfUm.DLL\VhfDelete", VhfHandleMarshal, VhfHandle, "char", Wait)
    }

    /**
     * 
     * @param {Pointer<Void>} VhfHandle 
     * @param {Pointer<HID_XFER_PACKET>} HidTransferPacket 
     * @returns {NTSTATUS} 
     */
    static VhfReadReportSubmit(VhfHandle, HidTransferPacket) {
        VhfHandleMarshal := VhfHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("VhfUm.DLL\VhfReadReportSubmit", VhfHandleMarshal, VhfHandle, "ptr", HidTransferPacket, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} VhfOperationHandle 
     * @param {NTSTATUS} CompletionStatus 
     * @returns {NTSTATUS} 
     */
    static VhfAsyncOperationComplete(VhfOperationHandle, CompletionStatus) {
        VhfOperationHandleMarshal := VhfOperationHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("VhfUm.DLL\VhfAsyncOperationComplete", VhfOperationHandleMarshal, VhfOperationHandle, "int", CompletionStatus, "int")
        return result
    }

;@endregion Methods
}
