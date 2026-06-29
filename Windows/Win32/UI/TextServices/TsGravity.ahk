#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Elements of the TsGravity enumeration specify the gravity type associated with an IAnchor object.
 * @see https://learn.microsoft.com/windows/win32/api/textstor/ne-textstor-tsgravity
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TsGravity {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The anchor has backward gravity. For more information about anchor gravity, see <a href="https://docs.microsoft.com/windows/desktop/TSF/ranges">Ranges</a>.
     * @type {Integer (Int32)}
     */
    static TS_GR_BACKWARD => 0

    /**
     * The anchor has forward gravity. For more information about anchor gravity, see <a href="https://docs.microsoft.com/windows/desktop/TSF/ranges">Ranges</a>.
     * @type {Integer (Int32)}
     */
    static TS_GR_FORWARD => 1
}
