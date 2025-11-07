#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the interactions to enable when configuring an Interaction Context object.
 * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/ne-interactioncontext-interaction_configuration_flags
 * @namespace Windows.Win32.UI.InteractionContext
 * @version v4.0.30319
 */
class INTERACTION_CONFIGURATION_FLAGS{

    /**
     * No interactions enabled.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_NONE => 0

    /**
     * All manipulations enabled (move, rotate, and scale).
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_MANIPULATION => 1

    /**
     * Translate (move) along the x-axis.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_MANIPULATION_TRANSLATION_X => 2

    /**
     * Translate (move) along the y-axis.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_MANIPULATION_TRANSLATION_Y => 4

    /**
     * Rotation.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_MANIPULATION_ROTATION => 8

    /**
     * Scaling.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_MANIPULATION_SCALING => 16

    /**
     * Translation inertia (in direction of move) after contact lifted.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_MANIPULATION_TRANSLATION_INERTIA => 32

    /**
     * Rotation inertia after contact lifted.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_MANIPULATION_ROTATION_INERTIA => 64

    /**
     * Scaling inertia after contact lifted.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_MANIPULATION_SCALING_INERTIA => 128

    /**
     * Interactions are constrained along the x-axis.
     * 
     * Rails indicate that slight motions off the primary axis of motion are ignored. This makes for a tighter experience for users; when they attempt to pan along a single axis, they are constrained  to the axis.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_MANIPULATION_RAILS_X => 256

    /**
     * Interactions are constrained along the y-axis.
     * 
     * Rails indicate that slight motions off the primary axis of motion are ignored. This makes for a tighter experience for users; when they attempt to pan along a single axis, they are constrained  to the axis.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_MANIPULATION_RAILS_Y => 512

    /**
     * Report exact distance from initial contact to end of the interaction.
     * 
     * By default, a small distance threshold is subtracted from the first manipulation delta reported by the system. This distance threshold is  intended to account for slight movements of the contact when processing a tap gesture. If this flag is set, the distance threshold is not subtracted from the first delta.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_MANIPULATION_EXACT => 1024

    /**
     * 
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_MANIPULATION_MULTIPLE_FINGER_PANNING => 2048

    /**
     * All cross-slide interactions enabled.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE => 1

    /**
     * Cross-slide along the x-axis.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_HORIZONTAL => 2

    /**
     * Selection using cross-slide.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_SELECT => 4

    /**
     * Speed bump effect.
     * 
     * A speed bump is a region in which the user experiences a slight drag (or friction) during the swipe or slide gesture.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_SPEED_BUMP => 8

    /**
     * Rearrange using cross-slide.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_REARRANGE => 16

    /**
     * Report exact distance from initial contact to end of the interaction.
     * 
     * By default, a small distance threshold is subtracted from the first cross-slide delta reported by the system. This distance threshold is  intended to account for slight movements of the contact when processing a tap gesture. If this flag is set, the distance threshold is not subtracted from the first delta.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_EXACT => 32

    /**
     * Tap.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_TAP => 1

    /**
     * Double tap.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_TAP_DOUBLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_TAP_MULTIPLE_FINGER => 4

    /**
     * Secondary tap.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_SECONDARY_TAP => 1

    /**
     * Hold.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_HOLD => 1

    /**
     * Hold with mouse.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_HOLD_MOUSE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_HOLD_MULTIPLE_FINGER => 4

    /**
     * Drag with mouse.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_DRAG => 1

    /**
     * Maximum number of interactions exceeded.
     * @type {Integer (UInt32)}
     */
    static INTERACTION_CONFIGURATION_FLAG_MAX => 4294967295
}
