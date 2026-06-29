#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_DEVICEEXECUTION_STATE.ahk" { D3DKMT_DEVICEEXECUTION_STATE }
#Import ".\D3DKMT_DEVICESTATE_TYPE.ahk" { D3DKMT_DEVICESTATE_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_GETDEVICESTATE {
    #StructPack 8

    hDevice : UInt32

    StateType : D3DKMT_DEVICESTATE_TYPE

    ExecutionState : D3DKMT_DEVICEEXECUTION_STATE

    static __New() {
        DefineProp(this.Prototype, 'PresentState', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'ResetState', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'PresentStateDWM', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'PageFaultState', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'PresentQueueState', { type: IntPtr, offset: 8 })
        this.DeleteProp("__New")
    }
}
