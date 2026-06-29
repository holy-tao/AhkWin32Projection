#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify an adapter's memory segment grouping.
 * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/ne-dxcore_interface-dxcoresegmentgroup
 * @namespace Windows.Win32.Graphics.DXCore
 */
export default struct DXCoreSegmentGroup {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies a grouping of segments that is considered local to the adapter, and represents the fastest memory available to the GPU. Your application should target the local segment group as the target size for its working set.
     * @type {Integer (UInt32)}
     */
    static Local => 0

    /**
     * Specifies a grouping of segments that is considered non-local to the adapter, and may have slower performance than the local segment group.
     * @type {Integer (UInt32)}
     */
    static NonLocal => 1
}
