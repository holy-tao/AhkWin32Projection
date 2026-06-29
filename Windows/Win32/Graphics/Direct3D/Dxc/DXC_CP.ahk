#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
export default struct DXC_CP {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static DXC_CP_ACP => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DXC_CP_UTF16 => 1200

    /**
     * @type {Integer (UInt32)}
     */
    static DXC_CP_UTF8 => 65001

    /**
     * @type {Integer (UInt32)}
     */
    static DXC_CP_UTF32 => 12000

    /**
     * @type {Integer (UInt32)}
     */
    static DXC_CP_WIDE => 1200
}
