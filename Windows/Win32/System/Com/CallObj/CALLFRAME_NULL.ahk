#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Determines the parameter type to be freed. (CALLFRAME_NULL)
 * @see https://learn.microsoft.com/windows/win32/api/callobj/ne-callobj-callframe_null
 * @namespace Windows.Win32.System.Com.CallObj
 */
export default struct CALLFRAME_NULL {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No values are freed.
     * @type {Integer (Int32)}
     */
    static CALLFRAME_NULL_NONE => 0

    /**
     * The data referenced by [in, out] parameters are freed.
     * @type {Integer (Int32)}
     */
    static CALLFRAME_NULL_INOUT => 2

    /**
     * The data referenced by [out] parameters are freed.
     * @type {Integer (Int32)}
     */
    static CALLFRAME_NULL_OUT => 4

    /**
     * All [out] and [in, out] parameters are freed.
     * @type {Integer (Int32)}
     */
    static CALLFRAME_NULL_ALL => 6
}
