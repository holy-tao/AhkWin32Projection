#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the default, maximum, and minimum values allowed for an unsigned large integer.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ns-resapi-resutil_ulargeint_data
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct RESUTIL_ULARGEINT_DATA {
    #StructPack 8

    /**
     * The default value.
     */
    Default : Int64

    /**
     * The minimum value.
     */
    Minimum : Int64

    /**
     * The maximum value.
     */
    Maximum : Int64

}
