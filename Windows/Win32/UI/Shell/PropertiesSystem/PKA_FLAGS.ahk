#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes property change array behavior.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/ne-propsys-pka_flags
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct PKA_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Replace current value.
     * @type {Integer (Int32)}
     */
    static PKA_SET => 0

    /**
     * Append to current value - multi-value properties only.
     * @type {Integer (Int32)}
     */
    static PKA_APPEND => 1

    /**
     * Delete from current value - multi-value properties only.
     * @type {Integer (Int32)}
     */
    static PKA_DELETE => 2
}
