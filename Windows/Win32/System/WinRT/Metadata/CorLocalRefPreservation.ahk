#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct CorLocalRefPreservation {
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
    static MDPreserveLocalRefsNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static MDPreserveLocalTypeRef => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDPreserveLocalMemberRef => 2
}
