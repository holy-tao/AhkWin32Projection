#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A four dimensional vector, used to represent a rotation.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-mf_quaternion
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_QUATERNION {
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

    /**
     * W component of the vector.
     */
    w : Float32

}
