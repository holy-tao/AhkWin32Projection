#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * The pose of a hand joint.
 * @remarks
 * The coordinate system is right-handed, with +y up, +x to the right, and -z forward.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.people.jointpose
 * @namespace Windows.Perception.People
 * @version WindowsRuntime 1.4
 */
class JointPose extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The joint's orientation, with forward (-z) pointing towards the tip of each finger, up (+y) pointing out of the back of the hand or finger, and right (+x) pointing perpendicular to forward and up.
     * @type {Pointer<Quaternion>}
     */
    Orientation {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The joint's position.  All joints except for tip joints are interior to the hand.  Finger joint poses represent the base of the named bone.
     * @type {Pointer<Vector3>}
     */
    Position {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The distance from the joint position to the surface of the hand.
     * @type {Float}
     */
    Radius {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * The accuracy of this joint pose.
     * @type {Integer}
     */
    Accuracy {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
