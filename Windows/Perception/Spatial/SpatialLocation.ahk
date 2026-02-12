#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialLocation.ahk
#Include .\ISpatialLocation2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the location of the device in the user's surroundings at a point in time.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocation
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialLocation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialLocation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialLocation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the position of the device within the supplied coordinate system.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocation.position
     * @type {Vector3} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets the orientation of the device within the supplied coordinate system.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocation.orientation
     * @type {Quaternion} 
     */
    Orientation {
        get => this.get_Orientation()
    }

    /**
     * Gets the absolute velocity vector of the device in units of meters per second. This velocity is expressed in the supplied coordinate system, although the motion is measured relative to the user's surroundings.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocation.absolutelinearvelocity
     * @type {Vector3} 
     */
    AbsoluteLinearVelocity {
        get => this.get_AbsoluteLinearVelocity()
    }

    /**
     * Gets the absolute acceleration vector of the device in units of meters per second squared. This acceleration is expressed in the supplied coordinate system, although the motion is measured relative to the user's surroundings.
     * @remarks
     * <div class="alert"><b>Important</b>
     *   <p class="note">The acceleration values reported by this API are inverted; to get the actual acceleration, negate all three components. Velocity values are reported correctly and do not need to be negated.
     * </div>
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocation.absolutelinearacceleration
     * @type {Vector3} 
     */
    AbsoluteLinearAcceleration {
        get => this.get_AbsoluteLinearAcceleration()
    }

    /**
     * Gets the absolute angular velocity of the device in a clamped quaternion representation of the rotation per second. This velocity is expressed in the supplied coordinate system, although the motion is measured relative to the user's surroundings.
     * @remarks
     * > [!IMPORTANT]
     * > The velocity is clamped to be less than 180 degrees per second in any direction.  You should generally use [AbsoluteAngularVelocityAxisAngle](spatiallocation_absoluteangularvelocityaxisangle.md) instead.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocation.absoluteangularvelocity
     * @type {Quaternion} 
     */
    AbsoluteAngularVelocity {
        get => this.get_AbsoluteAngularVelocity()
    }

    /**
     * Gets the absolute angular acceleration of the device in a clamped quaternion representation of the rotation per second squared. This acceleration is expressed in the supplied coordinate system, although the motion is measured relative to the user's surroundings.
     * @remarks
     * > [!IMPORTANT]
     * > The acceleration is clamped to be less than 180 degrees per second squared in any direction.  You should generally use [AbsoluteAngularAccelerationAxisAngle](spatiallocation_absoluteangularaccelerationaxisangle.md) instead.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocation.absoluteangularacceleration
     * @type {Quaternion} 
     */
    AbsoluteAngularAcceleration {
        get => this.get_AbsoluteAngularAcceleration()
    }

    /**
     * Gets the absolute angular velocity of the device in an axis-angle representation in units of radians per second. This velocity is expressed in the supplied coordinate system, although the motion is measured relative to the user's surroundings.
     * @remarks
     * The value of the property is a vector which indicates the axis of rotation. The magnitude of the vector indicates the rate of rotation clockwise about the axis, looking back along the vector towards the origin - that is, according to the left-hand rule. For example, in a coordinate system where +Y points upward, turning to the right will produce an axis-angle with a direction close to (0, 1, 0) and a magnitude proportional to the rate of rotation. Note that this is the opposite convention from the angular acceleration axis angle, which uses the right-hand rule. You can change the convention of either vector to make the values consistent by negating all three components.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocation.absoluteangularvelocityaxisangle
     * @type {Vector3} 
     */
    AbsoluteAngularVelocityAxisAngle {
        get => this.get_AbsoluteAngularVelocityAxisAngle()
    }

    /**
     * Gets the absolute angular acceleration of the device in an axis-angle representation in units of radians per second squared. This acceleration is expressed in the supplied coordinate system, although the motion is measured relative to the user's surroundings.
     * @remarks
     * The value of the property is a vector which indicates the axis of rotation. The magnitude of the vector indicates the rate of rotation counter-clockwise about the axis, looking back along the vector towards the origin - that is, according to the right-hand rule. For example, in a coordinate system where +Y points upward, turning to the right will produce an axis-angle with a direction close to (0, -1, 0) and a magnitude proportional to the rate of rotation. Note that this is the opposite convention from the angular velocity axis angle, which uses the left-hand rule. You can change the convention of either vector to make the values consistent by negating all three components.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocation.absoluteangularaccelerationaxisangle
     * @type {Vector3} 
     */
    AbsoluteAngularAccelerationAxisAngle {
        get => this.get_AbsoluteAngularAccelerationAxisAngle()
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
    get_Position() {
        if (!this.HasProp("__ISpatialLocation")) {
            if ((queryResult := this.QueryInterface(ISpatialLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocation := ISpatialLocation(outPtr)
        }

        return this.__ISpatialLocation.get_Position()
    }

    /**
     * 
     * @returns {Quaternion} 
     */
    get_Orientation() {
        if (!this.HasProp("__ISpatialLocation")) {
            if ((queryResult := this.QueryInterface(ISpatialLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocation := ISpatialLocation(outPtr)
        }

        return this.__ISpatialLocation.get_Orientation()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_AbsoluteLinearVelocity() {
        if (!this.HasProp("__ISpatialLocation")) {
            if ((queryResult := this.QueryInterface(ISpatialLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocation := ISpatialLocation(outPtr)
        }

        return this.__ISpatialLocation.get_AbsoluteLinearVelocity()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_AbsoluteLinearAcceleration() {
        if (!this.HasProp("__ISpatialLocation")) {
            if ((queryResult := this.QueryInterface(ISpatialLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocation := ISpatialLocation(outPtr)
        }

        return this.__ISpatialLocation.get_AbsoluteLinearAcceleration()
    }

    /**
     * 
     * @returns {Quaternion} 
     */
    get_AbsoluteAngularVelocity() {
        if (!this.HasProp("__ISpatialLocation")) {
            if ((queryResult := this.QueryInterface(ISpatialLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocation := ISpatialLocation(outPtr)
        }

        return this.__ISpatialLocation.get_AbsoluteAngularVelocity()
    }

    /**
     * 
     * @returns {Quaternion} 
     */
    get_AbsoluteAngularAcceleration() {
        if (!this.HasProp("__ISpatialLocation")) {
            if ((queryResult := this.QueryInterface(ISpatialLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocation := ISpatialLocation(outPtr)
        }

        return this.__ISpatialLocation.get_AbsoluteAngularAcceleration()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_AbsoluteAngularVelocityAxisAngle() {
        if (!this.HasProp("__ISpatialLocation2")) {
            if ((queryResult := this.QueryInterface(ISpatialLocation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocation2 := ISpatialLocation2(outPtr)
        }

        return this.__ISpatialLocation2.get_AbsoluteAngularVelocityAxisAngle()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_AbsoluteAngularAccelerationAxisAngle() {
        if (!this.HasProp("__ISpatialLocation2")) {
            if ((queryResult := this.QueryInterface(ISpatialLocation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialLocation2 := ISpatialLocation2(outPtr)
        }

        return this.__ISpatialLocation2.get_AbsoluteAngularAccelerationAxisAngle()
    }

;@endregion Instance Methods
}
