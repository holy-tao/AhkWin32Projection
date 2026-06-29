#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information that is used to convert between container units, expressed in floating point, and control units, expressed in HIMETRIC.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/ns-ocidl-pointf
 * @namespace Windows.Win32.System.Ole
 */
export default struct POINTF {
    #StructPack 4

    /**
     * The x coordinates of the point in units that the container finds convenient.
     */
    x : Float32

    /**
     * The y coordinates of the point in units that the container finds convenient.
     */
    y : Float32

}
