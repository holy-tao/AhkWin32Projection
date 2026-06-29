#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MF_QUATERNION.ahk" { MF_QUATERNION }
#Import ".\MFCameraExtrinsic_CalibratedTransform.ahk" { MFCameraExtrinsic_CalibratedTransform }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MF_FLOAT3.ahk" { MF_FLOAT3 }

/**
 * Describes the location of a camera relative to other cameras or an established external reference.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-mfcameraextrinsics
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFCameraExtrinsics {
    #StructPack 4

    /**
     * The number of transforms in the <i>CalibratedTransforms</i> array.
     */
    TransformCount : UInt32

    /**
     * The array of transforms in the extrinsic data.
     */
    CalibratedTransforms : MFCameraExtrinsic_CalibratedTransform[1]

}
