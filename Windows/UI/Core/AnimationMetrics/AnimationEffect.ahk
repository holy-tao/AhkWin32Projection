#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies an animation.
 * @remarks
 * The [AnimationDescription](animationdescription.md) constructor uses the values of this enumeration to specify the animation.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.animationmetrics.animationeffect
 * @namespace Windows.UI.Core.AnimationMetrics
 * @version WindowsRuntime 1.4
 */
class AnimationEffect extends Win32Enum{

    /**
     * <!--Wherever possible, change passive voice to active in the descriptions below.-->
     * An object increases in size to reveal additional content.
     * @type {Integer (Int32)}
     */
    static Expand => 0

    /**
     * An object decreases in size to hide content.
     * @type {Integer (Int32)}
     */
    static Collapse => 1

    /**
     * An object changes position. No more specific animation applies.
     * @type {Integer (Int32)}
     */
    static Reposition => 2

    /**
     * A contextual control fades in.
     * @type {Integer (Int32)}
     */
    static FadeIn => 3

    /**
     * A contextual control fades out.
     * @type {Integer (Int32)}
     */
    static FadeOut => 4

    /**
     * An object is added to a list.
     * @type {Integer (Int32)}
     */
    static AddToList => 5

    /**
     * An object is removed from a list.
     * @type {Integer (Int32)}
     */
    static DeleteFromList => 6

    /**
     * An object is added to a collection that is arranged in a grid.
     * @type {Integer (Int32)}
     */
    static AddToGrid => 7

    /**
     * An object is removed from a collection that is arranged in a grid.
     * @type {Integer (Int32)}
     */
    static DeleteFromGrid => 8

    /**
     * An object is added to search results that are arranged in a grid.
     * @type {Integer (Int32)}
     */
    static AddToSearchGrid => 9

    /**
     * An object is removed from search results that are arranged in a grid.
     * @type {Integer (Int32)}
     */
    static DeleteFromSearchGrid => 10

    /**
     * An object is added to a vertically arranged list of search results.
     * @type {Integer (Int32)}
     */
    static AddToSearchList => 11

    /**
     * An object is removed from a vertically arranged list of search results.
     * @type {Integer (Int32)}
     */
    static DeleteFromSearchList => 12

    /**
     * UI is brought in from the edge of the screen.
     * @type {Integer (Int32)}
     */
    static ShowEdgeUI => 13

    /**
     * A section of content appears on the screen.
     * @type {Integer (Int32)}
     */
    static ShowPanel => 14

    /**
     * UI displayed at the edge of the screen is removed.
     * @type {Integer (Int32)}
     */
    static HideEdgeUI => 15

    /**
     * A section of content is removed from the screen.
     * @type {Integer (Int32)}
     */
    static HidePanel => 16

    /**
     * A pop-up control appears on the screen.
     * @type {Integer (Int32)}
     */
    static ShowPopup => 17

    /**
     * A pop-up control is removed from the screen.
     * @type {Integer (Int32)}
     */
    static HidePopup => 18

    /**
     * The pointing device (such as a mouse or touch) has engaged on an item.
     * @type {Integer (Int32)}
     */
    static PointerDown => 19

    /**
     * The pointing device (such as a mouse or touch) has disengaged from an item.
     * @type {Integer (Int32)}
     */
    static PointerUp => 20

    /**
     * The user has begun dragging an item.
     * @type {Integer (Int32)}
     */
    static DragSourceStart => 21

    /**
     * The user has stopped dragging an item.
     * @type {Integer (Int32)}
     */
    static DragSourceEnd => 22

    /**
     * Large-scale content replacement is occurring.
     * @type {Integer (Int32)}
     */
    static TransitionContent => 23

    /**
     * UI expands around a tapped or clicked target.
     * @type {Integer (Int32)}
     */
    static Reveal => 24

    /**
     * UI collapses around a tapped or clicked target.
     * @type {Integer (Int32)}
     */
    static Hide => 25

    /**
     * A drag source has moved between two items.
     * @type {Integer (Int32)}
     */
    static DragBetweenEnter => 26

    /**
     * A drag source is no longer between two items.
     * @type {Integer (Int32)}
     */
    static DragBetweenLeave => 27

    /**
     * An object has been selected through the swipe interaction.
     * @type {Integer (Int32)}
     */
    static SwipeSelect => 28

    /**
     * An object has been deselected through the swipe interaction.
     * @type {Integer (Int32)}
     */
    static SwipeDeselect => 29

    /**
     * Triggered by a press and hold on an item that can be cross-slide selected.
     * @type {Integer (Int32)}
     */
    static SwipeReveal => 30

    /**
     * A page of content is brought in to the display.
     * @type {Integer (Int32)}
     */
    static EnterPage => 31

    /**
     * One page is replaced by another page.
     * @type {Integer (Int32)}
     */
    static TransitionPage => 32

    /**
     * One item is faded out as another fades in its place.
     * @type {Integer (Int32)}
     */
    static CrossFade => 33

    /**
     * Contents of a tile move up or down to show a part of the tile that is normally hidden.
     * @type {Integer (Int32)}
     */
    static Peek => 34

    /**
     * Update a tile's badge overlay.
     * @type {Integer (Int32)}
     */
    static UpdateBadge => 35
}
