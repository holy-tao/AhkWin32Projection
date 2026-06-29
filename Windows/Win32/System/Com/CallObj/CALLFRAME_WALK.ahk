#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Determines the parameter type to be walked.
 * @see https://learn.microsoft.com/windows/win32/api/callobj/ne-callobj-callframe_walk
 * @namespace Windows.Win32.System.Com.CallObj
 */
export default struct CALLFRAME_WALK {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The [in] parameter values will be walked.
     * @type {Integer (Int32)}
     */
    static CALLFRAME_WALK_IN => 1

    /**
     * The [in, out] parameter values will be walked.
     * @type {Integer (Int32)}
     */
    static CALLFRAME_WALK_INOUT => 2

    /**
     * The [out] parameter values will be walked.
     * @type {Integer (Int32)}
     */
    static CALLFRAME_WALK_OUT => 4
}
