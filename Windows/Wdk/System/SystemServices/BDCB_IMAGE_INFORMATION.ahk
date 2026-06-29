#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BDCB_CLASSIFICATION.ahk" { BDCB_CLASSIFICATION }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct BDCB_IMAGE_INFORMATION {
    #StructPack 8

    Classification : BDCB_CLASSIFICATION

    ImageFlags : UInt32

    ImageName : IntPtr

    RegistryPath : IntPtr

    CertificatePublisher : IntPtr

    CertificateIssuer : IntPtr

    ImageHash : IntPtr

    CertificateThumbprint : IntPtr

    ImageHashAlgorithm : UInt32

    ThumbprintHashAlgorithm : UInt32

    ImageHashLength : UInt32

    CertificateThumbprintLength : UInt32

}
