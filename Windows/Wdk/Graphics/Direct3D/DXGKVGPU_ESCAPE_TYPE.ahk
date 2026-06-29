#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKVGPU_ESCAPE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static DXGKVGPU_ESCAPE_TYPE_READ_PCI_CONFIG => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGKVGPU_ESCAPE_TYPE_WRITE_PCI_CONFIG => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGKVGPU_ESCAPE_TYPE_INITIALIZE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGKVGPU_ESCAPE_TYPE_RELEASE => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXGKVGPU_ESCAPE_TYPE_GET_VGPU_TYPE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXGKVGPU_ESCAPE_TYPE_POWERTRANSITIONCOMPLETE => 5

    /**
     * @type {Integer (Int32)}
     */
    static DXGKVGPU_ESCAPE_TYPE_PAUSE => 6

    /**
     * @type {Integer (Int32)}
     */
    static DXGKVGPU_ESCAPE_TYPE_RESUME => 7
}
