#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHandPose.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the poses of the user's hand joints in relation to their surroundings.
 * @remarks
 * The coordinate system is right-handed, with +y up, +x to the right, and -z forward.
 * 
 * All joints except for tip joints are interior to the hand.  Finger joint poses represent the base of the named bone.  Joints are oriented with forward (-z) pointing towards the tip of each finger, up (+y) pointing out of the back of the hand or finger, and right (+x) pointing perpendicular to forward and up.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.people.handpose
 * @namespace Windows.Perception.People
 * @version WindowsRuntime 1.4
 */
class HandPose extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHandPose

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHandPose.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the pose of a hand joint, expressed in the specified coordinate system.
     * @remarks
     * The coordinate system is right-handed, with +y up, +x to the right, and -z forward.
     * 
     * All joints except for tip joints are interior to the hand.  Finger joint poses represent the base of the named bone.  Joints are oriented with forward (-z) pointing towards the tip of each finger, up (+y) pointing out of the back of the hand or finger, and right (+x) pointing perpendicular to forward and up.
     * 
     * This method will return false if the specified coordinate system cannot be located at the moment.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system in which to express the joint pose.
     * @param {Integer} joint The hand joint kind to locate.
     * @param {Pointer<JointPose>} jointPose_ The pose to fill for the specified joint.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.people.handpose.trygetjoint
     */
    TryGetJoint(coordinateSystem, joint, jointPose_) {
        if (!this.HasProp("__IHandPose")) {
            if ((queryResult := this.QueryInterface(IHandPose.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandPose := IHandPose(outPtr)
        }

        return this.__IHandPose.TryGetJoint(coordinateSystem, joint, jointPose_)
    }

    /**
     * Gets the pose of multiple hand joints, expressed in the specified coordinate system.
     * @remarks
     * The *jointPoses* array to be filled must match the length of the *joints* array.
     * 
     * The coordinate system is right-handed, with +y up, +x to the right, and -z forward.
     * 
     * All joints except for tip joints are interior to the hand.  Finger joint poses represent the base of the named bone.  Joints are oriented with forward (-z) pointing towards the tip of each finger, up (+y) pointing out of the back of the hand or finger, and right (+x) pointing perpendicular to forward and up.
     * 
     * This method will return false if the specified coordinate system cannot be located at the moment.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system in which to express the joint poses.
     * @param {Integer} joints_length 
     * @param {Pointer<Integer>} joints The array of hand joint kinds to locate.
     * @param {Pointer<Integer>} jointPoses_length 
     * @param {Pointer<Pointer<JointPose>>} jointPoses The array of poses to fill, one for each matching element in the joints array.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.people.handpose.trygetjoints
     */
    TryGetJoints(coordinateSystem, joints_length, joints, jointPoses_length, jointPoses) {
        if (!this.HasProp("__IHandPose")) {
            if ((queryResult := this.QueryInterface(IHandPose.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandPose := IHandPose(outPtr)
        }

        return this.__IHandPose.TryGetJoints(coordinateSystem, joints_length, joints, jointPoses_length, jointPoses)
    }

    /**
     * Gets the pose of a hand joint, expressed relative to a reference joint.
     * @remarks
     * The coordinate system is right-handed, with +y up, +x to the right, and -z forward.
     * 
     * All joints except for Tip joints are interior to the hand.  Finger joint poses represent the base of the named bone.  Joints are oriented with forward (-z) pointing towards the tip of each finger, up (+y) pointing out of the back of the hand or finger, and right (+x) pointing perpendicular to forward and up.
     * @param {Integer} joint The hand joint kind to locate.
     * @param {Integer} referenceJoint The reference hand joint kind, relative to which the joint will be located.
     * @returns {JointPose} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.people.handpose.getrelativejoint
     */
    GetRelativeJoint(joint, referenceJoint) {
        if (!this.HasProp("__IHandPose")) {
            if ((queryResult := this.QueryInterface(IHandPose.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandPose := IHandPose(outPtr)
        }

        return this.__IHandPose.GetRelativeJoint(joint, referenceJoint)
    }

    /**
     * Gets the pose of multiple hand joints, each expressed relative to its matching reference joint.
     * @remarks
     * The coordinate system is right-handed, with +y up, +x to the right, and -z forward.
     * 
     * All joints except for tip joints are interior to the hand.  Finger joint poses represent the base of the named bone.  Joints are oriented with forward (-z) pointing towards the tip of each finger, up (+y) pointing out of the back of the hand or finger, and right (+x) pointing perpendicular to forward and up.
     * @param {Integer} joints_length 
     * @param {Pointer<Integer>} joints The array of hand joint kinds to locate.
     * @param {Integer} referenceJoints_length 
     * @param {Pointer<Integer>} referenceJoints The array of reference hand joint kinds, relative to which each matching joint in the *joints* array will be located.
     * @param {Pointer<Integer>} jointPoses_length 
     * @param {Pointer<Pointer<JointPose>>} jointPoses The array of relative poses to fill, one for each matching element in the *joints* and *referenceJoints* arrays.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.people.handpose.getrelativejoints
     */
    GetRelativeJoints(joints_length, joints, referenceJoints_length, referenceJoints, jointPoses_length, jointPoses) {
        if (!this.HasProp("__IHandPose")) {
            if ((queryResult := this.QueryInterface(IHandPose.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandPose := IHandPose(outPtr)
        }

        return this.__IHandPose.GetRelativeJoints(joints_length, joints, referenceJoints_length, referenceJoints, jointPoses_length, jointPoses)
    }

;@endregion Instance Methods
}
