#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_GETVPORTAUTOFLIPSURFACEDATA {
    value : IntPtr

    __value {
        set {
            if (value is PDD_GETVPORTAUTOFLIPSURFACEDATA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    __New(value := 0) {
        this.value := value
    }
}
