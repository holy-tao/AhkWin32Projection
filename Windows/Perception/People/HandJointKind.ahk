#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies a joint within the user's hand.
 * @remarks
 * All joints except for tip joints are interior to the hand.  Finger joint poses represent the base of the named bone.  Joints are oriented with forward (-z) pointing towards the tip of each finger, up (+y) pointing out of the back of the hand or finger, and right (+x) pointing perpendicular to forward and up.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.people.handjointkind
 * @namespace Windows.Perception.People
 * @version WindowsRuntime 1.4
 */
class HandJointKind extends Win32Enum{

    /**
     * The center of the palm.
     * 
     * Coincides with the grip position represented by this hand's [SpatialInteractionSourceLocation](../windows.ui.input.spatial/spatialinteractionsourcelocation.md), reoriented to align with the forward direction of the other joints.
     * @type {Integer (Int32)}
     */
    static Palm => 0

    /**
     * The center of the wrist.
     * @type {Integer (Int32)}
     */
    static Wrist => 1

    /**
     * The joint in the base of the hand that poses the thumb's metacarpal bone.
     * @type {Integer (Int32)}
     */
    static ThumbMetacarpal => 2

    /**
     * The first knuckle that poses the thumb's proximal phalanx.
     * @type {Integer (Int32)}
     */
    static ThumbProximal => 3

    /**
     * The second knuckle that poses the thumb's distal phalanx.
     * @type {Integer (Int32)}
     */
    static ThumbDistal => 4

    /**
     * The point on the surface of the thumb at the tip.
     * @type {Integer (Int32)}
     */
    static ThumbTip => 5

    /**
     * The joint in the base of the hand that poses the index finger's metacarpal bone.
     * @type {Integer (Int32)}
     */
    static IndexMetacarpal => 6

    /**
     * The first knuckle that poses the index finger's proximal phalanx.
     * @type {Integer (Int32)}
     */
    static IndexProximal => 7

    /**
     * The second knuckle that poses the index finger's intermediate phalanx.
     * @type {Integer (Int32)}
     */
    static IndexIntermediate => 8

    /**
     * The third knuckle that poses the index finger's distal phalanx.
     * @type {Integer (Int32)}
     */
    static IndexDistal => 9

    /**
     * The point on the surface of the index finger at the tip.
     * @type {Integer (Int32)}
     */
    static IndexTip => 10

    /**
     * The joint in the base of the hand that poses the middle finger's metacarpal bone.
     * @type {Integer (Int32)}
     */
    static MiddleMetacarpal => 11

    /**
     * The first knuckle that poses the middle finger's proximal phalanx.
     * @type {Integer (Int32)}
     */
    static MiddleProximal => 12

    /**
     * The second knuckle that poses the middle finger's intermediate phalanx.
     * @type {Integer (Int32)}
     */
    static MiddleIntermediate => 13

    /**
     * The third knuckle that poses the middle finger's distal phalanx.
     * @type {Integer (Int32)}
     */
    static MiddleDistal => 14

    /**
     * The point on the surface of the middle finger at the tip.
     * @type {Integer (Int32)}
     */
    static MiddleTip => 15

    /**
     * The joint in the base of hand that poses the ring finger's metacarpal bone.
     * @type {Integer (Int32)}
     */
    static RingMetacarpal => 16

    /**
     * The first knuckle that poses the ring finger's proximal phalanx.
     * @type {Integer (Int32)}
     */
    static RingProximal => 17

    /**
     * The second knuckle that poses the ring finger's intermediate phalanx.
     * @type {Integer (Int32)}
     */
    static RingIntermediate => 18

    /**
     * The third knuckle that poses the ring finger's distal phalanx.
     * @type {Integer (Int32)}
     */
    static RingDistal => 19

    /**
     * The point on the surface of the ring finger at the tip.
     * @type {Integer (Int32)}
     */
    static RingTip => 20

    /**
     * The joint in the base of hand that poses the little finger's (pinky's) metacarpal bone.
     * @type {Integer (Int32)}
     */
    static LittleMetacarpal => 21

    /**
     * The first knuckle that poses the little finger's (pinky's) proximal phalanx.
     * @type {Integer (Int32)}
     */
    static LittleProximal => 22

    /**
     * The second knuckle that poses the little finger's (pinky's) intermediate phalanx.
     * @type {Integer (Int32)}
     */
    static LittleIntermediate => 23

    /**
     * The third knuckle that poses the little finger's (pinky's) distal phalanx.
     * @type {Integer (Int32)}
     */
    static LittleDistal => 24

    /**
     * The point on the surface of the little finger's (pinky's) at the tip.
     * @type {Integer (Int32)}
     */
    static LittleTip => 25
}
