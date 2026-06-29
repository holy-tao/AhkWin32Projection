#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\VHF_CONFIG.ahk" { VHF_CONFIG }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\HID_XFER_PACKET.ahk" { HID_XFER_PACKET }

/**
 * @namespace Windows.Wdk.Devices.HumanInterfaceDevice
 */

;@region Functions
/**
 * 
 * @param {Pointer<VHF_CONFIG>} VhfConfig 
 * @param {Pointer<Pointer<Void>>} VhfHandle 
 * @returns {NTSTATUS} 
 */
export VhfCreate(VhfConfig, VhfHandle) {
    VhfHandleMarshal := VhfHandle is VarRef ? "ptr*" : "ptr"

    result := DllCall("VhfUm.DLL\VhfCreate", VHF_CONFIG.Ptr, VhfConfig, VhfHandleMarshal, VhfHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} VhfHandle 
 * @returns {NTSTATUS} 
 */
export VhfStart(VhfHandle) {
    VhfHandleMarshal := VhfHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VhfUm.DLL\VhfStart", VhfHandleMarshal, VhfHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} VhfHandle 
 * @param {BOOLEAN} Wait 
 * @returns {String} Nothing - always returns an empty string
 */
export VhfDelete(VhfHandle, Wait) {
    VhfHandleMarshal := VhfHandle is VarRef ? "ptr" : "ptr"

    DllCall("VhfUm.DLL\VhfDelete", VhfHandleMarshal, VhfHandle, BOOLEAN, Wait)
}

/**
 * 
 * @param {Pointer<Void>} VhfHandle 
 * @param {Pointer<HID_XFER_PACKET>} HidTransferPacket 
 * @returns {NTSTATUS} 
 */
export VhfReadReportSubmit(VhfHandle, HidTransferPacket) {
    VhfHandleMarshal := VhfHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VhfUm.DLL\VhfReadReportSubmit", VhfHandleMarshal, VhfHandle, HID_XFER_PACKET.Ptr, HidTransferPacket, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Void>} VhfOperationHandle 
 * @param {NTSTATUS} CompletionStatus 
 * @returns {NTSTATUS} 
 */
export VhfAsyncOperationComplete(VhfOperationHandle, CompletionStatus) {
    VhfOperationHandleMarshal := VhfOperationHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VhfUm.DLL\VhfAsyncOperationComplete", VhfOperationHandleMarshal, VhfOperationHandle, NTSTATUS, CompletionStatus, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

;@endregion Functions
