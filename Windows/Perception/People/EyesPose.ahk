#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEyesPose.ahk
#Include .\IEyesPoseStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the user's eye gaze in relation to their surroundings.
 * @remarks
 * This type is for reasoning about spatial eye gaze in a headset.  For screen-space eye gaze relative to a monitor, see [GazeDevicePreview](../windows.devices.input.preview/gazedevicepreview.md) instead.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.people.eyespose
 * @namespace Windows.Perception.People
 * @version WindowsRuntime 1.4
 */
class EyesPose extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEyesPose

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEyesPose.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets whether eye gaze is supported by the current headset.
     * @remarks
     * If eye gaze is not supported, the [SpatialPointerPose.Eyes](../windows.ui.input.spatial/spatialpointerpose_eyes.md) property will return null.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.people.eyespose.issupported
     */
    static IsSupported() {
        if (!EyesPose.HasProp("__IEyesPoseStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.People.EyesPose")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEyesPoseStatics.IID)
            EyesPose.__IEyesPoseStatics := IEyesPoseStatics(factoryPtr)
        }

        return EyesPose.__IEyesPoseStatics.IsSupported()
    }

    /**
     * Requests access for an app to use spatial eye gaze. This requires the **gazeInput** capability.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.people.eyespose.requestaccessasync
     */
    static RequestAccessAsync() {
        if (!EyesPose.HasProp("__IEyesPoseStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.People.EyesPose")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEyesPoseStatics.IID)
            EyesPose.__IEyesPoseStatics := IEyesPoseStatics(factoryPtr)
        }

        return EyesPose.__IEyesPoseStatics.RequestAccessAsync()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets whether eye gaze has been calibrated for the current user in the headset.
     * @remarks
     * If eye gaze is supported but has not been calibrated for the current user, the [Gaze](eyespose_gaze.md) property will return null.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.people.eyespose.iscalibrationvalid
     * @type {Boolean} 
     */
    IsCalibrationValid {
        get => this.get_IsCalibrationValid()
    }

    /**
     * Gets the user's eye gaze in the specified coordinate system.
     * @remarks
     * You should check [IsCalibrationValid](eyespose_iscalibrationvalid.md) first to determine if eye gaze calibration is valid for the current user in the headset.  If not, this property will always return null.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.people.eyespose.gaze
     * @type {IReference<SpatialRay>} 
     */
    Gaze {
        get => this.get_Gaze()
    }

    /**
     * Gets the timestamp at which this eye gaze snapshot was taken.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.people.eyespose.updatetimestamp
     * @type {PerceptionTimestamp} 
     */
    UpdateTimestamp {
        get => this.get_UpdateTimestamp()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCalibrationValid() {
        if (!this.HasProp("__IEyesPose")) {
            if ((queryResult := this.QueryInterface(IEyesPose.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEyesPose := IEyesPose(outPtr)
        }

        return this.__IEyesPose.get_IsCalibrationValid()
    }

    /**
     * 
     * @returns {IReference<SpatialRay>} 
     */
    get_Gaze() {
        if (!this.HasProp("__IEyesPose")) {
            if ((queryResult := this.QueryInterface(IEyesPose.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEyesPose := IEyesPose(outPtr)
        }

        return this.__IEyesPose.get_Gaze()
    }

    /**
     * 
     * @returns {PerceptionTimestamp} 
     */
    get_UpdateTimestamp() {
        if (!this.HasProp("__IEyesPose")) {
            if ((queryResult := this.QueryInterface(IEyesPose.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEyesPose := IEyesPose(outPtr)
        }

        return this.__IEyesPose.get_UpdateTimestamp()
    }

;@endregion Instance Methods
}
