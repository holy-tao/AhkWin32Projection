#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a participant in an animation.
 * @remarks
 * The [AnimationDescription](animationdescription.md) constructor uses the values of this enumeration to specify the animation target. The definition of each value can sometimes depend on 
 * which [animation effect](animationeffect.md)is being performed.
 * 
 * Not all animations can be applied to all targets. See the specific documentation and guidance for an animation to determine which targets are supported.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.animationeffecttarget
 * @namespace Windows.UI.Core.AnimationMetrics
 * @version WindowsRuntime 1.4
 */
class AnimationEffectTarget extends Win32Enum{

    /**
     * The only participant in an single-target animation.
     * @type {Integer (Int32)}
     */
    static Primary => 0

    /**
     * Objects that are being added.
     * @type {Integer (Int32)}
     */
    static Added => 1

    /**
     * Objects affected by the animation, such as objects that move out of the way when another object is dropped between them.
     * @type {Integer (Int32)}
     */
    static Affected => 2

    /**
     * The background object of the item.
     * @type {Integer (Int32)}
     */
    static Background => 3

    /**
     * The content of the item.
     * @type {Integer (Int32)}
     */
    static Content => 4

    /**
     * Objects that are being deleted.
     * @type {Integer (Int32)}
     */
    static Deleted => 5

    /**
     * Objects that have been deselected through a cross-slide deselect interaction.
     * @type {Integer (Int32)}
     */
    static Deselected => 6

    /**
     * Objects that are being dragged.
     * @type {Integer (Int32)}
     */
    static DragSource => 7

    /**
     * Objects that are currently hidden.
     * @type {Integer (Int32)}
     */
    static Hidden => 8

    /**
     * New content to replace old content.
     * @type {Integer (Int32)}
     */
    static Incoming => 9

    /**
     * Old content that is being replaced by new content.
     * @type {Integer (Int32)}
     */
    static Outgoing => 10

    /**
     * An outline border around an area.
     * @type {Integer (Int32)}
     */
    static Outline => 11

    /**
     * Objects that are left behind after other items have been removed.
     * @type {Integer (Int32)}
     */
    static Remaining => 12

    /**
     * Objects that become visible in an expansion.
     * @type {Integer (Int32)}
     */
    static Revealed => 13

    /**
     * A row that is being added to a grid.
     * @type {Integer (Int32)}
     */
    static RowIn => 14

    /**
     * A row that is about to be removed from a grid.
     * @type {Integer (Int32)}
     */
    static RowOut => 15

    /**
     * Objects that are selected through a cross-slide select interaction.
     * @type {Integer (Int32)}
     */
    static Selected => 16

    /**
     * Objects, such as checkmarks, that indicate that an item is selected.
     * @type {Integer (Int32)}
     */
    static Selection => 17

    /**
     * Objects previously invisible that are becoming visible.
     * @type {Integer (Int32)}
     */
    static Shown => 18

    /**
     * Objects that have been tapped or clicked on.
     * @type {Integer (Int32)}
     */
    static Tapped => 19
}
