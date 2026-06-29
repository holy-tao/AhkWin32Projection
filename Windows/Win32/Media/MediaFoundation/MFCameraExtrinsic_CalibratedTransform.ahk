#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MF_QUATERNION.ahk" { MF_QUATERNION }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MF_FLOAT3.ahk" { MF_FLOAT3 }

/**
 * A transform describing the location of a camera relative to other cameras or an established external reference.
 * @remarks
 * The <b>Position</b> value should be expressed in real-world coordinates in units of meters. The coordinate system of both position and orientation should be right-handed Cartesian as shown in the following diagram. 
 * 
 * <img alt="Right-handed Cartesian coordinate system" src="images/MFCameraExtrinsic_Diagram.png"/>
 * <div class="alert"><b>Important</b>
 *   <p class="note">The <b>Position</b> and <b>Orientation</b> have different interpretations for stand-alone sensor groups, and for Windows Mixed Reality devices.
 * </div>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-mfcameraextrinsic_calibratedtransform
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFCameraExtrinsic_CalibratedTransform {
    #StructPack 4

    /**
     * A reference GUID identifying the calibration process for the data, allowing different consumers to identify calibration data from the same process.
     */
    CalibrationId : Guid

    /**
     * The transform position.
     */
    Position : MF_FLOAT3

    /**
     * The transform rotation.
     */
    Orientation : MF_QUATERNION

}
