#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Elements of the TfIntegratableCandidateListSelectionStyle enumeration specify the integratable candidate list selection styles.
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/ne-ctffunc-tfintegratablecandidatelistselectionstyle
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TfIntegratableCandidateListSelectionStyle {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The selection can be changed with the arrow keys.
     * @type {Integer (Int32)}
     */
    static STYLE_ACTIVE_SELECTION => 0

    /**
     * The default selection key will choose the selection.
     * @type {Integer (Int32)}
     */
    static STYLE_IMPLIED_SELECTION => 1
}
