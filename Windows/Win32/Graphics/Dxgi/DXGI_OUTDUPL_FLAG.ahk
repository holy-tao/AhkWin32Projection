#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_OUTDUPL_FLAG {
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
    static DXGI_OUTDUPL_COMPOSITED_UI_CAPTURE_ONLY => 1
}
