#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the content of generated object text and is used by SWbemObject.GetObjectText_.
 * @see https://learn.microsoft.com/windows/win32/api/wbemdisp/ne-wbemdisp-wbemtextflagenum
 * @namespace Windows.Win32.System.Wmi
 */
export default struct WbemTextFlagEnum {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Excludes qualifier flavors from the object text.
     * @type {Integer (Int32)}
     */
    static wbemTextFlagNoFlavors => 1
}
