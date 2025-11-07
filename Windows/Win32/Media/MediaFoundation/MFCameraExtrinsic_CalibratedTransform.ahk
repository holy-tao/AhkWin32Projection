#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MF_FLOAT3.ahk
#Include .\MF_QUATERNION.ahk

/**
 * A transform describing the location of a camera relative to other cameras or an established external reference.
 * @remarks
 * 
 * The <b>Position</b> value should be expressed in real-world coordinates in units of meters. The coordinate system of both position and orientation should be right-handed Cartesian as shown in the following diagram. 
 * 
 * <img alt="Right-handed Cartesian coordinate system" src="images/MFCameraExtrinsic_Diagram.png"/>
 * <div class="alert"><b>Important</b>
 *   <p class="note">The <b>Position</b> and <b>Orientation</b> have different interpretations for stand-alone sensor groups, and for Windows Mixed Reality devices.
 * </div>
 *   
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfapi/ns-mfapi-mfcameraextrinsic_calibratedtransform
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFCameraExtrinsic_CalibratedTransform extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A reference GUID identifying the calibration process for the data, allowing different consumers to identify calibration data from the same process.
     * @type {Pointer<Guid>}
     */
    CalibrationId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The transform position.
     * @type {MF_FLOAT3}
     */
    Position{
        get {
            if(!this.HasProp("__Position"))
                this.__Position := MF_FLOAT3(8, this)
            return this.__Position
        }
    }

    /**
     * The transform rotation.
     * @type {MF_QUATERNION}
     */
    Orientation{
        get {
            if(!this.HasProp("__Orientation"))
                this.__Orientation := MF_QUATERNION(24, this)
            return this.__Orientation
        }
    }
}
