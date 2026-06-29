#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Determines whether the enumeration operation should continue or stop.
 * @see https://learn.microsoft.com/windows/win32/api/avrfsdk/ne-avrfsdk-eheapenumerationlevel
 * @namespace Windows.Win32.System.ApplicationVerifier
 */
export default struct eHeapEnumerationLevel {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A constant that specifies the enumeration should continue.
     * @type {Integer (Int32)}
     */
    static HeapEnumerationEverything => 0

    /**
     * A constant that specifies to the <a href="https://docs.microsoft.com/windows/desktop/api/avrfsdk/nf-avrfsdk-verifierenumerateresource">VerifierEnumerateResource</a> function when the enumeration operation should stop.
     * 
     * Codes from 0x1 to 0xFFFFFFE are reserved.
     * @type {Integer (Int32)}
     */
    static HeapEnumerationStop => -1
}
