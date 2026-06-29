#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a polynomial lens distortion model.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-mfcameraintrinsic_distortionmodel
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFCameraIntrinsic_DistortionModel {
    #StructPack 4

    /**
     * The first radial distortion coefficient.
     */
    Radial_k1 : Float32

    /**
     * The second radial distortion coefficient.
     */
    Radial_k2 : Float32

    /**
     * The third radial distortion coefficient.
     */
    Radial_k3 : Float32

    /**
     * The first tangential distortion coefficient.
     */
    Tangential_p1 : Float32

    /**
     * The second tangential distortion coefficient.
     */
    Tangential_p2 : Float32

}
