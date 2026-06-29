#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Animation
 */
export default struct UI_ANIMATION_KEYFRAME {
    value : IntPtr

    __value {
        set {
            if (value is UI_ANIMATION_KEYFRAME) {
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
