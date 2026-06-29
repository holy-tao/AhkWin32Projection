#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Controls how a type library is registered.
 * @see https://learn.microsoft.com/windows/win32/api/oleauto/ne-oleauto-regkind
 * @namespace Windows.Win32.System.Ole
 */
export default struct REGKIND {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Use default register behavior.
     * @type {Integer (Int32)}
     */
    static REGKIND_DEFAULT => 0

    /**
     * Register this type library.
     * @type {Integer (Int32)}
     */
    static REGKIND_REGISTER => 1

    /**
     * Do not register this type library.
     * @type {Integer (Int32)}
     */
    static REGKIND_NONE => 2
}
