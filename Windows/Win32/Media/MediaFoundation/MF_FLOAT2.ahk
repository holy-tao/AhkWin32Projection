#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A vector with two components.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-mf_float2
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_FLOAT2 {
    #StructPack 4

    /**
     * X component of the vector.
     */
    x : Float32

    /**
     * Y component of the vector.
     */
    y : Float32

}
