#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values that set the interest in a set of application-specific gesture.Application gestures are gestures that you can choose to have your application support.
 * @remarks
 * 
 * The default value is <b>NoGesture</b>, which is actually a cutoff line that represents the Microsoft gesture recognizer minimum suggested confidence. It does not actually represent a gesture or lack of gesture, just the point at which the gesture recognizer lacks enough confidence in the result accuracy to recommend anything following that point.
 * 
 * For example, assume that a gesture array consists of the following values: <b>Circle</b>, <b>LeftRight</b>, <b>NoGesture</b>, <b>RightLeft</b>, and <b>Triangle</b>. In this case, the gesture recognizer has a great degree of confidence in <b>Circle</b> and less confidence in <b>LeftRight</b>. The recognizer has very low confidence in <b>RightLeft</b> and <b>Triangle</b> because they come after <b>NoGesture</b> in the array order.
 * 
 * The confidence level at which the gesture recognizer returns <b>NoGesture</b> cannot be changed.
 * 
 * If <b>NoGesture</b> is the first element in the array (which means that every recognized gesture is below the suggested confidence threshold), then the platform alters the default value of the <i>Cancel</i> parameter in the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-gesture">Gesture</a> event handler from <b>FALSE</b> to <b>TRUE</b>. This causes the ink to be considered a stroke and not be deleted from the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object by default.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/ne-msinkaut-inkapplicationgesture
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkApplicationGesture{

    /**
     * All application-specific gestures.
     * @type {Integer (Int32)}
     */
    static IAG_AllGestures => 0

    /**
     * No application-specific gestures. See the following "Remarks" section for more details on this member.
     * 
     * This is the default value.
     * @type {Integer (Int32)}
     */
    static IAG_NoGesture => 61440

    /**
     * This gesture must be drawn as a single stroke that has at least three back-and-forth motions.
     * @type {Integer (Int32)}
     */
    static IAG_Scratchout => 61441

    /**
     * The triangle must be drawn in a single stroke, without lifting the pen.
     * @type {Integer (Int32)}
     */
    static IAG_Triangle => 61442

    /**
     * The square can be drawn in one or two strokes. In one stroke, draw the entire square without lifting the pen. In two strokes, draw three sides of the square and use another stroke to draw the remaining side. Do not use more than two strokes to draw the square.
     * @type {Integer (Int32)}
     */
    static IAG_Square => 61443

    /**
     * The star must have exactly five points and be drawn in a single stroke without lifting the pen.
     * @type {Integer (Int32)}
     */
    static IAG_Star => 61444

    /**
     * The upward stroke must be twice as long as the smaller downward stroke.
     * @type {Integer (Int32)}
     */
    static IAG_Check => 61445

    /**
     * Start the curlicue on the ink on which you intend to take action.
     * @type {Integer (Int32)}
     */
    static IAG_Curlicue => 61456

    /**
     * Start the double-curlicue on the ink on which you intend to take action.
     * @type {Integer (Int32)}
     */
    static IAG_DoubleCurlicue => 61457

    /**
     * The circle must be drawn in a single stroke without lifting the pen.
     * @type {Integer (Int32)}
     */
    static IAG_Circle => 61472

    /**
     * The two circles must overlap each other and be drawn in a single stroke without lifting the pen.
     * @type {Integer (Int32)}
     */
    static IAG_DoubleCircle => 61473

    /**
     * The semicircle must be drawn from left to right. Horizontally, the two ends of the semicircle should be as even as possible.
     * @type {Integer (Int32)}
     */
    static IAG_SemiCircleLeft => 61480

    /**
     * The semicircle must be drawn from right to left. Horizontally, the two ends of the semicircle should be as even as possible.
     * @type {Integer (Int32)}
     */
    static IAG_SemiCircleRight => 61481

    /**
     * Both sides of the chevron must be drawn as equal as possible. The angle must be sharp and end in a point.
     * @type {Integer (Int32)}
     */
    static IAG_ChevronUp => 61488

    /**
     * Both sides of the chevron must be drawn as equal as possible. The angle must be sharp and end in a point.
     * @type {Integer (Int32)}
     */
    static IAG_ChevronDown => 61489

    /**
     * Both sides of the chevron must be drawn as equal as possible. The angle must be sharp and end in a point.
     * @type {Integer (Int32)}
     */
    static IAG_ChevronLeft => 61490

    /**
     * Both sides of the chevron must be drawn as equal as possible. The angle must be sharp and end in a point.
     * @type {Integer (Int32)}
     */
    static IAG_ChevronRight => 61491

    /**
     * The arrow can be drawn in single stroke or in two strokes in which one stroke is the line and the other is the arrow head. Do not use more than two strokes to draw the arrow.
     * @type {Integer (Int32)}
     */
    static IAG_ArrowUp => 61496

    /**
     * The arrow can be drawn in a single stroke or in two strokes in which one stroke is the line and the other is the arrow head. Do not use more than two strokes to draw the arrow.
     * @type {Integer (Int32)}
     */
    static IAG_ArrowDown => 61497

    /**
     * The arrow can be drawn in a single stroke or in two strokes in which one stroke is the line and the other is the arrow head. Do not use more than two strokes to draw the arrow.
     * @type {Integer (Int32)}
     */
    static IAG_ArrowLeft => 61498

    /**
     * The arrow can be drawn in a single stroke or in two strokes in which one stroke is the line and the other is the arrow head. Do not use more than two strokes to draw the arrow.
     * @type {Integer (Int32)}
     */
    static IAG_ArrowRight => 61499

    /**
     * This gesture must be drawn as a single fast flick in the upward direction.
     * 
     * This gesture is used by <a href="https://docs.microsoft.com/windows/desktop/tablet/flicks-gestures">Flicks Gestures</a>.
     * @type {Integer (Int32)}
     */
    static IAG_Up => 61528

    /**
     * This gesture must be drawn as a single fast flick in the downward direction.
     * 
     * This gesture is used by <a href="https://docs.microsoft.com/windows/desktop/tablet/flicks-gestures">Flicks Gestures</a>.
     * @type {Integer (Int32)}
     */
    static IAG_Down => 61529

    /**
     * This gesture must be drawn as a single fast flick to the left.
     * 
     * This gesture is used by <a href="https://docs.microsoft.com/windows/desktop/tablet/flicks-gestures">Flicks Gestures</a>.
     * @type {Integer (Int32)}
     */
    static IAG_Left => 61530

    /**
     * This gesture must be drawn as a single fast flick to the right.
     * 
     * This gesture is used by <a href="https://docs.microsoft.com/windows/desktop/tablet/flicks-gestures">Flicks Gestures</a>.
     * @type {Integer (Int32)}
     */
    static IAG_Right => 61531

    /**
     * This gesture must be drawn in a single stroke starting with the up stroke. The two strokes must be as close to each other as possible.
     * @type {Integer (Int32)}
     */
    static IAG_UpDown => 61536

    /**
     * This gesture must be drawn in a single stroke starting with the down stroke. The two strokes must be as close to each other as possible.
     * @type {Integer (Int32)}
     */
    static IAG_DownUp => 61537

    /**
     * This gesture must be drawn in a single stroke starting with the left stroke. The two strokes must be as close to each other as possible.
     * @type {Integer (Int32)}
     */
    static IAG_LeftRight => 61538

    /**
     * This gesture must be drawn in a single stroke starting with the right stroke. The two strokes must be as close to each other as possible.
     * @type {Integer (Int32)}
     */
    static IAG_RightLeft => 61539

    /**
     * This gesture must be drawn in a single stroke starting with the up stroke. The left stroke must be about twice as long as the up stroke, and the two strokes must be at a right angle.
     * @type {Integer (Int32)}
     */
    static IAG_UpLeftLong => 61540

    /**
     * This gesture must be drawn in a single stroke starting with the up stroke. The right stroke must be about twice as long as the up stroke, and the two strokes must be at a right angle.
     * @type {Integer (Int32)}
     */
    static IAG_UpRightLong => 61541

    /**
     * This gesture must be drawn in a single stroke starting with the down stroke. The left stroke is about twice as long as the up stroke, and the two strokes must be at a right angle.
     * @type {Integer (Int32)}
     */
    static IAG_DownLeftLong => 61542

    /**
     * This gesture must be drawn in a single stroke starting with the down stroke. The right stroke must be about twice as long as the up stroke, and the two strokes must be at a right angle.
     * @type {Integer (Int32)}
     */
    static IAG_DownRightLong => 61543

    /**
     * This gesture must be drawn in a single stroke starting with the up stroke. The two sides must be as equal in length as possible and at a right angle.
     * @type {Integer (Int32)}
     */
    static IAG_UpLeft => 61544

    /**
     * This gesture must be drawn in a single stroke starting with the up stroke. The two sides must be as equal in length as possible and at a right angle.
     * @type {Integer (Int32)}
     */
    static IAG_UpRight => 61545

    /**
     * This gesture must be drawn in a single stroke starting with the down stroke. The two sides must be as equal in length as possible and at a right angle.
     * @type {Integer (Int32)}
     */
    static IAG_DownLeft => 61546

    /**
     * This gesture must be drawn in a single stroke starting with the down stroke. The two sides must be as equal in length as possible and at a right angle.
     * @type {Integer (Int32)}
     */
    static IAG_DownRight => 61547

    /**
     * This gesture must be drawn in a single stroke starting with the left stroke. The two sides must be as equal in length as possible and at a right angle.
     * @type {Integer (Int32)}
     */
    static IAG_LeftUp => 61548

    /**
     * This gesture must be drawn in a single stroke starting with the left stroke. The two sides are as equal in length as possible and at a right angle.
     * @type {Integer (Int32)}
     */
    static IAG_LeftDown => 61549

    /**
     * This gesture must be drawn in a single stroke starting with the right stroke. The two sides must be as equal in length as possible and at a right angle.
     * @type {Integer (Int32)}
     */
    static IAG_RightUp => 61550

    /**
     * This gesture must be drawn in a single stroke starting with the right stroke. The two sides must be as equal in length as possible and at a right angle.
     * @type {Integer (Int32)}
     */
    static IAG_RightDown => 61551

    /**
     * The line must be drawn first and then the dot drawn quickly and as close to the line as possible.
     * @type {Integer (Int32)}
     */
    static IAG_Exclamation => 61604

    /**
     * A mouse click.
     * 
     * For the least amount of slipping across the digitizer surface, tap quickly.
     * @type {Integer (Int32)}
     */
    static IAG_Tap => 61680

    /**
     * A mouse double-click.
     * 
     * Tap quickly and in as close to the same place for best results.
     * @type {Integer (Int32)}
     */
    static IAG_DoubleTap => 61681
}
