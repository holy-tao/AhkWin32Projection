#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_OFFER_PRIORITY.ahk" { D3DKMT_OFFER_PRIORITY }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_OFFERALLOCATIONS {
    #StructPack 8

    hDevice : UInt32

    pResources : IntPtr

    HandleList : IntPtr

    NumAllocations : UInt32

    Priority : D3DKMT_OFFER_PRIORITY

    Flags : IntPtr

}
