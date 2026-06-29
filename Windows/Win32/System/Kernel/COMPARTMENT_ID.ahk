#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The COMPARTMENT_ID enumeration indicates the network routing compartment identifier.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-compartment_id
 * @namespace Windows.Win32.System.Kernel
 */
export default struct COMPARTMENT_ID {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that the routing compartment is undefined.
     * @type {Integer (Int32)}
     */
    static UNSPECIFIED_COMPARTMENT_ID => 0

    /**
     * Indicates the default routing compartment.
     * @type {Integer (Int32)}
     */
    static DEFAULT_COMPARTMENT_ID => 1
}
