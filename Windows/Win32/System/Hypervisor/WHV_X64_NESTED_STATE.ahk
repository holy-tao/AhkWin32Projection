#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_NESTED_ENLIGHTENMENTS_CONTROL.ahk
#Include .\WHV_NESTED_STATE_TYPE.ahk
#Include .\WHV_SVM_NESTED_HOST_STATE.ahk
#Include .\WHV_SVM_VMCB_SELECTOR.ahk
#Include .\WHV_X64_SVM_NESTED_STATE.ahk
#Include .\WHV_X64_VMX_NESTED_STATE.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @architecture X64, Arm64
 */
class WHV_X64_NESTED_STATE extends Win32Struct {
    static sizeof => 16384

    static packingSize => 8

    /**
     * @type {WHV_X64_VMX_NESTED_STATE}
     */
    Vmx {
        get {
            if(!this.HasProp("__Vmx"))
                this.__Vmx := WHV_X64_VMX_NESTED_STATE(0, this)
            return this.__Vmx
        }
    }

    /**
     * @type {WHV_X64_SVM_NESTED_STATE}
     */
    Svm {
        get {
            if(!this.HasProp("__Svm"))
                this.__Svm := WHV_X64_SVM_NESTED_STATE(0, this)
            return this.__Svm
        }
    }
}
