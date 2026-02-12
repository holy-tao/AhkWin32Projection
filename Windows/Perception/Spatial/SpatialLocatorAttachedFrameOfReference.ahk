#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialLocatorAttachedFrameOfReference.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a frame of reference that is positionally attached to the device.
 * @remarks
 * The SpatialLocatorAttachedFrameOfReference class represents a device-relative frame of reference that tracks changes in the position reported by the device's [SpatialLocator](spatiallocator.md). This frame has a fixed heading relative to the user's surroundings that points in the direction the user was facing when the frame was created. From then on, all orientations in this frame of reference are relative to that fixed heading, even as the user rotates the device.
 * 
 * For a headset such as HoloLens, the origin of this frame's coordinate system is located at the center of rotation of the user's head, so that its position is not affected by head rotation.
 * 
 * To get a SpatialLocatorAttachedFrameOfReference, use the [SpatialLocator](spatiallocator.md) class and call [CreateAttachedFrameOfReferenceAtCurrentHeading](spatiallocator_createattachedframeofreferenceatcurrentheading_609311736.md).
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocatorattachedframeofreference
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialLocatorAttachedFrameOfReference extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialLocatorAttachedFrameOfReference

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialLocatorAttachedFrameOfReference.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the position of this frame of reference's origin relative to the SpatialLocator that it is tracking.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocatorattachedframeofreference.relativeposition
     * @type {Vector3} 
     */
    RelativePosition {
        get => this.get_RelativePosition()
        set => this.put_RelativePosition(value)
    }

    /**
     * Gets or sets the orientation of this frame of reference's origin relative to the direction of the heading.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocatorattachedframeofreference.relativeorientation
     * @type {Quaternion} 
     */
    RelativeOrientation {
        get => this.get_RelativeOrientation()
        set => this.put_RelativeOrientation(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_RelativePosition() {
        if (!this.HasProp("__ISpatialLocatorAttachedFrameOfReference")) {
            if ((queryResult := this.QueryInterface(ISpatialLocatorAttachedFrameOfReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocatorAttachedFrameOfReference := ISpatialLocatorAttachedFrameOfReference(outPtr)
        }

        return this.__ISpatialLocatorAttachedFrameOfReference.get_RelativePosition()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_RelativePosition(value) {
        if (!this.HasProp("__ISpatialLocatorAttachedFrameOfReference")) {
            if ((queryResult := this.QueryInterface(ISpatialLocatorAttachedFrameOfReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocatorAttachedFrameOfReference := ISpatialLocatorAttachedFrameOfReference(outPtr)
        }

        return this.__ISpatialLocatorAttachedFrameOfReference.put_RelativePosition(value)
    }

    /**
     * 
     * @returns {Quaternion} 
     */
    get_RelativeOrientation() {
        if (!this.HasProp("__ISpatialLocatorAttachedFrameOfReference")) {
            if ((queryResult := this.QueryInterface(ISpatialLocatorAttachedFrameOfReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocatorAttachedFrameOfReference := ISpatialLocatorAttachedFrameOfReference(outPtr)
        }

        return this.__ISpatialLocatorAttachedFrameOfReference.get_RelativeOrientation()
    }

    /**
     * 
     * @param {Quaternion} value 
     * @returns {HRESULT} 
     */
    put_RelativeOrientation(value) {
        if (!this.HasProp("__ISpatialLocatorAttachedFrameOfReference")) {
            if ((queryResult := this.QueryInterface(ISpatialLocatorAttachedFrameOfReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocatorAttachedFrameOfReference := ISpatialLocatorAttachedFrameOfReference(outPtr)
        }

        return this.__ISpatialLocatorAttachedFrameOfReference.put_RelativeOrientation(value)
    }

    /**
     * Adjusts the fixed heading of this frame of reference relative to its current heading.
     * @param {Float} headingOffsetInRadians The amount to change the heading, in radians.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocatorattachedframeofreference.adjustheading
     */
    AdjustHeading(headingOffsetInRadians) {
        if (!this.HasProp("__ISpatialLocatorAttachedFrameOfReference")) {
            if ((queryResult := this.QueryInterface(ISpatialLocatorAttachedFrameOfReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocatorAttachedFrameOfReference := ISpatialLocatorAttachedFrameOfReference(outPtr)
        }

        return this.__ISpatialLocatorAttachedFrameOfReference.AdjustHeading(headingOffsetInRadians)
    }

    /**
     * Gets a coordinate system whose origin is the position of the device at the specified timestamp, oriented at this frame of reference's fixed heading. This coordinate system stays stationary and does not track any further movement of the device.
     * @remarks
     * The coordinate system is right-handed, with +y up, +x to the right, and -z forward.
     * @param {PerceptionTimestamp} timestamp_ The timestamp to compute the coordinate system for.
     * @returns {SpatialCoordinateSystem} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocatorattachedframeofreference.getstationarycoordinatesystemattimestamp
     */
    GetStationaryCoordinateSystemAtTimestamp(timestamp_) {
        if (!this.HasProp("__ISpatialLocatorAttachedFrameOfReference")) {
            if ((queryResult := this.QueryInterface(ISpatialLocatorAttachedFrameOfReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocatorAttachedFrameOfReference := ISpatialLocatorAttachedFrameOfReference(outPtr)
        }

        return this.__ISpatialLocatorAttachedFrameOfReference.GetStationaryCoordinateSystemAtTimestamp(timestamp_)
    }

    /**
     * Computes the device's heading in radians for the specified timestamp, relative to this frame's fixed heading.
     * @remarks
     * This method will return null if the timestamp is too far in the past or future.
     * @param {PerceptionTimestamp} timestamp_ The timestamp to compute the relative heading for.
     * @returns {IReference<Float>} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocatorattachedframeofreference.trygetrelativeheadingattimestamp
     */
    TryGetRelativeHeadingAtTimestamp(timestamp_) {
        if (!this.HasProp("__ISpatialLocatorAttachedFrameOfReference")) {
            if ((queryResult := this.QueryInterface(ISpatialLocatorAttachedFrameOfReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocatorAttachedFrameOfReference := ISpatialLocatorAttachedFrameOfReference(outPtr)
        }

        return this.__ISpatialLocatorAttachedFrameOfReference.TryGetRelativeHeadingAtTimestamp(timestamp_)
    }

;@endregion Instance Methods
}
