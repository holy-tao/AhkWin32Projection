#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_QUEUEDLIMIT_TYPE.ahk" { D3DKMT_QUEUEDLIMIT_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_SETQUEUEDLIMIT {
    #StructPack 4

    hDevice : UInt32

    Type : D3DKMT_QUEUEDLIMIT_TYPE

    QueuedPresentLimit : UInt32

    QueuedPendingFlipLimit : UInt32

    static __New() {
        DefineProp(this.Prototype, 'VidPnSourceId', { type: UInt32, offset: 8 })
        this.DeleteProp("__New")
    }
}
