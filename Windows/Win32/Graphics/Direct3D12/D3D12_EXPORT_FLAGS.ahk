#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The flags to apply when exporting symbols from a state subobject.
 * @remarks
 * No export flags are defined in the current release.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_export_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_EXPORT_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No export flags.
     * @type {Integer (Int32)}
     */
    static D3D12_EXPORT_FLAG_NONE => 0
}
