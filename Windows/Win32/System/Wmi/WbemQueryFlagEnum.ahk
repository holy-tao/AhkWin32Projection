#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Define the depth of enumeration or query, which determines how many objects are returned by a call.
 * @see https://learn.microsoft.com/windows/win32/api/wbemdisp/ne-wbemdisp-wbemqueryflagenum
 * @namespace Windows.Win32.System.Wmi
 */
export default struct WbemQueryFlagEnum {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Forces recursive enumeration into all subclasses derived from the specified parent class. The parent class itself is not returned in the enumeration.
     * @type {Integer (Int32)}
     */
    static wbemQueryFlagDeep => 0

    /**
     * Forces the enumeration to include only immediate subclasses of the specified parent class.
     * @type {Integer (Int32)}
     */
    static wbemQueryFlagShallow => 1

    /**
     * Used for prototyping. It stops the query from happening and instead returns an object that look like a typical result object.
     * @type {Integer (Int32)}
     */
    static wbemQueryFlagPrototype => 2
}
