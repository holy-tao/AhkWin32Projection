#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A vector with three components.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-mf_float3
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_FLOAT3 {
    #StructPack 4

    /**
     * X component of the vector.
     */
    x : Float32

    /**
     * Y component of the vector.
     */
    y : Float32

    /**
     * Z component of the vector.
     */
    z : Float32

}
