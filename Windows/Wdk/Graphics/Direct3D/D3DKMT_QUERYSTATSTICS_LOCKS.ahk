#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATSTICS_LOCKS {
    #StructPack 4

    NbLocks : UInt32

    NbLocksWaitFlag : UInt32

    NbLocksDiscardFlag : UInt32

    NbLocksNoOverwrite : UInt32

    NbLocksNoReadSync : UInt32

    NbLocksLinearization : UInt32

    NbComplexLocks : UInt32

}
