#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MF_FLOAT3.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MF_QUATERNION.ahk

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
class MFCameraExtrinsic_CalibratedTransform extends Win32Struct {
    static sizeof => 44

    static packingSize => 4

    /**
     * A reference GUID identifying the calibration process for the data, allowing different consumers to identify calibration data from the same process.
     * @type {Guid}
     */
    CalibrationId {
        get {
            if(!this.HasProp("__CalibrationId"))
                this.__CalibrationId := Guid(0, this)
            return this.__CalibrationId
        }
    }

    /**
     * The transform position.
     * @type {MF_FLOAT3}
     */
    Position {
        get {
            if(!this.HasProp("__Position"))
                this.__Position := MF_FLOAT3(16, this)
            return this.__Position
        }
    }

    /**
     * The transform rotation.
     * @type {MF_QUATERNION}
     */
    Orientation {
        get {
            if(!this.HasProp("__Orientation"))
                this.__Orientation := MF_QUATERNION(28, this)
            return this.__Orientation
        }
    }
}
