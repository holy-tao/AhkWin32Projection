#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies which modifier key was pressed.
 * @remarks
 * In C++, explicit casting is required when trying to set more than one flag at a time. A compilation error occurs if explicit casting is not used.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkshiftkeymodifierflags
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct InkShiftKeyModifierFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The SHIFT key was used as a modifier.
     * @type {Integer (Int32)}
     */
    static IKM_Shift => 1

    /**
     * The CTRL key was used as a modifier.
     * @type {Integer (Int32)}
     */
    static IKM_Control => 2

    /**
     * The ALT key was used as a modifier.
     * @type {Integer (Int32)}
     */
    static IKM_Alt => 4
}
