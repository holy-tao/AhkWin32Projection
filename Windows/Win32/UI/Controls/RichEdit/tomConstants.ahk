#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines values that are used with the Text Object Model (TOM) API.
 * @see https://learn.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class tomConstants extends Win32Enum{

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">tomBool</a> value that indicates false.
     * @type {Integer (Int32)}
     */
    static tomFalse => 0

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">tomBool</a> value that indicates true.
     * @type {Integer (Int32)}
     */
    static tomTrue => -1

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">tomBool</a> value that indicates a no-input, no-change value that works with <b>long</b>, <b>float</b>, and <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> parameters. For strings, <b>tomUndefined</b> (or NINCH) is represented by the null string. For Set operations, using <b>tomUndefined</b> does not change the target property. For Get operations, <b>tomUndefined</b> means that the characters in the range have different values (it gives the grayed check box in property dialog boxes).
     * @type {Integer (Int32)}
     */
    static tomUndefined => -9999999

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">tomBool</a> value that toggles the state of a property.
     * @type {Integer (Int32)}
     */
    static tomToggle => -9999998

    /**
     * Allow the rich edit control to select the appropriate color.
     * @type {Integer (Int32)}
     */
    static tomAutoColor => -9999997

    /**
     * Set to the document default format for objects that are attached to a range, or to the basic TOM engine default for objects that are not attached to a range.
     * @type {Integer (Int32)}
     */
    static tomDefault => -9999996

    /**
     * Suspend an operation.
     * @type {Integer (Int32)}
     */
    static tomSuspend => -9999995

    /**
     * Resume an operation.
     * @type {Integer (Int32)}
     */
    static tomResume => -9999994

    /**
     * Apply the current properties to the attached range.
     * @type {Integer (Int32)}
     */
    static tomApplyNow => 0

    /**
     * Allow setting property definitions, but don’t apply them to a range yet.
     * @type {Integer (Int32)}
     */
    static tomApplyLater => 1

    /**
     * Update the current font with the attached range properties.
     * @type {Integer (Int32)}
     */
    static tomTrackParms => 2

    /**
     * Don’t update the current font with the attached range properties.
     * @type {Integer (Int32)}
     */
    static tomCacheParms => 3

    /**
     * Apply temporary formatting.
     * @type {Integer (Int32)}
     */
    static tomApplyTmp => 4

    /**
     * Do not apply smart fonts.
     * @type {Integer (Int32)}
     */
    static tomDisableSmartFont => 8

    /**
     * Do apply smart fonts.
     * @type {Integer (Int32)}
     */
    static tomEnableSmartFont => 9

    /**
     * Use points for floating-point measurements.
     * @type {Integer (Int32)}
     */
    static tomUsePoints => 10

    /**
     * Use twips for floating-point measurements.
     * @type {Integer (Int32)}
     */
    static tomUseTwips => 11

    /**
     * Move backward toward the start of a story.
     * @type {Integer (Int32)}
     */
    static tomBackward => -1073741823

    /**
     * Move foreward toward the end of a story.
     * @type {Integer (Int32)}
     */
    static tomForward => 1073741823

    /**
     * Collapse the selection or range to an insertion point and then move the insertion point.
     * @type {Integer (Int32)}
     */
    static tomMove => 0

    /**
     * Extend a selection or range by moving one of the endpoints.
     * @type {Integer (Int32)}
     */
    static tomExtend => 1

    /**
     * There is no selection and no insertion point.
     * @type {Integer (Int32)}
     */
    static tomNoSelection => 0

    /**
     * The selection insertion point.
     * @type {Integer (Int32)}
     */
    static tomSelectionIP => 1

    /**
     * The selection is a single, nondegenerate text range.
     * @type {Integer (Int32)}
     */
    static tomSelectionNormal => 2

    /**
     * A frame is selected.
     * @type {Integer (Int32)}
     */
    static tomSelectionFrame => 3

    /**
     * One or more table columns is selected.
     * @type {Integer (Int32)}
     */
    static tomSelectionColumn => 4

    /**
     * One or more table rows is selected.
     * @type {Integer (Int32)}
     */
    static tomSelectionRow => 5

    /**
     * A block is selected.
     * @type {Integer (Int32)}
     */
    static tomSelectionBlock => 6

    /**
     * The selection is a picture.
     * @type {Integer (Int32)}
     */
    static tomSelectionInlineShape => 7

    /**
     * A shape is selected.
     * @type {Integer (Int32)}
     */
    static tomSelectionShape => 8

    /**
     * The starting position of the selection is active.
     * @type {Integer (Int32)}
     */
    static tomSelStartActive => 1

    /**
     * For degenerate selections, the ambiguous character position corresponding to both the beginning of a line and the end of the preceding line should have the caret displayed at the end of the preceding line.
     * @type {Integer (Int32)}
     */
    static tomSelAtEOL => 2

    /**
     * Insert/overtype mode is set to overtype.
     * @type {Integer (Int32)}
     */
    static tomSelOvertype => 4

    /**
     * Selection is active.
     * @type {Integer (Int32)}
     */
    static tomSelActive => 8

    /**
     * Typing and pasting replaces the selection.
     * @type {Integer (Int32)}
     */
    static tomSelReplace => 16

    /**
     * The end of a text range.
     * @type {Integer (Int32)}
     */
    static tomEnd => 0

    /**
     * The start of range.
     * @type {Integer (Int32)}
     */
    static tomStart => 32

    /**
     * Collapse to the end position of a range or selection.
     * @type {Integer (Int32)}
     */
    static tomCollapseEnd => 0

    /**
     * Collapse to the start position of a range or selection.
     * @type {Integer (Int32)}
     */
    static tomCollapseStart => 1

    /**
     * Use client coordinates instead of screen coordinates.
     * @type {Integer (Int32)}
     */
    static tomClientCoord => 256

    /**
     * Allow points outside of the client area.
     * @type {Integer (Int32)}
     */
    static tomAllowOffClient => 512

    /**
     * Transform coordinates using a world transform (XFORM) supplied by the host application.
     * @type {Integer (Int32)}
     */
    static tomTransform => 1024

    /**
     * Get  a point inside an inline object argument; for example, inside the numerator of a fraction.
     * @type {Integer (Int32)}
     */
    static tomObjectArg => 2048

    /**
     * The end of the specified unit.
     * @type {Integer (Int32)}
     */
    static tomAtEnd => 4096

    /**
     * No underlining.
     * @type {Integer (Int32)}
     */
    static tomNone => 0

    /**
     * Single underline.
     * @type {Integer (Int32)}
     */
    static tomSingle => 1

    /**
     * Underline words only.
     * @type {Integer (Int32)}
     */
    static tomWords => 2

    /**
     * Double underline.
     * @type {Integer (Int32)}
     */
    static tomDouble => 3

    /**
     * Dotted underline.
     * @type {Integer (Int32)}
     */
    static tomDotted => 4

    /**
     * Dash underline.
     * @type {Integer (Int32)}
     */
    static tomDash => 5

    /**
     * Dash dot underline.
     * @type {Integer (Int32)}
     */
    static tomDashDot => 6

    /**
     * Dash dot dot underline.
     * @type {Integer (Int32)}
     */
    static tomDashDotDot => 7

    /**
     * Wave underline.
     * @type {Integer (Int32)}
     */
    static tomWave => 8

    /**
     * Thick underline.
     * @type {Integer (Int32)}
     */
    static tomThick => 9

    /**
     * Hair underline.
     * @type {Integer (Int32)}
     */
    static tomHair => 10

    /**
     * Double wave underline.
     * @type {Integer (Int32)}
     */
    static tomDoubleWave => 11

    /**
     * Heavy wave underline.
     * @type {Integer (Int32)}
     */
    static tomHeavyWave => 12

    /**
     * Long dash underline.
     * @type {Integer (Int32)}
     */
    static tomLongDash => 13

    /**
     * Thick dash underline.
     * @type {Integer (Int32)}
     */
    static tomThickDash => 14

    /**
     * Thick dash dot underline.
     * @type {Integer (Int32)}
     */
    static tomThickDashDot => 15

    /**
     * Thick dash dot dot underline.
     * @type {Integer (Int32)}
     */
    static tomThickDashDotDot => 16

    /**
     * Thick dotted underline.
     * @type {Integer (Int32)}
     */
    static tomThickDotted => 17

    /**
     * Thick long dash underline.
     * @type {Integer (Int32)}
     */
    static tomThickLongDash => 18

    /**
     * Single space. The line-spacing value is ignored.
     * @type {Integer (Int32)}
     */
    static tomLineSpaceSingle => 0

    /**
     * One-and-a-half line spacing. The line-spacing value is ignored.
     * @type {Integer (Int32)}
     */
    static tomLineSpace1pt5 => 1

    /**
     * Double line spacing. The line-spacing value is ignored.
     * @type {Integer (Int32)}
     */
    static tomLineSpaceDouble => 2

    /**
     * The line-spacing value specifies the spacing from one line to the next. However, if the value is less than single spacing, text is single-spaced.
     * @type {Integer (Int32)}
     */
    static tomLineSpaceAtLeast => 3

    /**
     * The line-spacing value specifies the exact spacing from one line to the next, even if the value is less than single spacing.
     * @type {Integer (Int32)}
     */
    static tomLineSpaceExactly => 4

    /**
     * The line-spacing value specifies the line spacing, in lines.
     * @type {Integer (Int32)}
     */
    static tomLineSpaceMultiple => 5

    /**
     * The line-spacing value specifies the line spacing by percent of line height.
     * @type {Integer (Int32)}
     */
    static tomLineSpacePercent => 6

    /**
     * Text aligns with the left margin.
     * @type {Integer (Int32)}
     */
    static tomAlignLeft => 0

    /**
     * Text is centered between the margins.
     * @type {Integer (Int32)}
     */
    static tomAlignCenter => 1

    /**
     * Text aligns with the right margin.
     * @type {Integer (Int32)}
     */
    static tomAlignRight => 2

    /**
     * Text starts at the left margin and, if the line extends beyond the right margin, all the spaces in the line are adjusted to be even.
     * @type {Integer (Int32)}
     */
    static tomAlignJustify => 3

    /**
     * The decimal point is set at the tab position. This is useful for aligning a column of decimal numbers.
     * @type {Integer (Int32)}
     */
    static tomAlignDecimal => 3

    /**
     * A vertical bar is positioned at the tab position. Text is not affected. Alignment bars on nearby lines at the same position form a continuous vertical line.
     * @type {Integer (Int32)}
     */
    static tomAlignBar => 4

    /**
     * Position at a default tab stop.
     * @type {Integer (Int32)}
     */
    static tomDefaultTab => 5

    /**
     * Same as  <b>tomAlignJustify</b>.
     * @type {Integer (Int32)}
     */
    static tomAlignInterWord => 3

    /**
     * Same as <b>tomAlignInterLetter</b>, but uses East Asian metrics.
     * @type {Integer (Int32)}
     */
    static tomAlignNewspaper => 4

    /**
     * The first and last characters of each line (except the last line) are aligned to the left and right margins, and lines are filled by adding or subtracting the same amount from each character.
     * @type {Integer (Int32)}
     */
    static tomAlignInterLetter => 5

    /**
     * Same as <b>tomAlignInterLetter</b>, but uses East Asian metrics, and scales the spacing by the width of characters.
     * @type {Integer (Int32)}
     */
    static tomAlignScaled => 6

    /**
     * Use spaces to fill the spaces taken by a tab character.
     * @type {Integer (Int32)}
     */
    static tomSpaces => 0

    /**
     * Use dots to fill the spaces taken by a tab character.
     * @type {Integer (Int32)}
     */
    static tomDots => 1

    /**
     * Use dashes to fill the spaces taken by a tab character.
     * @type {Integer (Int32)}
     */
    static tomDashes => 2

    /**
     * Use solid lines to fill the spaces taken by a tab character.
     * @type {Integer (Int32)}
     */
    static tomLines => 3

    /**
     * Use thick solid lines to fill the spaces taken by a tab character.
     * @type {Integer (Int32)}
     */
    static tomThickLines => 4

    /**
     * Use equal signs to fill the spaces taken by a tab character.
     * @type {Integer (Int32)}
     */
    static tomEquals => 5

    /**
     * The tab preceding the specified location.
     * @type {Integer (Int32)}
     */
    static tomTabBack => -3

    /**
     * The next tab following the specified location.
     * @type {Integer (Int32)}
     */
    static tomTabNext => -2

    /**
     * The tab at the specified location.
     * @type {Integer (Int32)}
     */
    static tomTabHere => -1

    /**
     * Not a list paragraph.
     * @type {Integer (Int32)}
     */
    static tomListNone => 0

    /**
     * List uses bullets (0x2022); other bullets are given by &gt; 32.
     * @type {Integer (Int32)}
     */
    static tomListBullet => 1

    /**
     * List is numbered with Arabic numerals (0, 1, 2, ...).
     * @type {Integer (Int32)}
     */
    static tomListNumberAsArabic => 2

    /**
     * List is ordered with lowercase letters (a, b, c, ...).
     * @type {Integer (Int32)}
     */
    static tomListNumberAsLCLetter => 3

    /**
     * List is ordered with uppercase Arabic letters (A, B, C, ...).
     * @type {Integer (Int32)}
     */
    static tomListNumberAsUCLetter => 4

    /**
     * List is ordered with lowercase Roman letters (i, ii, iii, ...).
     * @type {Integer (Int32)}
     */
    static tomListNumberAsLCRoman => 5

    /**
     * List is ordered with uppercase Roman letters (I, II, III, ...).
     * @type {Integer (Int32)}
     */
    static tomListNumberAsUCRoman => 6

    /**
     * The value returned by <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara-getliststart">ITextPara::GetListStart</a> is treated as the first code in a Unicode sequence.
     * @type {Integer (Int32)}
     */
    static tomListNumberAsSequence => 7

    /**
     * List is ordered with Unicode circled numbers 
     * 
     * <img alt="Unicode numbers in a circle." src="images/unicodecirclednumbers.png"/>
     * @type {Integer (Int32)}
     */
    static tomListNumberedCircle => 8

    /**
     * List is ordered with Wingdings black circled digits 
     * 
     * <img alt="Circled black digits." src="images/wingdingblackcircleddigits.png"/>
     * @type {Integer (Int32)}
     */
    static tomListNumberedBlackCircleWingding => 9

    /**
     * List is ordered with Wingdings white circled digits:
     * 
     * <img alt="White digits in a black circle." src="images/wingdingwhitecircleddigits.png"/>
     * @type {Integer (Int32)}
     */
    static tomListNumberedWhiteCircleWingding => 10

    /**
     * Full-width ASCII (０, １, ２, ３, …).
     * @type {Integer (Int32)}
     */
    static tomListNumberedArabicWide => 11

    /**
     * Chinese with 十 only in items 10 through 99 (一, 二, 三, 四…).
     * @type {Integer (Int32)}
     */
    static tomListNumberedChS => 12

    /**
     * Chinese with 十 only in items 10 through 19.
     * @type {Integer (Int32)}
     */
    static tomListNumberedChT => 13

    /**
     * Chinese with a full-width period, no 十.
     * @type {Integer (Int32)}
     */
    static tomListNumberedJpnChS => 14

    /**
     * Chinese with no 十.
     * @type {Integer (Int32)}
     */
    static tomListNumberedJpnKor => 15

    /**
     * Arabic alphabetic ( أ ,ب ,ت ,ث ,…).
     * @type {Integer (Int32)}
     */
    static tomListNumberedArabic1 => 16

    /**
     * Arabic abjadi ( أ ,ب ,ج ,د ,…).
     * @type {Integer (Int32)}
     */
    static tomListNumberedArabic2 => 17

    /**
     * Hebrew alphabet (א, ב, ג, ד, …).
     * @type {Integer (Int32)}
     */
    static tomListNumberedHebrew => 18

    /**
     * Thai alphabetic (ก, ข,ค, ง, …).
     * @type {Integer (Int32)}
     */
    static tomListNumberedThaiAlpha => 19

    /**
     * Thai numbers (๑, ๒,๓, ๔…).
     * @type {Integer (Int32)}
     */
    static tomListNumberedThaiNum => 20

    /**
     * Hindi vowels (अ, आ, इ, ई, …).
     * @type {Integer (Int32)}
     */
    static tomListNumberedHindiAlpha => 21

    /**
     * Hindi consonants (क, ख, ग, घ, …).
     * @type {Integer (Int32)}
     */
    static tomListNumberedHindiAlpha1 => 22

    /**
     * Hindi numbers (१, २, ३, ४, …).
     * @type {Integer (Int32)}
     */
    static tomListNumberedHindiNum => 23

    /**
     * Encloses the number in parentheses, as in: (1).
     * @type {Integer (Int32)}
     */
    static tomListParentheses => 65536

    /**
     * Follows the number with a period.
     * @type {Integer (Int32)}
     */
    static tomListPeriod => 131072

    /**
     * Uses the number alone.
     * @type {Integer (Int32)}
     */
    static tomListPlain => 196608

    /**
     * Uses no numbers.
     * @type {Integer (Int32)}
     */
    static tomListNoNumber => 262144

    /**
     * Follows the number with a hyphen (-).
     * @type {Integer (Int32)}
     */
    static tomListMinus => 524288

    /**
     * Suppress the numbering style for list items.
     * @type {Integer (Int32)}
     */
    static tomIgnoreNumberStyle => 16777216

    /**
     * The normal paragraph style.
     * @type {Integer (Int32)}
     */
    static tomParaStyleNormal => -1

    /**
     * The style for level 1 paragraph headings.
     * @type {Integer (Int32)}
     */
    static tomParaStyleHeading1 => -2

    /**
     * The style for level 2 paragraph headings.
     * @type {Integer (Int32)}
     */
    static tomParaStyleHeading2 => -3

    /**
     * The style for level 3 paragraph headings.
     * @type {Integer (Int32)}
     */
    static tomParaStyleHeading3 => -4

    /**
     * The style for level 4 paragraph headings.
     * @type {Integer (Int32)}
     */
    static tomParaStyleHeading4 => -5

    /**
     * The style for level 5 paragraph headings.
     * @type {Integer (Int32)}
     */
    static tomParaStyleHeading5 => -6

    /**
     * The style for level 6 paragraph headings.
     * @type {Integer (Int32)}
     */
    static tomParaStyleHeading6 => -7

    /**
     * The style for level 7 paragraph headings.
     * @type {Integer (Int32)}
     */
    static tomParaStyleHeading7 => -8

    /**
     * The style for level 8 paragraph headings.
     * @type {Integer (Int32)}
     */
    static tomParaStyleHeading8 => -9

    /**
     * The style for level 9 paragraph headings.
     * @type {Integer (Int32)}
     */
    static tomParaStyleHeading9 => -10

    /**
     * The unit is a single character.
     * @type {Integer (Int32)}
     */
    static tomCharacter => 1

    /**
     * The unit is a word.
     * @type {Integer (Int32)}
     */
    static tomWord => 2

    /**
     * The unit is a sentence.
     * @type {Integer (Int32)}
     */
    static tomSentence => 3

    /**
     * The unit is a paragraph.
     * @type {Integer (Int32)}
     */
    static tomParagraph => 4

    /**
     * The unit is a line.
     * @type {Integer (Int32)}
     */
    static tomLine => 5

    /**
     * The unit is a story; that is, a contiguous range of text that represent a part of a document, such as the main text of the document, headers and footers, footnotes, annotations, and so on.
     * @type {Integer (Int32)}
     */
    static tomStory => 6

    /**
     * The unit is a screenful.
     * @type {Integer (Int32)}
     */
    static tomScreen => 7

    /**
     * The unit is a section.
     * @type {Integer (Int32)}
     */
    static tomSection => 8

    /**
     * The unit is a table column.
     * @type {Integer (Int32)}
     */
    static tomTableColumn => 9

    /**
     * The unit is a text column.
     * @type {Integer (Int32)}
     */
    static tomColumn => 9

    /**
     * The unit is a table row
     * @type {Integer (Int32)}
     */
    static tomRow => 10

    /**
     * The unit is a window.
     * @type {Integer (Int32)}
     */
    static tomWindow => 11

    /**
     * The unit is a spreadsheet cell.
     * @type {Integer (Int32)}
     */
    static tomCell => 12

    /**
     * The unit is a run of constant character formatting.
     * @type {Integer (Int32)}
     */
    static tomCharFormat => 13

    /**
     * The unit is a run of constant paragraph formatting.
     * @type {Integer (Int32)}
     */
    static tomParaFormat => 14

    /**
     * The unit is a table.
     * @type {Integer (Int32)}
     */
    static tomTable => 15

    /**
     * The unit is an embedded object.
     * @type {Integer (Int32)}
     */
    static tomObject => 16

    /**
     * The unit is a page.
     * @type {Integer (Int32)}
     */
    static tomPage => 17

    /**
     * The unit is a hard paragraph.
     * @type {Integer (Int32)}
     */
    static tomHardParagraph => 18

    /**
     * The unit is a cluster of characters.
     * @type {Integer (Int32)}
     */
    static tomCluster => 19

    /**
     * The unit is an inline object.
     * @type {Integer (Int32)}
     */
    static tomInlineObject => 20

    /**
     * The unit is an inline object argument.
     * @type {Integer (Int32)}
     */
    static tomInlineObjectArg => 21

    /**
     * The unit is a leaf-level line.
     * @type {Integer (Int32)}
     */
    static tomLeafLine => 22

    /**
     * A layout column.
     * @type {Integer (Int32)}
     */
    static tomLayoutColumn => 23

    /**
     * The identifier of the current process.
     * @type {Integer (Int32)}
     */
    static tomProcessId => 1073741825

    /**
     * Match on whole words when doing a text search.
     * @type {Integer (Int32)}
     */
    static tomMatchWord => 2

    /**
     * A case-sensitive a text search.
     * @type {Integer (Int32)}
     */
    static tomMatchCase => 4

    /**
     * Match regular expressions when doing a text search.
     * @type {Integer (Int32)}
     */
    static tomMatchPattern => 8

    /**
     * No special type.
     * @type {Integer (Int32)}
     */
    static tomUnknownStory => 0

    /**
     * The main story always exists for a rich edit control.
     * @type {Integer (Int32)}
     */
    static tomMainTextStory => 1

    /**
     * The story used for footnotes.
     * @type {Integer (Int32)}
     */
    static tomFootnotesStory => 2

    /**
     * The story used for endnotes.
     * @type {Integer (Int32)}
     */
    static tomEndnotesStory => 3

    /**
     * The story used for comments.
     * @type {Integer (Int32)}
     */
    static tomCommentsStory => 4

    /**
     * The story used for a text box.
     * @type {Integer (Int32)}
     */
    static tomTextFrameStory => 5

    /**
     * The story containing headers for even pages.
     * @type {Integer (Int32)}
     */
    static tomEvenPagesHeaderStory => 6

    /**
     * The story containing headers for odd pages.
     * @type {Integer (Int32)}
     */
    static tomPrimaryHeaderStory => 7

    /**
     * The story containing footers for even pages.
     * @type {Integer (Int32)}
     */
    static tomEvenPagesFooterStory => 8

    /**
     * The story containing footers for odd pages.
     * @type {Integer (Int32)}
     */
    static tomPrimaryFooterStory => 9

    /**
     * The story containing the header for the first page.
     * @type {Integer (Int32)}
     */
    static tomFirstPageHeaderStory => 10

    /**
     * The story containing the footer for the first page.
     * @type {Integer (Int32)}
     */
    static tomFirstPageFooterStory => 11

    /**
     * The scratch story.
     * @type {Integer (Int32)}
     */
    static tomScratchStory => 127

    /**
     * The story used for a Find dialog.
     * @type {Integer (Int32)}
     */
    static tomFindStory => 128

    /**
     * The story used for a Replace dialog.
     * @type {Integer (Int32)}
     */
    static tomReplaceStory => 129

    /**
     * Story is inactive.
     * @type {Integer (Int32)}
     */
    static tomStoryInactive => 0

    /**
     * Story has display, but no UI.
     * @type {Integer (Int32)}
     */
    static tomStoryActiveDisplay => 1

    /**
     * Story is UI active; that is, it receives keyboard and mouse input.
     * @type {Integer (Int32)}
     */
    static tomStoryActiveUI => 2

    /**
     * Story has display and UI activity.
     * @type {Integer (Int32)}
     */
    static tomStoryActiveDisplayUI => 3

    /**
     * Do not apply text animation.
     * @type {Integer (Int32)}
     */
    static tomNoAnimation => 0

    /**
     * Text is bordered by marquee lights that blink between the colors red, yellow, green, and blue.
     * @type {Integer (Int32)}
     */
    static tomLasVegasLights => 1

    /**
     * Text has a black background that blinks on and off.
     * @type {Integer (Int32)}
     */
    static tomBlinkingBackground => 2

    /**
     * Text is overlaid with multicolored stars that blink on and off at regular intervals
     * @type {Integer (Int32)}
     */
    static tomSparkleText => 3

    /**
     * Text is surrounded by a black dashed-line border. The border is animated so that the individual dashes appear to move clockwise around the text.
     * @type {Integer (Int32)}
     */
    static tomMarchingBlackAnts => 4

    /**
     * Text is surrounded by a red dashed-line border that is animated to appear to move clockwise around the text.
     * @type {Integer (Int32)}
     */
    static tomMarchingRedAnts => 5

    /**
     * Text is alternately blurred and unblurred at regular intervals, to give the appearance of shimmering.
     * @type {Integer (Int32)}
     */
    static tomShimmer => 6

    /**
     * Text appears gradually from the top down.
     * @type {Integer (Int32)}
     */
    static tomWipeDown => 7

    /**
     * Text appears gradually from the bottom up.
     * @type {Integer (Int32)}
     */
    static tomWipeRight => 8

    /**
     * Defines the maximum animation flag value.
     * @type {Integer (Int32)}
     */
    static tomAnimationMax => 8

    /**
     * Set text to lowercase.
     * @type {Integer (Int32)}
     */
    static tomLowerCase => 0

    /**
     * Set text to uppercase.
     * @type {Integer (Int32)}
     */
    static tomUpperCase => 1

    /**
     * Capitalize the first letter of each word.
     * @type {Integer (Int32)}
     */
    static tomTitleCase => 2

    /**
     * Capitalize the first letter of each sentence.
     * @type {Integer (Int32)}
     */
    static tomSentenceCase => 4

    /**
     * Toggle the case of each letter.
     * @type {Integer (Int32)}
     */
    static tomToggleCase => 5

    /**
     * Read only.
     * @type {Integer (Int32)}
     */
    static tomReadOnly => 256

    /**
     * Other programs cannot read.
     * @type {Integer (Int32)}
     */
    static tomShareDenyRead => 512

    /**
     * Other programs cannot write.
     * @type {Integer (Int32)}
     */
    static tomShareDenyWrite => 1024

    /**
     * Replace the selection with a file.
     * @type {Integer (Int32)}
     */
    static tomPasteFile => 4096

    /**
     * Create a new file. Fail if the file already exists.
     * @type {Integer (Int32)}
     */
    static tomCreateNew => 16

    /**
     * Create a new file. Destroy the existing file if it exists.
     * @type {Integer (Int32)}
     */
    static tomCreateAlways => 32

    /**
     * Open an existing file. Fail if the file does not exist.
     * @type {Integer (Int32)}
     */
    static tomOpenExisting => 48

    /**
     * Open an existing file. Create a new file if the file does not exist.
     * @type {Integer (Int32)}
     */
    static tomOpenAlways => 64

    /**
     * Open an existing file, but truncate it to zero length.
     * @type {Integer (Int32)}
     */
    static tomTruncateExisting => 80

    /**
     * Open as  RTF.
     * @type {Integer (Int32)}
     */
    static tomRTF => 1

    /**
     * Open as text ANSI or Unicode.
     * @type {Integer (Int32)}
     */
    static tomText => 2

    /**
     * Open as HTML.
     * @type {Integer (Int32)}
     */
    static tomHTML => 3

    /**
     * Open as Word document.
     * @type {Integer (Int32)}
     */
    static tomWordDocument => 4

    /**
     * Boldface.
     * @type {Integer (Int32)}
     */
    static tomBold => -2147483647

    /**
     * Italic.
     * @type {Integer (Int32)}
     */
    static tomItalic => -2147483646

    /**
     * Underline.
     * @type {Integer (Int32)}
     */
    static tomUnderline => -2147483644

    /**
     * Strikeout.
     * @type {Integer (Int32)}
     */
    static tomStrikeout => -2147483640

    /**
     * Protected.
     * @type {Integer (Int32)}
     */
    static tomProtected => -2147483632

    /**
     * Hyperlink.
     * @type {Integer (Int32)}
     */
    static tomLink => -2147483616

    /**
     * Small caps.
     * @type {Integer (Int32)}
     */
    static tomSmallCaps => -2147483584

    /**
     * All caps.
     * @type {Integer (Int32)}
     */
    static tomAllCaps => -2147483520

    /**
     * Hidden.
     * @type {Integer (Int32)}
     */
    static tomHidden => -2147483392

    /**
     * Outline.
     * @type {Integer (Int32)}
     */
    static tomOutline => -2147483136

    /**
     * Shadow.
     * @type {Integer (Int32)}
     */
    static tomShadow => -2147482624

    /**
     * Emboss.
     * @type {Integer (Int32)}
     */
    static tomEmboss => -2147481600

    /**
     * Imprint.
     * @type {Integer (Int32)}
     */
    static tomImprint => -2147479552

    /**
     * Disabled.
     * @type {Integer (Int32)}
     */
    static tomDisabled => -2147475456

    /**
     * Revised.
     * @type {Integer (Int32)}
     */
    static tomRevised => -2147467264

    /**
     * Subscript character format.
     * @type {Integer (Int32)}
     */
    static tomSubscriptCF => -2147418112

    /**
     * Superscript character format.
     * @type {Integer (Int32)}
     */
    static tomSuperscriptCF => -2147352576

    /**
     * Font bound (uses font binding).
     * @type {Integer (Int32)}
     */
    static tomFontBound => -2146435072

    /**
     * The link is protected (friendly name link).
     * @type {Integer (Int32)}
     */
    static tomLinkProtected => -2139095040

    /**
     * The start delimiter of an inline object.
     * @type {Integer (Int32)}
     */
    static tomInlineObjectStart => -2130706432

    /**
     * The characters are less common members of a script. A font that supports a script should check if it has glyphs for such characters.
     * @type {Integer (Int32)}
     */
    static tomExtendedChar => -2113929216

    /**
     * Use system back color.
     * @type {Integer (Int32)}
     */
    static tomAutoBackColor => -2080374784

    /**
     * Don't build up operator.
     * @type {Integer (Int32)}
     */
    static tomMathZoneNoBuildUp => -2013265920

    /**
     * Math zone.
     * @type {Integer (Int32)}
     */
    static tomMathZone => -1879048192

    /**
     * Math zone ordinary text.
     * @type {Integer (Int32)}
     */
    static tomMathZoneOrdinary => -1610612736

    /**
     * Use system text color.
     * @type {Integer (Int32)}
     */
    static tomAutoTextColor => -1073741824

    /**
     * Display math zone.
     * @type {Integer (Int32)}
     */
    static tomMathZoneDisplay => 262144

    /**
     * Right-to-left paragraph
     * @type {Integer (Int32)}
     */
    static tomParaEffectRTL => 1

    /**
     * Keep the paragraph together.
     * @type {Integer (Int32)}
     */
    static tomParaEffectKeep => 2

    /**
     * Keep with next the paragraph.
     * @type {Integer (Int32)}
     */
    static tomParaEffectKeepNext => 4

    /**
     * Put a page break before this paragraph.
     * @type {Integer (Int32)}
     */
    static tomParaEffectPageBreakBefore => 8

    /**
     * No line number for this paragraph.
     * @type {Integer (Int32)}
     */
    static tomParaEffectNoLineNumber => 16

    /**
     * No widow control.
     * @type {Integer (Int32)}
     */
    static tomParaEffectNoWidowControl => 32

    /**
     * Don't hyphenate this paragraph.
     * @type {Integer (Int32)}
     */
    static tomParaEffectDoNotHyphen => 64

    /**
     * Side by side.
     * @type {Integer (Int32)}
     */
    static tomParaEffectSideBySide => 128

    /**
     * Heading contents are collapsed (in outline view).
     * @type {Integer (Int32)}
     */
    static tomParaEffectCollapsed => 256

    /**
     * Outline view nested level.
     * @type {Integer (Int32)}
     */
    static tomParaEffectOutlineLevel => 512

    /**
     * Paragraph has boxed effect (is not displayed).
     * @type {Integer (Int32)}
     */
    static tomParaEffectBox => 1024

    /**
     * At or inside table delimiter.
     * @type {Integer (Int32)}
     */
    static tomParaEffectTableRowDelimiter => 4096

    /**
     * Inside or at the start of a table.
     * @type {Integer (Int32)}
     */
    static tomParaEffectTable => 16384

    /**
     * Use East Asian character-pair-width modification.
     * @type {Integer (Int32)}
     */
    static tomModWidthPairs => 1

    /**
     * Use East Asian space-width modification.
     * @type {Integer (Int32)}
     */
    static tomModWidthSpace => 2

    /**
     * Use East Asian auto spacing between alphabetics.
     * @type {Integer (Int32)}
     */
    static tomAutoSpaceAlpha => 4

    /**
     * Use East Asian auto spacing for digits.
     * @type {Integer (Int32)}
     */
    static tomAutoSpaceNumeric => 8

    /**
     * Use East Asian automatic spacing for parentheses or brackets.
     * @type {Integer (Int32)}
     */
    static tomAutoSpaceParens => 16

    /**
     * Embedded font (CLIP_EMBEDDED).
     * @type {Integer (Int32)}
     */
    static tomEmbeddedFont => 32

    /**
     * Double strikeout.
     * @type {Integer (Int32)}
     */
    static tomDoublestrike => 64

    /**
     * Run has overlapping text.
     * @type {Integer (Int32)}
     */
    static tomOverlapping => 128

    /**
     * Normal caret.
     * @type {Integer (Int32)}
     */
    static tomNormalCaret => 0

    /**
     * The Korean block caret.
     * @type {Integer (Int32)}
     */
    static tomKoreanBlockCaret => 1

    /**
     * NULL caret (caret suppressed).
     * @type {Integer (Int32)}
     */
    static tomNullCaret => 2

    /**
     * Add left/top insets to the client rectangle, and subtract right/bottom insets from the client rectangle.
     * @type {Integer (Int32)}
     */
    static tomIncludeInset => 1

    /**
     * Use the Unicode bidirectional (bidi) algorithm.
     * @type {Integer (Int32)}
     */
    static tomUnicodeBiDi => 1

    /**
     * Check math-zone character formatting.
     * @type {Integer (Int32)}
     */
    static tomMathCFCheck => 4

    /**
     * Don't include text as part of a hyperlink.
     * @type {Integer (Int32)}
     */
    static tomUnlink => 8

    /**
     * Don't insert as hidden text.
     * @type {Integer (Int32)}
     */
    static tomUnhide => 16

    /**
     * Obey the current text limit instead of increasing the text to fit.
     * @type {Integer (Int32)}
     */
    static tomCheckTextLimit => 32

    /**
     * Ignore the font that is active at a particular character position.
     * @type {Integer (Int32)}
     */
    static tomIgnoreCurrentFont => 0

    /**
     * Match the current character repertoire.
     * @type {Integer (Int32)}
     */
    static tomMatchCharRep => 1

    /**
     * Match the current font signature.
     * @type {Integer (Int32)}
     */
    static tomMatchFontSignature => 2

    /**
     * Use the current font if its character repertoire is <b>tomAnsi</b>.
     * @type {Integer (Int32)}
     */
    static tomMatchAscii => 4

    /**
     * Gets the height.
     * @type {Integer (Int32)}
     */
    static tomGetHeightOnly => 8

    /**
     * Match a math font.
     * @type {Integer (Int32)}
     */
    static tomMatchMathFont => 16

    /**
     * Set the character repertoire based on the specified character set.
     * @type {Integer (Int32)}
     */
    static tomCharset => -2147483648

    /**
     * Set the character repertoire based on the specified LCID.
     * @type {Integer (Int32)}
     */
    static tomCharRepFromLcid => 1073741824

    /**
     * Latin 1
     * @type {Integer (Int32)}
     */
    static tomAnsi => 0

    /**
     * From Latin 1 and 2
     * @type {Integer (Int32)}
     */
    static tomEastEurope => 1

    /**
     * Cyrillic
     * @type {Integer (Int32)}
     */
    static tomCyrillic => 2

    /**
     * Greek
     * @type {Integer (Int32)}
     */
    static tomGreek => 3

    /**
     * Turkish (Latin 1 + dotless i, ...)
     * @type {Integer (Int32)}
     */
    static tomTurkish => 4

    /**
     * Hebrew
     * @type {Integer (Int32)}
     */
    static tomHebrew => 5

    /**
     * Arabic
     * @type {Integer (Int32)}
     */
    static tomArabic => 6

    /**
     * From Latin 1 and 2
     * @type {Integer (Int32)}
     */
    static tomBaltic => 7

    /**
     * Latin 1 with some combining marks
     * @type {Integer (Int32)}
     */
    static tomVietnamese => 8

    /**
     * Default character repertoire
     * @type {Integer (Int32)}
     */
    static tomDefaultCharRep => 9

    /**
     * Symbol character set (not Unicode)
     * @type {Integer (Int32)}
     */
    static tomSymbol => 10

    /**
     * Thai
     * @type {Integer (Int32)}
     */
    static tomThai => 11

    /**
     * Japanese
     * @type {Integer (Int32)}
     */
    static tomShiftJIS => 12

    /**
     * Simplified Chinese
     * @type {Integer (Int32)}
     */
    static tomGB2312 => 13

    /**
     * Hangul
     * @type {Integer (Int32)}
     */
    static tomHangul => 14

    /**
     * Traditional Chinese
     * @type {Integer (Int32)}
     */
    static tomBIG5 => 15

    /**
     * PC437 character set (DOS)
     * @type {Integer (Int32)}
     */
    static tomPC437 => 16

    /**
     * OEM character set (original PC)
     * @type {Integer (Int32)}
     */
    static tomOEM => 17

    /**
     * Main Macintosh character repertoire
     * @type {Integer (Int32)}
     */
    static tomMac => 18

    /**
     * Armenian
     * @type {Integer (Int32)}
     */
    static tomArmenian => 19

    /**
     * Syriac
     * @type {Integer (Int32)}
     */
    static tomSyriac => 20

    /**
     * Thaana
     * @type {Integer (Int32)}
     */
    static tomThaana => 21

    /**
     * Devanagari
     * @type {Integer (Int32)}
     */
    static tomDevanagari => 22

    /**
     * Bangla (formerly Bengali)
     * @type {Integer (Int32)}
     */
    static tomBengali => 23

    /**
     * Gurmukhi
     * @type {Integer (Int32)}
     */
    static tomGurmukhi => 24

    /**
     * Gujarati
     * @type {Integer (Int32)}
     */
    static tomGujarati => 25

    /**
     * Odia (formerly Oriya)
     * @type {Integer (Int32)}
     */
    static tomOriya => 26

    /**
     * Tamil
     * @type {Integer (Int32)}
     */
    static tomTamil => 27

    /**
     * Telugu
     * @type {Integer (Int32)}
     */
    static tomTelugu => 28

    /**
     * Kannada
     * @type {Integer (Int32)}
     */
    static tomKannada => 29

    /**
     * Malayalam
     * @type {Integer (Int32)}
     */
    static tomMalayalam => 30

    /**
     * Sinhala
     * @type {Integer (Int32)}
     */
    static tomSinhala => 31

    /**
     * Lao
     * @type {Integer (Int32)}
     */
    static tomLao => 32

    /**
     * Tibetan
     * @type {Integer (Int32)}
     */
    static tomTibetan => 33

    /**
     * Myanmar
     * @type {Integer (Int32)}
     */
    static tomMyanmar => 34

    /**
     * Georgian
     * @type {Integer (Int32)}
     */
    static tomGeorgian => 35

    /**
     * Jamo
     * @type {Integer (Int32)}
     */
    static tomJamo => 36

    /**
     * Ethiopic
     * @type {Integer (Int32)}
     */
    static tomEthiopic => 37

    /**
     * Cherokee
     * @type {Integer (Int32)}
     */
    static tomCherokee => 38

    /**
     * Aboriginal
     * @type {Integer (Int32)}
     */
    static tomAboriginal => 39

    /**
     * Ogham
     * @type {Integer (Int32)}
     */
    static tomOgham => 40

    /**
     * Runic
     * @type {Integer (Int32)}
     */
    static tomRunic => 41

    /**
     * Khmer
     * @type {Integer (Int32)}
     */
    static tomKhmer => 42

    /**
     * Mongolian
     * @type {Integer (Int32)}
     */
    static tomMongolian => 43

    /**
     * Braille
     * @type {Integer (Int32)}
     */
    static tomBraille => 44

    /**
     * Yi
     * @type {Integer (Int32)}
     */
    static tomYi => 45

    /**
     * Limbu
     * @type {Integer (Int32)}
     */
    static tomLimbu => 46

    /**
     * TaiLe
     * @type {Integer (Int32)}
     */
    static tomTaiLe => 47

    /**
     * TaiLue
     * @type {Integer (Int32)}
     */
    static tomNewTaiLue => 48

    /**
     * Syloti Nagri
     * @type {Integer (Int32)}
     */
    static tomSylotiNagri => 49

    /**
     * Kharoshthi
     * @type {Integer (Int32)}
     */
    static tomKharoshthi => 50

    /**
     * Kayah Li
     * @type {Integer (Int32)}
     */
    static tomKayahli => 51

    /**
     * Unicode symbol
     * @type {Integer (Int32)}
     */
    static tomUsymbol => 52

    /**
     * Emoji
     * @type {Integer (Int32)}
     */
    static tomEmoji => 53

    /**
     * Glagolitic
     * @type {Integer (Int32)}
     */
    static tomGlagolitic => 54

    /**
     * Lisu
     * @type {Integer (Int32)}
     */
    static tomLisu => 55

    /**
     * Vai
     * @type {Integer (Int32)}
     */
    static tomVai => 56

    /**
     * N'Ko
     * @type {Integer (Int32)}
     */
    static tomNKo => 57

    /**
     * Osmanya
     * @type {Integer (Int32)}
     */
    static tomOsmanya => 58

    /**
     * Phags-pa
     * @type {Integer (Int32)}
     */
    static tomPhagsPa => 59

    /**
     * Gothic
     * @type {Integer (Int32)}
     */
    static tomGothic => 60

    /**
     * Deseret
     * @type {Integer (Int32)}
     */
    static tomDeseret => 61

    /**
     * Tifinagh
     * @type {Integer (Int32)}
     */
    static tomTifinagh => 62

    /**
     * The maximum character repertoire flag value.
     * @type {Integer (Int32)}
     */
    static tomCharRepMax => 63

    /**
     * Use Microsoft Rich Edit 1.0 mode.
     * @type {Integer (Int32)}
     */
    static tomRE10Mode => 1

    /**
     * Use a font with a name that starts with @,  for CJK vertical text. When rendered vertically, the characters in such a font are rotated 90 degrees so that they look upright instead of sideways.
     * @type {Integer (Int32)}
     */
    static tomUseAtFont => 2

    /**
     * Mask for the following four text orientations.
     * @type {Integer (Int32)}
     */
    static tomTextFlowMask => 12

    /**
     * Ordinary left-to-right horizontal text.
     * @type {Integer (Int32)}
     */
    static tomTextFlowES => 0

    /**
     * Ordinary East Asian vertical text.
     * @type {Integer (Int32)}
     */
    static tomTextFlowSW => 4

    /**
     * Alternative orientation.
     * @type {Integer (Int32)}
     */
    static tomTextFlowWN => 8

    /**
     * Alternative orientation.
     * @type {Integer (Int32)}
     */
    static tomTextFlowNE => 12

    /**
     * Disables the IME operation (see <a href="https://docs.microsoft.com/windows/desktop/Controls/rich-edit-control-styles">ES_NOIME</a>).
     * @type {Integer (Int32)}
     */
    static tomNoIME => 524288

    /**
     * Directs the rich edit control to allow the application to handle all IME operations (see <a href="https://docs.microsoft.com/windows/desktop/Controls/rich-edit-control-styles">ES_SELFIME</a>).
     * @type {Integer (Int32)}
     */
    static tomSelfIME => 262144

    /**
     * Horizontal scrolling is disabled.
     * @type {Integer (Int32)}
     */
    static tomNoUpScroll => 65536

    /**
     * Vertical scrolling is disabled.
     * @type {Integer (Int32)}
     */
    static tomNoVpScroll => 262144

    /**
     * Not a link.
     * @type {Integer (Int32)}
     */
    static tomNoLink => 0

    /**
     * The URL only; that is, no friendly name.
     * @type {Integer (Int32)}
     */
    static tomClientLink => 1

    /**
     * The name of friendly name link.
     * @type {Integer (Int32)}
     */
    static tomFriendlyLinkName => 2

    /**
     * The URL of a friendly name link.
     * @type {Integer (Int32)}
     */
    static tomFriendlyLinkAddress => 3

    /**
     * The URL of an automatic link.
     * @type {Integer (Int32)}
     */
    static tomAutoLinkURL => 4

    /**
     * An automatic link to an email address.
     * @type {Integer (Int32)}
     */
    static tomAutoLinkEmail => 5

    /**
     * An automatic link to a phone number.
     * @type {Integer (Int32)}
     */
    static tomAutoLinkPhone => 6

    /**
     * An automatic link to a storage location.
     * @type {Integer (Int32)}
     */
    static tomAutoLinkPath => 7

    /**
     * No compression.
     * @type {Integer (Int32)}
     */
    static tomCompressNone => 0

    /**
     * Compress punctuation.
     * @type {Integer (Int32)}
     */
    static tomCompressPunctuation => 1

    /**
     * Compress punctuation and kana.
     * @type {Integer (Int32)}
     */
    static tomCompressPunctuationAndKana => 2

    /**
     * The maximum compression flag value.
     * @type {Integer (Int32)}
     */
    static tomCompressMax => 2

    /**
     * Automatically set the underline position.
     * @type {Integer (Int32)}
     */
    static tomUnderlinePositionAuto => 0

    /**
     * Render underline below text.
     * @type {Integer (Int32)}
     */
    static tomUnderlinePositionBelow => 1

    /**
     * Render underline above text.
     * @type {Integer (Int32)}
     */
    static tomUnderlinePositionAbove => 2

    /**
     * The maximum underline position flag value.
     * @type {Integer (Int32)}
     */
    static tomUnderlinePositionMax => 2

    /**
     * For horizontal layout, align CJK characters on the baseline. For vertical layout, center align CJK characters.
     * @type {Integer (Int32)}
     */
    static tomFontAlignmentAuto => 0

    /**
     * For horizontal layout, top align CJK characters. For vertical layout, right align CJK characters.
     * @type {Integer (Int32)}
     */
    static tomFontAlignmentTop => 1

    /**
     * For horizontal or vertical layout, align CJK characters on the baseline.
     * @type {Integer (Int32)}
     */
    static tomFontAlignmentBaseline => 2

    /**
     * For horizontal layout, bottom align CJK characters. For vertical layout, left align CJK characters.
     * @type {Integer (Int32)}
     */
    static tomFontAlignmentBottom => 3

    /**
     * For horizontal layout, center CJK characters vertically. For vertical layout, center align CJK characters horizontally.
     * @type {Integer (Int32)}
     */
    static tomFontAlignmentCenter => 4

    /**
     * The maximum font alignment flag value.
     * @type {Integer (Int32)}
     */
    static tomFontAlignmentMax => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static tomRubyBelow => 128

    /**
     * 
     * @type {Integer (Int32)}
     */
    static tomRubyAlignCenter => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static tomRubyAlign010 => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static tomRubyAlign121 => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static tomRubyAlignLeft => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static tomRubyAlignRight => 4

    /**
     * Limit locations use document default.
     * @type {Integer (Int32)}
     */
    static tomLimitsDefault => 0

    /**
     * Limits are placed under and over the operator.
     * @type {Integer (Int32)}
     */
    static tomLimitsUnderOver => 1

    /**
     * Limits are operator subscript and superscript.
     * @type {Integer (Int32)}
     */
    static tomLimitsSubSup => 2

    /**
     * The upper limit is a superscript.
     * @type {Integer (Int32)}
     */
    static tomUpperLimitAsSuperScript => 3

    /**
     * Switch between <b>tomLimitsSubSup</b> and <b>tomLimitsUnderOver</b>.
     * @type {Integer (Int32)}
     */
    static tomLimitsOpposite => 4

    /**
     * Show empty lower limit placeholder.
     * @type {Integer (Int32)}
     */
    static tomShowLLimPlaceHldr => 8

    /**
     * Show empty upper limit placeholder.
     * @type {Integer (Int32)}
     */
    static tomShowULimPlaceHldr => 16

    /**
     * Don't grow the <i>n</i>-ary operator with the argument.
     * @type {Integer (Int32)}
     */
    static tomDontGrowWithContent => 64

    /**
     * Grow the <i>n</i>-ary operator with the argument.
     * @type {Integer (Int32)}
     */
    static tomGrowWithContent => 128

    /**
     * Align subscript under superscript.
     * @type {Integer (Int32)}
     */
    static tomSubSupAlign => 1

    /**
     * Mask for <b>tomLimitAlignCenter</b>, <b>tomLimitAlignLeft</b>, and <b>tomLimitAlignRight.</b>
     * @type {Integer (Int32)}
     */
    static tomLimitAlignMask => 3

    /**
     * Center limit under base.
     * @type {Integer (Int32)}
     */
    static tomLimitAlignCenter => 0

    /**
     * Align left ends of limit and base.
     * @type {Integer (Int32)}
     */
    static tomLimitAlignLeft => 1

    /**
     * Align right ends of limit and base.
     * @type {Integer (Int32)}
     */
    static tomLimitAlignRight => 2

    /**
     * Show empty radical degree placeholder.
     * @type {Integer (Int32)}
     */
    static tomShowDegPlaceHldr => 8

    /**
     * Center brackets at baseline.
     * @type {Integer (Int32)}
     */
    static tomAlignDefault => 0

    /**
     * Use brackets that match the argument ascent and descent.
     * @type {Integer (Int32)}
     */
    static tomAlignMatchAscentDescent => 2

    /**
     * Bits 7, 6 can have TeX variant enumeration values:
     * @type {Integer (Int32)}
     */
    static tomMathVariant => 32

    /**
     * The math handler determines the style.
     * @type {Integer (Int32)}
     */
    static tomStyleDefault => 0

    /**
     * The 2<sup>nd</sup> and higher level subscript superscript size, cramped.
     * @type {Integer (Int32)}
     */
    static tomStyleScriptScriptCramped => 1

    /**
     * The 2<sup>nd</sup> and higher level subscript superscript size.
     * @type {Integer (Int32)}
     */
    static tomStyleScriptScript => 2

    /**
     * The 1<sup>st</sup> level subscript superscript size, cramped.
     * @type {Integer (Int32)}
     */
    static tomStyleScriptCramped => 3

    /**
     * The 1<sup>st</sup> level subscript superscript size.
     * @type {Integer (Int32)}
     */
    static tomStyleScript => 4

    /**
     * Text size cramped, for example, inside a square root.
     * @type {Integer (Int32)}
     */
    static tomStyleTextCramped => 5

    /**
     * The standard inline text size.
     * @type {Integer (Int32)}
     */
    static tomStyleText => 6

    /**
     * Display style cramped.
     * @type {Integer (Int32)}
     */
    static tomStyleDisplayCramped => 7

    /**
     * Display style.
     * @type {Integer (Int32)}
     */
    static tomStyleDisplay => 8

    /**
     * Indicates one of these is active: <b>tomDecDecSize</b>, <b>tomDecSize</b>, <b>tomIncSize</b>, <b>tomIncIncSize</b>. Note that the maximum size is <b>tomStyleText</b> size, and the minimum size is <b>tomStyleScriptScript</b> size.
     * @type {Integer (Int32)}
     */
    static tomMathRelSize => 64

    /**
     * Two sizes smaller than the default.
     * @type {Integer (Int32)}
     */
    static tomDecDecSize => 254

    /**
     * One size smaller than the default.
     * @type {Integer (Int32)}
     */
    static tomDecSize => 255

    /**
     * One size bigger than the default.
     * @type {Integer (Int32)}
     */
    static tomIncSize => 65

    /**
     * Two sizes bigger than the default.
     * @type {Integer (Int32)}
     */
    static tomIncIncSize => 66

    /**
     * Use selection user interface rules.
     * @type {Integer (Int32)}
     */
    static tomGravityUI => 0

    /**
     * Both ends have backward gravity.
     * @type {Integer (Int32)}
     */
    static tomGravityBack => 1

    /**
     * Both ends have forward gravity.
     * @type {Integer (Int32)}
     */
    static tomGravityFore => 2

    /**
     * Inward gravity; that is, the start is forward, and the end is backward.
     * @type {Integer (Int32)}
     */
    static tomGravityIn => 3

    /**
     * Outward gravity; that is, the start is backward, and the end is forward.
     * @type {Integer (Int32)}
     */
    static tomGravityOut => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static tomGravityBackward => 536870912

    /**
     * 
     * @type {Integer (Int32)}
     */
    static tomGravityForward => 1073741824

    /**
     * Adjust CR/LFs at the start.
     * @type {Integer (Int32)}
     */
    static tomAdjustCRLF => 1

    /**
     * Use CR/LF in place of a carriage return or a line feed.
     * @type {Integer (Int32)}
     */
    static tomUseCRLF => 2

    /**
     * Copy up to 0xFFFC (OLE object).
     * @type {Integer (Int32)}
     */
    static tomTextize => 4

    /**
     * Allow a final end-of-paragraph (EOP) marker.
     * @type {Integer (Int32)}
     */
    static tomAllowFinalEOP => 8

    /**
     * Fold math alphanumerics to ASCII/Greek.
     * @type {Integer (Int32)}
     */
    static tomFoldMathAlpha => 16

    /**
     * Don't include hidden text.
     * @type {Integer (Int32)}
     */
    static tomNoHidden => 32

    /**
     * Include list numbers.
     * @type {Integer (Int32)}
     */
    static tomIncludeNumbering => 64

    /**
     * Replace table row delimiter characters with spaces.
     * @type {Integer (Int32)}
     */
    static tomTranslateTableCell => 128

    /**
     * Don't include math zone brackets.
     * @type {Integer (Int32)}
     */
    static tomNoMathZoneBrackets => 256

    /**
     * Convert to or from math italic and/or math bold according to the status of italic and bold retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextfont2-geteffects">ITextFont2::GetEffects</a> method.
     * @type {Integer (Int32)}
     */
    static tomConvertMathChar => 512

    /**
     * Don’t use math italics for upper-case Greek letters. This value is used with  
     * <b>tomConvertMathChar</b>.
     * @type {Integer (Int32)}
     */
    static tomNoUCGreekItalic => 1024

    /**
     * Allow math bold.  This value is used with  
     * <b>tomConvertMathChar</b>.
     * @type {Integer (Int32)}
     */
    static tomAllowMathBold => 2048

    /**
     * Get the BCP-47 language tag for this range.
     * @type {Integer (Int32)}
     */
    static tomLanguageTag => 4096

    /**
     * Get text in RTF.
     * @type {Integer (Int32)}
     */
    static tomConvertRTF => 8192

    /**
     * Apply RTF document default properties.
     * @type {Integer (Int32)}
     */
    static tomApplyRtfDocProps => 16384

    /**
     * Display the phantom object's argument.
     * @type {Integer (Int32)}
     */
    static tomPhantomShow => 1

    /**
     * The phantom object has zero width.
     * @type {Integer (Int32)}
     */
    static tomPhantomZeroWidth => 2

    /**
     * The phantom object has zero ascent.
     * @type {Integer (Int32)}
     */
    static tomPhantomZeroAscent => 4

    /**
     * The phantom object has zero descent.
     * @type {Integer (Int32)}
     */
    static tomPhantomZeroDescent => 8

    /**
     * Space the phantom object as if only the argument is present.
     * @type {Integer (Int32)}
     */
    static tomPhantomTransparent => 16

    /**
     * Ascent smash.
     * @type {Integer (Int32)}
     */
    static tomPhantomASmash => 5

    /**
     * Descent smash.
     * @type {Integer (Int32)}
     */
    static tomPhantomDSmash => 9

    /**
     * Horizontal smash.
     * @type {Integer (Int32)}
     */
    static tomPhantomHSmash => 3

    /**
     * Full smash.
     * @type {Integer (Int32)}
     */
    static tomPhantomSmash => 13

    /**
     * Horizontal phantom.
     * @type {Integer (Int32)}
     */
    static tomPhantomHorz => 12

    /**
     * Vertical phantom.
     * @type {Integer (Int32)}
     */
    static tomPhantomVert => 2

    /**
     * Hide top border.
     * @type {Integer (Int32)}
     */
    static tomBoxHideTop => 1

    /**
     * Hide bottom border.
     * @type {Integer (Int32)}
     */
    static tomBoxHideBottom => 2

    /**
     * Hide left border.
     * @type {Integer (Int32)}
     */
    static tomBoxHideLeft => 4

    /**
     * Hide right border.
     * @type {Integer (Int32)}
     */
    static tomBoxHideRight => 8

    /**
     * Display horizontal strikethrough.
     * @type {Integer (Int32)}
     */
    static tomBoxStrikeH => 16

    /**
     * Display vertical strikethrough.
     * @type {Integer (Int32)}
     */
    static tomBoxStrikeV => 32

    /**
     * Display diagonal strikethrough from the top left to the lower right.
     * @type {Integer (Int32)}
     */
    static tomBoxStrikeTLBR => 64

    /**
     * Display diagonal strikethrough from the lower left to the top right.
     * @type {Integer (Int32)}
     */
    static tomBoxStrikeBLTR => 128

    /**
     * Vertically align with center on baseline.
     * @type {Integer (Int32)}
     */
    static tomBoxAlignCenter => 1

    /**
     * Mask for <b>tomSpaceDefault</b>, <b>tomSpaceUnary</b>, <b>tomSpaceBinary</b>, <b>tomSpaceRelational</b>, <b>tomSpaceSkip</b>, <b>tomSpaceOrd</b>, and <b>tomSpaceDifferential.</b>
     * @type {Integer (Int32)}
     */
    static tomSpaceMask => 28

    /**
     * Default spacing
     * @type {Integer (Int32)}
     */
    static tomSpaceDefault => 0

    /**
     * Space the object as if it were a unary operator.
     * @type {Integer (Int32)}
     */
    static tomSpaceUnary => 4

    /**
     * Space the object as if it were a binary operator.
     * @type {Integer (Int32)}
     */
    static tomSpaceBinary => 8

    /**
     * Space the object as if it were a relational operator.
     * @type {Integer (Int32)}
     */
    static tomSpaceRelational => 12

    /**
     * Space the object as if it were a unary operator.
     * @type {Integer (Int32)}
     */
    static tomSpaceSkip => 16

    /**
     * Space the object as if it were an ordinal operator.
     * @type {Integer (Int32)}
     */
    static tomSpaceOrd => 20

    /**
     * Space the object as if it were a differential operator.
     * @type {Integer (Int32)}
     */
    static tomSpaceDifferential => 24

    /**
     * Treat as text size.
     * @type {Integer (Int32)}
     */
    static tomSizeText => 32

    /**
     * Treat as script size (approximately 73% of text size).
     * @type {Integer (Int32)}
     */
    static tomSizeScript => 64

    /**
     * Treat as subscript size (approximately 60% of text size).
     * @type {Integer (Int32)}
     */
    static tomSizeScriptScript => 96

    /**
     * Do not break arguments across a line.
     * @type {Integer (Int32)}
     */
    static tomNoBreak => 128

    /**
     * Position as if only the argument appears.
     * @type {Integer (Int32)}
     */
    static tomTransparentForPositioning => 256

    /**
     * Space according to argument properties.
     * @type {Integer (Int32)}
     */
    static tomTransparentForSpacing => 512

    /**
     * Stretch character below base.
     * @type {Integer (Int32)}
     */
    static tomStretchCharBelow => 0

    /**
     * Stretch character above base.
     * @type {Integer (Int32)}
     */
    static tomStretchCharAbove => 1

    /**
     * Stretch base  below character.
     * @type {Integer (Int32)}
     */
    static tomStretchBaseBelow => 2

    /**
     * Stretch base  above character.
     * @type {Integer (Int32)}
     */
    static tomStretchBaseAbove => 3

    /**
     * Mask for <b>tomMatrixAlignCenter</b>, <b>tomMatrixAlignTopRow</b>, and <b>tomMatrixAlignBottomRow.</b>
     * @type {Integer (Int32)}
     */
    static tomMatrixAlignMask => 3

    /**
     * Align the matrix center on baseline.
     * @type {Integer (Int32)}
     */
    static tomMatrixAlignCenter => 0

    /**
     * Align the matrix top row on the baseline.
     * @type {Integer (Int32)}
     */
    static tomMatrixAlignTopRow => 1

    /**
     * Align the matrix bottom row on the baseline.
     * @type {Integer (Int32)}
     */
    static tomMatrixAlignBottomRow => 3

    /**
     * Show empty element placeholder (a dotted box).
     * @type {Integer (Int32)}
     */
    static tomShowMatPlaceHldr => 8

    /**
     * Expand the right size to the layout width (for equation number)
     * @type {Integer (Int32)}
     */
    static tomEqArrayLayoutWidth => 1

    /**
     * Mask for <b>tomEqArrayAlignCenter</b>, <b>tomEqArrayAlignTopRow</b>, and <b>tomEqArrayBottomRow.</b>
     * @type {Integer (Int32)}
     */
    static tomEqArrayAlignMask => 12

    /**
     * Align the center of the equation array on the baseline.
     * @type {Integer (Int32)}
     */
    static tomEqArrayAlignCenter => 0

    /**
     * Align the top of equations on the baseline.
     * 
     * Align the top row of the equation on the baseline.
     * @type {Integer (Int32)}
     */
    static tomEqArrayAlignTopRow => 4

    /**
     * Align the bottom row of the equation on the baseline.
     * @type {Integer (Int32)}
     */
    static tomEqArrayAlignBottomRow => 12

    /**
     * Mask for <b>tomMathBreakLeft</b>, <b>tomMathBreakCenter</b>, and <b>tomMathBreakRight.</b>
     * @type {Integer (Int32)}
     */
    static tomMathManualBreakMask => 127

    /**
     * Align text following a manual break to the left.
     * @type {Integer (Int32)}
     */
    static tomMathBreakLeft => 125

    /**
     * Center text following a manual break.
     * @type {Integer (Int32)}
     */
    static tomMathBreakCenter => 126

    /**
     * Align text following a manual break to the right.
     * @type {Integer (Int32)}
     */
    static tomMathBreakRight => 127

    /**
     * Math equation alignment.
     * @type {Integer (Int32)}
     */
    static tomMathEqAlign => 128

    /**
     * Start shading math arguments.
     * @type {Integer (Int32)}
     */
    static tomMathArgShadingStart => 593

    /**
     * End shading math arguments.
     * @type {Integer (Int32)}
     */
    static tomMathArgShadingEnd => 594

    /**
     * Start shading math objects.
     * @type {Integer (Int32)}
     */
    static tomMathObjShadingStart => 595

    /**
     * End shading math objects.
     * @type {Integer (Int32)}
     */
    static tomMathObjShadingEnd => 596

    /**
     * Not in the function list.
     * @type {Integer (Int32)}
     */
    static tomFunctionTypeNone => 0

    /**
     * An ordinary math function that takes arguments.
     * @type {Integer (Int32)}
     */
    static tomFunctionTypeTakesArg => 1

    /**
     * Use the lower limit for _, and so on.
     * @type {Integer (Int32)}
     */
    static tomFunctionTypeTakesLim => 2

    /**
     * Turn the preceding FA into an NBSP.
     * @type {Integer (Int32)}
     */
    static tomFunctionTypeTakesLim2 => 3

    /**
     * A "lim" function.
     * @type {Integer (Int32)}
     */
    static tomFunctionTypeIsLim => 4

    /**
     * The default alignment for math paragraphs.
     * @type {Integer (Int32)}
     */
    static tomMathParaAlignDefault => 0

    /**
     * Center math paragraphs as a group.
     * @type {Integer (Int32)}
     */
    static tomMathParaAlignCenterGroup => 1

    /**
     * Center math paragraphs.
     * @type {Integer (Int32)}
     */
    static tomMathParaAlignCenter => 2

    /**
     * Left-align math paragraphs.
     * @type {Integer (Int32)}
     */
    static tomMathParaAlignLeft => 3

    /**
     * Right-align math paragraphs.
     * @type {Integer (Int32)}
     */
    static tomMathParaAlignRight => 4

    /**
     * Mask for <b>tomMathDispAlignCenterGroup</b>, <b>tomMathDispAlignCenter</b>, <b>tomMathDispAlignLeft</b>, <b>tomMathDispAlignRight</b>, <b>tomMathDispIntUnderOver</b>, and <b>tomMathDispNaryGrow</b>.
     * @type {Integer (Int32)}
     */
    static tomMathDispAlignMask => 3

    /**
     * Center a math paragraph as a group.
     * @type {Integer (Int32)}
     */
    static tomMathDispAlignCenterGroup => 0

    /**
     * Center all equations in a math paragraph.
     * @type {Integer (Int32)}
     */
    static tomMathDispAlignCenter => 1

    /**
     * Left justify all equations in a math paragraph.
     * @type {Integer (Int32)}
     */
    static tomMathDispAlignLeft => 2

    /**
     * Right justify all equations in a math paragraph.
     * @type {Integer (Int32)}
     */
    static tomMathDispAlignRight => 3

    /**
     * Display-mode integral limits location.
     * @type {Integer (Int32)}
     */
    static tomMathDispIntUnderOver => 4

    /**
     * Indicates whether to use display-mode nested fraction script size.
     * @type {Integer (Int32)}
     */
    static tomMathDispFracTeX => 8

    /**
     * Indicates whether to use math-paragraph n-ary grow.
     * @type {Integer (Int32)}
     */
    static tomMathDispNaryGrow => 16

    /**
     * Empty arguments display mask.
     * @type {Integer (Int32)}
     */
    static tomMathDocEmptyArgMask => 96

    /**
     * Dotted square, if necessary.
     * @type {Integer (Int32)}
     */
    static tomMathDocEmptyArgAuto => 0

    /**
     * Dotted square, always.
     * @type {Integer (Int32)}
     */
    static tomMathDocEmptyArgAlways => 32

    /**
     * Nothing.
     * @type {Integer (Int32)}
     */
    static tomMathDocEmptyArgNever => 64

    /**
     * Do not display the underscore (_) as subscripted, or the caret (^) as superscripted.
     * @type {Integer (Int32)}
     */
    static tomMathDocSbSpOpUnchanged => 128

    /**
     * Style mask for the <b>tomMathDocDiffUpright</b>, <b>tomMathDocDiffItalic</b>, <b>tomMathDocDiffOpenItalic </b> options.
     * @type {Integer (Int32)}
     */
    static tomMathDocDiffMask => 768

    /**
     * Use default glyphs for math differentials.
     * @type {Integer (Int32)}
     */
    static tomMathDocDiffDefault => 0

    /**
     * Use upright glyphs for math differentials.
     * @type {Integer (Int32)}
     */
    static tomMathDocDiffUpright => 256

    /**
     * Use italic glyphs for math differentials.
     * @type {Integer (Int32)}
     */
    static tomMathDocDiffItalic => 512

    /**
     * No glyph change.
     * @type {Integer (Int32)}
     */
    static tomMathDocDiffOpenItalic => 768

    /**
     * Math-paragraph non-integral n-ary limits location.
     * @type {Integer (Int32)}
     */
    static tomMathDispNarySubSup => 1024

    /**
     * Math-paragraph spacing defaults. Use math paragraph offsets instead of regular paragraph offsets.
     * @type {Integer (Int32)}
     */
    static tomMathDispDef => 2048

    /**
     * Enable right-to-left (RTL) math zones in RTL paragraphs.
     * @type {Integer (Int32)}
     */
    static tomMathEnableRtl => 4096

    /**
     * Equation line break mask.
     * @type {Integer (Int32)}
     */
    static tomMathBrkBinMask => 196608

    /**
     * Break before  binary/relational operator.
     * @type {Integer (Int32)}
     */
    static tomMathBrkBinBefore => 0

    /**
     * Break after binary/relational operator.
     * @type {Integer (Int32)}
     */
    static tomMathBrkBinAfter => 65536

    /**
     * Duplicate binary/relational before/after.
     * @type {Integer (Int32)}
     */
    static tomMathBrkBinDup => 131072

    /**
     * Duplicate mask for minus operator.
     * @type {Integer (Int32)}
     */
    static tomMathBrkBinSubMask => 786432

    /**
     * -- (minus on both lines).
     * @type {Integer (Int32)}
     */
    static tomMathBrkBinSubMM => 0

    /**
     * + -
     * @type {Integer (Int32)}
     */
    static tomMathBrkBinSubPM => 262144

    /**
     * - +
     * @type {Integer (Int32)}
     */
    static tomMathBrkBinSubMP => 524288

    /**
     * Set the selection character position and character count to range values.
     * @type {Integer (Int32)}
     */
    static tomSelRange => 597

    /**
     * Use a string handle (<b>HSTRING</b>) instead of a binary string (<b>BSTR</b>).
     * @type {Integer (Int32)}
     */
    static tomHstring => 596

    /**
     * Gets the TeX style of the font.
     * @type {Integer (Int32)}
     */
    static tomFontPropTeXStyle => 828

    /**
     * Use <b>tomFontPropAlign</b> to get the <b>Align</b> property of an operator in a math zone. Here are how the values are assigned:<ul>
     * <li>Value 0 implies no special alignment.</li>
     * <li>Values 1 through 127 align the operator with the (n – 1)st operator on the first line of an equation.</li>
     * <li>Value 128 identifies operators to be vertically aligned with respect to one another ("Align at ="). </li>
     * <li>Other values are illegal.</li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static tomFontPropAlign => 829

    /**
     * 
     * @type {Integer (Int32)}
     */
    static tomFontStretch => 830

    /**
     * 
     * @type {Integer (Int32)}
     */
    static tomFontStyle => 831

    /**
     * Represents the normal upright font style.
     * @type {Integer (Int32)}
     */
    static tomFontStyleUpright => 0

    /**
     * Represents an oblique font style.
     * @type {Integer (Int32)}
     */
    static tomFontStyleOblique => 1

    /**
     * Represents an italic font style.
     * @type {Integer (Int32)}
     */
    static tomFontStyleItalic => 2

    /**
     * No defined font stretch.
     * @type {Integer (Int32)}
     */
    static tomFontStretchDefault => 0

    /**
     * An ultra-condensed font stretch (50% of normal).
     * @type {Integer (Int32)}
     */
    static tomFontStretchUltraCondensed => 1

    /**
     * An extra-condensed font stretch (62.5% of normal).
     * @type {Integer (Int32)}
     */
    static tomFontStretchExtraCondensed => 2

    /**
     * A condensed font stretch (75% of normal).
     * @type {Integer (Int32)}
     */
    static tomFontStretchCondensed => 3

    /**
     * A semi-condensed font stretch (87.5% of normal).
     * @type {Integer (Int32)}
     */
    static tomFontStretchSemiCondensed => 4

    /**
     * The normal font stretch that all other font stretch values relate to (100%).
     * @type {Integer (Int32)}
     */
    static tomFontStretchNormal => 5

    /**
     * A semi-expanded font stretch (112.5% of normal).
     * @type {Integer (Int32)}
     */
    static tomFontStretchSemiExpanded => 6

    /**
     * An expanded font stretch (125% of normal).
     * @type {Integer (Int32)}
     */
    static tomFontStretchExpanded => 7

    /**
     * An extra-expanded font stretch (150% of normal).
     * @type {Integer (Int32)}
     */
    static tomFontStretchExtraExpanded => 8

    /**
     * An ultra-expanded font stretch (200% of normal).
     * @type {Integer (Int32)}
     */
    static tomFontStretchUltraExpanded => 9

    /**
     * The default font weight.
     * @type {Integer (Int32)}
     */
    static tomFontWeightDefault => 0

    /**
     * Thin font weight.
     * @type {Integer (Int32)}
     */
    static tomFontWeightThin => 100

    /**
     * Extra light font weight.
     * @type {Integer (Int32)}
     */
    static tomFontWeightExtraLight => 200

    /**
     * Light font weight.
     * @type {Integer (Int32)}
     */
    static tomFontWeightLight => 300

    /**
     * Normal font weight.
     * @type {Integer (Int32)}
     */
    static tomFontWeightNormal => 400

    /**
     * Same as <b>tomFontWeightNormal</b>.
     * @type {Integer (Int32)}
     */
    static tomFontWeightRegular => 400

    /**
     * Medium font weight.
     * @type {Integer (Int32)}
     */
    static tomFontWeightMedium => 500

    /**
     * Semi bold font weight.
     * @type {Integer (Int32)}
     */
    static tomFontWeightSemiBold => 600

    /**
     * Bold font weight.
     * @type {Integer (Int32)}
     */
    static tomFontWeightBold => 700

    /**
     * Extra bold font weight.
     * @type {Integer (Int32)}
     */
    static tomFontWeightExtraBold => 800

    /**
     * Heavy font weight.
     * @type {Integer (Int32)}
     */
    static tomFontWeightBlack => 900

    /**
     * Same as <b>tomFontWeightBlack</b>.
     * @type {Integer (Int32)}
     */
    static tomFontWeightHeavy => 900

    /**
     * Extra heavy font weight.
     * @type {Integer (Int32)}
     */
    static tomFontWeightExtraBlack => 950

    /**
     * Alignment properties for a math paragraph.
     * @type {Integer (Int32)}
     */
    static tomParaPropMathAlign => 1079

    /**
     * Used with the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextdocument2-setproperty">ITextDocument2::SetProperty</a> method to set any combination of <b>tomMathAutoCorrect</b>, <b>tomTeX</b>, or <b>tomMathAlphabetics</b>.
     * @type {Integer (Int32)}
     */
    static tomDocMathBuild => 128

    /**
     * Left margin for display math.
     * @type {Integer (Int32)}
     */
    static tomMathLMargin => 129

    /**
     * Right margin for display math.
     * @type {Integer (Int32)}
     */
    static tomMathRMargin => 130

    /**
     * Equation wrap indent for display math.
     * @type {Integer (Int32)}
     */
    static tomMathWrapIndent => 131

    /**
     * Equation right wrap indent for display math (in a left-to-right (LTR) math zone).
     * @type {Integer (Int32)}
     */
    static tomMathWrapRight => 132

    /**
     * Space after a display math equation.
     * @type {Integer (Int32)}
     */
    static tomMathPostSpace => 134

    /**
     * Space before a display math equation.
     * @type {Integer (Int32)}
     */
    static tomMathPreSpace => 133

    /**
     * Space between equations in math paragraphs.
     * @type {Integer (Int32)}
     */
    static tomMathInterSpace => 135

    /**
     * Space between lines in a display math equation.
     * @type {Integer (Int32)}
     */
    static tomMathIntraSpace => 136

    /**
     * Indicates whether data can be copied to the clipboard.
     * @type {Integer (Int32)}
     */
    static tomCanCopy => 137

    /**
     * Indicates whether one or more redo operations exist.
     * @type {Integer (Int32)}
     */
    static tomCanRedo => 138

    /**
     * Indicates whether one or more undo operations exist.
     * @type {Integer (Int32)}
     */
    static tomCanUndo => 139

    /**
     * The undo stack count limit.
     * @type {Integer (Int32)}
     */
    static tomUndoLimit => 140

    /**
     * A document automatic link.
     * @type {Integer (Int32)}
     */
    static tomDocAutoLink => 141

    /**
     * The ellipsis mode.
     * @type {Integer (Int32)}
     */
    static tomEllipsisMode => 142

    /**
     * The ellipsis state.
     * @type {Integer (Int32)}
     */
    static tomEllipsisState => 143

    /**
     * Ellipsis is disabled.
     * @type {Integer (Int32)}
     */
    static tomEllipsisNone => 0

    /**
     * An ellipsis forces a break anywhere in the line.
     * @type {Integer (Int32)}
     */
    static tomEllipsisEnd => 1

    /**
     * An ellipsis forces a break between words.
     * @type {Integer (Int32)}
     */
    static tomEllipsisWord => 3

    /**
     * Ellipsis is present.
     * @type {Integer (Int32)}
     */
    static tomEllipsisPresent => 1

    /**
     * The top cell in vertically merged cell set.
     * @type {Integer (Int32)}
     */
    static tomVTopCell => 1

    /**
     * Any cell except the top cell in a vertically merged cell set.
     * @type {Integer (Int32)}
     */
    static tomVLowCell => 2

    /**
     * Start a cell in a horizontally merged cell set.
     * @type {Integer (Int32)}
     */
    static tomHStartCell => 4

    /**
     * Any cell except the start in a horizontally merged cell set.
     * @type {Integer (Int32)}
     */
    static tomHContCell => 8

    /**
     * Update the row to have the properties of the table row identified by the associated text range.
     * @type {Integer (Int32)}
     */
    static tomRowUpdate => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static tomRowApplyDefault => 0

    /**
     * Changes cell width(s) or cell count (for changing column widths and inserting/deleting columns without changing cell border properties, and so forth.)
     * @type {Integer (Int32)}
     */
    static tomCellStructureChangeOnly => 1

    /**
     * The actual height of a table row.
     * @type {Integer (Int32)}
     */
    static tomRowHeightActual => 2059
}
