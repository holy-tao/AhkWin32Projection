#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct PROOF_OF_POSSESSION_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static PROOF_OF_POSSESSION_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROOF_OF_POSSESSION_ALLOW_SILENT_REQUESTS => 1
}
