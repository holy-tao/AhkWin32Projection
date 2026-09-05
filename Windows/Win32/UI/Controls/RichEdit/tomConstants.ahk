#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines values that are used with the Text Object Model (TOM) API.
 * @see https://learn.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
class tomConstants extends Win32Enum {

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">tomBool</a> value that indicates false.
     * Native name: tomFalse
     * @type {Integer (Int32)}
     */
    static False => 0

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">tomBool</a> value that indicates true.
     * Native name: tomTrue
     * @type {Integer (Int32)}
     */
    static True => -1

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">tomBool</a> value that indicates a no-input, no-change value that works with <b>long</b>, <b>float</b>, and <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> parameters. For strings, <b>tomUndefined</b> (or NINCH) is represented by the null string. For Set operations, using <b>tomUndefined</b> does not change the target property. For Get operations, <b>tomUndefined</b> means that the characters in the range have different values (it gives the grayed check box in property dialog boxes).
     * Native name: tomUndefined
     * @type {Integer (Int32)}
     */
    static Undefined => -9999999

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">tomBool</a> value that toggles the state of a property.
     * Native name: tomToggle
     * @type {Integer (Int32)}
     */
    static Toggle => -9999998

    /**
     * Allow the rich edit control to select the appropriate color.
     * Native name: tomAutoColor
     * @type {Integer (Int32)}
     */
    static AutoColor => -9999997

    /**
     * Set to the document default format for objects that are attached to a range, or to the basic TOM engine default for objects that are not attached to a range.
     * Native name: tomDefault
     * @type {Integer (Int32)}
     */
    static Default => -9999996

    /**
     * Suspend an operation.
     * Native name: tomSuspend
     * @type {Integer (Int32)}
     */
    static Suspend => -9999995

    /**
     * Resume an operation.
     * Native name: tomResume
     * @type {Integer (Int32)}
     */
    static Resume => -9999994

    /**
     * Apply the current properties to the attached range.
     * Native name: tomApplyNow
     * @type {Integer (Int32)}
     */
    static ApplyNow => 0

    /**
     * Allow setting property definitions, but don’t apply them to a range yet.
     * Native name: tomApplyLater
     * @type {Integer (Int32)}
     */
    static ApplyLater => 1

    /**
     * Update the current font with the attached range properties.
     * Native name: tomTrackParms
     * @type {Integer (Int32)}
     */
    static TrackParms => 2

    /**
     * Don’t update the current font with the attached range properties.
     * Native name: tomCacheParms
     * @type {Integer (Int32)}
     */
    static CacheParms => 3

    /**
     * Apply temporary formatting.
     * Native name: tomApplyTmp
     * @type {Integer (Int32)}
     */
    static ApplyTmp => 4

    /**
     * Do not apply smart fonts.
     * Native name: tomDisableSmartFont
     * @type {Integer (Int32)}
     */
    static DisableSmartFont => 8

    /**
     * Do apply smart fonts.
     * Native name: tomEnableSmartFont
     * @type {Integer (Int32)}
     */
    static EnableSmartFont => 9

    /**
     * Use points for floating-point measurements.
     * Native name: tomUsePoints
     * @type {Integer (Int32)}
     */
    static UsePoints => 10

    /**
     * Use twips for floating-point measurements.
     * Native name: tomUseTwips
     * @type {Integer (Int32)}
     */
    static UseTwips => 11

    /**
     * Move backward toward the start of a story.
     * Native name: tomBackward
     * @type {Integer (Int32)}
     */
    static Backward => -1073741823

    /**
     * Move foreward toward the end of a story.
     * Native name: tomForward
     * @type {Integer (Int32)}
     */
    static Forward => 1073741823

    /**
     * Collapse the selection or range to an insertion point and then move the insertion point.
     * Native name: tomMove
     * @type {Integer (Int32)}
     */
    static Move => 0

    /**
     * Extend a selection or range by moving one of the endpoints.
     * Native name: tomExtend
     * @type {Integer (Int32)}
     */
    static Extend => 1

    /**
     * There is no selection and no insertion point.
     * Native name: tomNoSelection
     * @type {Integer (Int32)}
     */
    static NoSelection => 0

    /**
     * The selection insertion point.
     * Native name: tomSelectionIP
     * @type {Integer (Int32)}
     */
    static SelectionIP => 1

    /**
     * The selection is a single, nondegenerate text range.
     * Native name: tomSelectionNormal
     * @type {Integer (Int32)}
     */
    static SelectionNormal => 2

    /**
     * A frame is selected.
     * Native name: tomSelectionFrame
     * @type {Integer (Int32)}
     */
    static SelectionFrame => 3

    /**
     * One or more table columns is selected.
     * Native name: tomSelectionColumn
     * @type {Integer (Int32)}
     */
    static SelectionColumn => 4

    /**
     * One or more table rows is selected.
     * Native name: tomSelectionRow
     * @type {Integer (Int32)}
     */
    static SelectionRow => 5

    /**
     * A block is selected.
     * Native name: tomSelectionBlock
     * @type {Integer (Int32)}
     */
    static SelectionBlock => 6

    /**
     * The selection is a picture.
     * Native name: tomSelectionInlineShape
     * @type {Integer (Int32)}
     */
    static SelectionInlineShape => 7

    /**
     * A shape is selected.
     * Native name: tomSelectionShape
     * @type {Integer (Int32)}
     */
    static SelectionShape => 8

    /**
     * The starting position of the selection is active.
     * Native name: tomSelStartActive
     * @type {Integer (Int32)}
     */
    static SelStartActive => 1

    /**
     * For degenerate selections, the ambiguous character position corresponding to both the beginning of a line and the end of the preceding line should have the caret displayed at the end of the preceding line.
     * Native name: tomSelAtEOL
     * @type {Integer (Int32)}
     */
    static SelAtEOL => 2

    /**
     * Insert/overtype mode is set to overtype.
     * Native name: tomSelOvertype
     * @type {Integer (Int32)}
     */
    static SelOvertype => 4

    /**
     * Selection is active.
     * Native name: tomSelActive
     * @type {Integer (Int32)}
     */
    static SelActive => 8

    /**
     * Typing and pasting replaces the selection.
     * Native name: tomSelReplace
     * @type {Integer (Int32)}
     */
    static SelReplace => 16

    /**
     * The end of a text range.
     * Native name: tomEnd
     * @type {Integer (Int32)}
     */
    static End => 0

    /**
     * The start of range.
     * Native name: tomStart
     * @type {Integer (Int32)}
     */
    static Start => 32

    /**
     * Collapse to the end position of a range or selection.
     * Native name: tomCollapseEnd
     * @type {Integer (Int32)}
     */
    static CollapseEnd => 0

    /**
     * Collapse to the start position of a range or selection.
     * Native name: tomCollapseStart
     * @type {Integer (Int32)}
     */
    static CollapseStart => 1

    /**
     * Use client coordinates instead of screen coordinates.
     * Native name: tomClientCoord
     * @type {Integer (Int32)}
     */
    static ClientCoord => 256

    /**
     * Allow points outside of the client area.
     * Native name: tomAllowOffClient
     * @type {Integer (Int32)}
     */
    static AllowOffClient => 512

    /**
     * Transform coordinates using a world transform (XFORM) supplied by the host application.
     * Native name: tomTransform
     * @type {Integer (Int32)}
     */
    static Transform => 1024

    /**
     * Get  a point inside an inline object argument; for example, inside the numerator of a fraction.
     * Native name: tomObjectArg
     * @type {Integer (Int32)}
     */
    static ObjectArg => 2048

    /**
     * The end of the specified unit.
     * Native name: tomAtEnd
     * @type {Integer (Int32)}
     */
    static AtEnd => 4096

    /**
     * No underlining.
     * Native name: tomNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Single underline.
     * Native name: tomSingle
     * @type {Integer (Int32)}
     */
    static Single => 1

    /**
     * Underline words only.
     * Native name: tomWords
     * @type {Integer (Int32)}
     */
    static Words => 2

    /**
     * Double underline.
     * Native name: tomDouble
     * @type {Integer (Int32)}
     */
    static Double => 3

    /**
     * Dotted underline.
     * Native name: tomDotted
     * @type {Integer (Int32)}
     */
    static Dotted => 4

    /**
     * Dash underline.
     * Native name: tomDash
     * @type {Integer (Int32)}
     */
    static Dash => 5

    /**
     * Dash dot underline.
     * Native name: tomDashDot
     * @type {Integer (Int32)}
     */
    static DashDot => 6

    /**
     * Dash dot dot underline.
     * Native name: tomDashDotDot
     * @type {Integer (Int32)}
     */
    static DashDotDot => 7

    /**
     * Wave underline.
     * Native name: tomWave
     * @type {Integer (Int32)}
     */
    static Wave => 8

    /**
     * Thick underline.
     * Native name: tomThick
     * @type {Integer (Int32)}
     */
    static Thick => 9

    /**
     * Hair underline.
     * Native name: tomHair
     * @type {Integer (Int32)}
     */
    static Hair => 10

    /**
     * Double wave underline.
     * Native name: tomDoubleWave
     * @type {Integer (Int32)}
     */
    static DoubleWave => 11

    /**
     * Heavy wave underline.
     * Native name: tomHeavyWave
     * @type {Integer (Int32)}
     */
    static HeavyWave => 12

    /**
     * Long dash underline.
     * Native name: tomLongDash
     * @type {Integer (Int32)}
     */
    static LongDash => 13

    /**
     * Thick dash underline.
     * Native name: tomThickDash
     * @type {Integer (Int32)}
     */
    static ThickDash => 14

    /**
     * Thick dash dot underline.
     * Native name: tomThickDashDot
     * @type {Integer (Int32)}
     */
    static ThickDashDot => 15

    /**
     * Thick dash dot dot underline.
     * Native name: tomThickDashDotDot
     * @type {Integer (Int32)}
     */
    static ThickDashDotDot => 16

    /**
     * Thick dotted underline.
     * Native name: tomThickDotted
     * @type {Integer (Int32)}
     */
    static ThickDotted => 17

    /**
     * Thick long dash underline.
     * Native name: tomThickLongDash
     * @type {Integer (Int32)}
     */
    static ThickLongDash => 18

    /**
     * Single space. The line-spacing value is ignored.
     * Native name: tomLineSpaceSingle
     * @type {Integer (Int32)}
     */
    static LineSpaceSingle => 0

    /**
     * One-and-a-half line spacing. The line-spacing value is ignored.
     * Native name: tomLineSpace1pt5
     * @type {Integer (Int32)}
     */
    static LineSpace1pt5 => 1

    /**
     * Double line spacing. The line-spacing value is ignored.
     * Native name: tomLineSpaceDouble
     * @type {Integer (Int32)}
     */
    static LineSpaceDouble => 2

    /**
     * The line-spacing value specifies the spacing from one line to the next. However, if the value is less than single spacing, text is single-spaced.
     * Native name: tomLineSpaceAtLeast
     * @type {Integer (Int32)}
     */
    static LineSpaceAtLeast => 3

    /**
     * The line-spacing value specifies the exact spacing from one line to the next, even if the value is less than single spacing.
     * Native name: tomLineSpaceExactly
     * @type {Integer (Int32)}
     */
    static LineSpaceExactly => 4

    /**
     * The line-spacing value specifies the line spacing, in lines.
     * Native name: tomLineSpaceMultiple
     * @type {Integer (Int32)}
     */
    static LineSpaceMultiple => 5

    /**
     * The line-spacing value specifies the line spacing by percent of line height.
     * Native name: tomLineSpacePercent
     * @type {Integer (Int32)}
     */
    static LineSpacePercent => 6

    /**
     * Text aligns with the left margin.
     * Native name: tomAlignLeft
     * @type {Integer (Int32)}
     */
    static AlignLeft => 0

    /**
     * Text is centered between the margins.
     * Native name: tomAlignCenter
     * @type {Integer (Int32)}
     */
    static AlignCenter => 1

    /**
     * Text aligns with the right margin.
     * Native name: tomAlignRight
     * @type {Integer (Int32)}
     */
    static AlignRight => 2

    /**
     * Text starts at the left margin and, if the line extends beyond the right margin, all the spaces in the line are adjusted to be even.
     * Native name: tomAlignJustify
     * @type {Integer (Int32)}
     */
    static AlignJustify => 3

    /**
     * The decimal point is set at the tab position. This is useful for aligning a column of decimal numbers.
     * Native name: tomAlignDecimal
     * @type {Integer (Int32)}
     */
    static AlignDecimal => 3

    /**
     * A vertical bar is positioned at the tab position. Text is not affected. Alignment bars on nearby lines at the same position form a continuous vertical line.
     * Native name: tomAlignBar
     * @type {Integer (Int32)}
     */
    static AlignBar => 4

    /**
     * Position at a default tab stop.
     * Native name: tomDefaultTab
     * @type {Integer (Int32)}
     */
    static DefaultTab => 5

    /**
     * Same as  <b>tomAlignJustify</b>.
     * Native name: tomAlignInterWord
     * @type {Integer (Int32)}
     */
    static AlignInterWord => 3

    /**
     * Same as <b>tomAlignInterLetter</b>, but uses East Asian metrics.
     * Native name: tomAlignNewspaper
     * @type {Integer (Int32)}
     */
    static AlignNewspaper => 4

    /**
     * The first and last characters of each line (except the last line) are aligned to the left and right margins, and lines are filled by adding or subtracting the same amount from each character.
     * Native name: tomAlignInterLetter
     * @type {Integer (Int32)}
     */
    static AlignInterLetter => 5

    /**
     * Same as <b>tomAlignInterLetter</b>, but uses East Asian metrics, and scales the spacing by the width of characters.
     * Native name: tomAlignScaled
     * @type {Integer (Int32)}
     */
    static AlignScaled => 6

    /**
     * Use spaces to fill the spaces taken by a tab character.
     * Native name: tomSpaces
     * @type {Integer (Int32)}
     */
    static Spaces => 0

    /**
     * Use dots to fill the spaces taken by a tab character.
     * Native name: tomDots
     * @type {Integer (Int32)}
     */
    static Dots => 1

    /**
     * Use dashes to fill the spaces taken by a tab character.
     * Native name: tomDashes
     * @type {Integer (Int32)}
     */
    static Dashes => 2

    /**
     * Use solid lines to fill the spaces taken by a tab character.
     * Native name: tomLines
     * @type {Integer (Int32)}
     */
    static Lines => 3

    /**
     * Use thick solid lines to fill the spaces taken by a tab character.
     * Native name: tomThickLines
     * @type {Integer (Int32)}
     */
    static ThickLines => 4

    /**
     * Use equal signs to fill the spaces taken by a tab character.
     * Native name: tomEquals
     * @type {Integer (Int32)}
     */
    static Equals => 5

    /**
     * The tab preceding the specified location.
     * Native name: tomTabBack
     * @type {Integer (Int32)}
     */
    static TabBack => -3

    /**
     * The next tab following the specified location.
     * Native name: tomTabNext
     * @type {Integer (Int32)}
     */
    static TabNext => -2

    /**
     * The tab at the specified location.
     * Native name: tomTabHere
     * @type {Integer (Int32)}
     */
    static TabHere => -1

    /**
     * Not a list paragraph.
     * Native name: tomListNone
     * @type {Integer (Int32)}
     */
    static ListNone => 0

    /**
     * List uses bullets (0x2022); other bullets are given by &gt; 32.
     * Native name: tomListBullet
     * @type {Integer (Int32)}
     */
    static ListBullet => 1

    /**
     * List is numbered with Arabic numerals (0, 1, 2, ...).
     * Native name: tomListNumberAsArabic
     * @type {Integer (Int32)}
     */
    static ListNumberAsArabic => 2

    /**
     * List is ordered with lowercase letters (a, b, c, ...).
     * Native name: tomListNumberAsLCLetter
     * @type {Integer (Int32)}
     */
    static ListNumberAsLCLetter => 3

    /**
     * List is ordered with uppercase Arabic letters (A, B, C, ...).
     * Native name: tomListNumberAsUCLetter
     * @type {Integer (Int32)}
     */
    static ListNumberAsUCLetter => 4

    /**
     * List is ordered with lowercase Roman letters (i, ii, iii, ...).
     * Native name: tomListNumberAsLCRoman
     * @type {Integer (Int32)}
     */
    static ListNumberAsLCRoman => 5

    /**
     * List is ordered with uppercase Roman letters (I, II, III, ...).
     * Native name: tomListNumberAsUCRoman
     * @type {Integer (Int32)}
     */
    static ListNumberAsUCRoman => 6

    /**
     * The value returned by <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara-getliststart">ITextPara::GetListStart</a> is treated as the first code in a Unicode sequence.
     * Native name: tomListNumberAsSequence
     * @type {Integer (Int32)}
     */
    static ListNumberAsSequence => 7

    /**
     * List is ordered with Unicode circled numbers 
     * 
     * <img alt="Unicode numbers in a circle." src="images/unicodecirclednumbers.png"/>
     * Native name: tomListNumberedCircle
     * @type {Integer (Int32)}
     */
    static ListNumberedCircle => 8

    /**
     * List is ordered with Wingdings black circled digits 
     * 
     * <img alt="Circled black digits." src="images/wingdingblackcircleddigits.png"/>
     * Native name: tomListNumberedBlackCircleWingding
     * @type {Integer (Int32)}
     */
    static ListNumberedBlackCircleWingding => 9

    /**
     * List is ordered with Wingdings white circled digits:
     * 
     * <img alt="White digits in a black circle." src="images/wingdingwhitecircleddigits.png"/>
     * Native name: tomListNumberedWhiteCircleWingding
     * @type {Integer (Int32)}
     */
    static ListNumberedWhiteCircleWingding => 10

    /**
     * Full-width ASCII (０, １, ２, ３, …).
     * Native name: tomListNumberedArabicWide
     * @type {Integer (Int32)}
     */
    static ListNumberedArabicWide => 11

    /**
     * Chinese with 十 only in items 10 through 99 (一, 二, 三, 四…).
     * Native name: tomListNumberedChS
     * @type {Integer (Int32)}
     */
    static ListNumberedChS => 12

    /**
     * Chinese with 十 only in items 10 through 19.
     * Native name: tomListNumberedChT
     * @type {Integer (Int32)}
     */
    static ListNumberedChT => 13

    /**
     * Chinese with a full-width period, no 十.
     * Native name: tomListNumberedJpnChS
     * @type {Integer (Int32)}
     */
    static ListNumberedJpnChS => 14

    /**
     * Chinese with no 十.
     * Native name: tomListNumberedJpnKor
     * @type {Integer (Int32)}
     */
    static ListNumberedJpnKor => 15

    /**
     * Arabic alphabetic ( أ ,ب ,ت ,ث ,…).
     * Native name: tomListNumberedArabic1
     * @type {Integer (Int32)}
     */
    static ListNumberedArabic1 => 16

    /**
     * Arabic abjadi ( أ ,ب ,ج ,د ,…).
     * Native name: tomListNumberedArabic2
     * @type {Integer (Int32)}
     */
    static ListNumberedArabic2 => 17

    /**
     * Hebrew alphabet (א, ב, ג, ד, …).
     * Native name: tomListNumberedHebrew
     * @type {Integer (Int32)}
     */
    static ListNumberedHebrew => 18

    /**
     * Thai alphabetic (ก, ข,ค, ง, …).
     * Native name: tomListNumberedThaiAlpha
     * @type {Integer (Int32)}
     */
    static ListNumberedThaiAlpha => 19

    /**
     * Thai numbers (๑, ๒,๓, ๔…).
     * Native name: tomListNumberedThaiNum
     * @type {Integer (Int32)}
     */
    static ListNumberedThaiNum => 20

    /**
     * Hindi vowels (अ, आ, इ, ई, …).
     * Native name: tomListNumberedHindiAlpha
     * @type {Integer (Int32)}
     */
    static ListNumberedHindiAlpha => 21

    /**
     * Hindi consonants (क, ख, ग, घ, …).
     * Native name: tomListNumberedHindiAlpha1
     * @type {Integer (Int32)}
     */
    static ListNumberedHindiAlpha1 => 22

    /**
     * Hindi numbers (१, २, ३, ४, …).
     * Native name: tomListNumberedHindiNum
     * @type {Integer (Int32)}
     */
    static ListNumberedHindiNum => 23

    /**
     * Encloses the number in parentheses, as in: (1).
     * Native name: tomListParentheses
     * @type {Integer (Int32)}
     */
    static ListParentheses => 65536

    /**
     * Follows the number with a period.
     * Native name: tomListPeriod
     * @type {Integer (Int32)}
     */
    static ListPeriod => 131072

    /**
     * Uses the number alone.
     * Native name: tomListPlain
     * @type {Integer (Int32)}
     */
    static ListPlain => 196608

    /**
     * Uses no numbers.
     * Native name: tomListNoNumber
     * @type {Integer (Int32)}
     */
    static ListNoNumber => 262144

    /**
     * Follows the number with a hyphen (-).
     * Native name: tomListMinus
     * @type {Integer (Int32)}
     */
    static ListMinus => 524288

    /**
     * Suppress the numbering style for list items.
     * Native name: tomIgnoreNumberStyle
     * @type {Integer (Int32)}
     */
    static IgnoreNumberStyle => 16777216

    /**
     * The normal paragraph style.
     * Native name: tomParaStyleNormal
     * @type {Integer (Int32)}
     */
    static ParaStyleNormal => -1

    /**
     * The style for level 1 paragraph headings.
     * Native name: tomParaStyleHeading1
     * @type {Integer (Int32)}
     */
    static ParaStyleHeading1 => -2

    /**
     * The style for level 2 paragraph headings.
     * Native name: tomParaStyleHeading2
     * @type {Integer (Int32)}
     */
    static ParaStyleHeading2 => -3

    /**
     * The style for level 3 paragraph headings.
     * Native name: tomParaStyleHeading3
     * @type {Integer (Int32)}
     */
    static ParaStyleHeading3 => -4

    /**
     * The style for level 4 paragraph headings.
     * Native name: tomParaStyleHeading4
     * @type {Integer (Int32)}
     */
    static ParaStyleHeading4 => -5

    /**
     * The style for level 5 paragraph headings.
     * Native name: tomParaStyleHeading5
     * @type {Integer (Int32)}
     */
    static ParaStyleHeading5 => -6

    /**
     * The style for level 6 paragraph headings.
     * Native name: tomParaStyleHeading6
     * @type {Integer (Int32)}
     */
    static ParaStyleHeading6 => -7

    /**
     * The style for level 7 paragraph headings.
     * Native name: tomParaStyleHeading7
     * @type {Integer (Int32)}
     */
    static ParaStyleHeading7 => -8

    /**
     * The style for level 8 paragraph headings.
     * Native name: tomParaStyleHeading8
     * @type {Integer (Int32)}
     */
    static ParaStyleHeading8 => -9

    /**
     * The style for level 9 paragraph headings.
     * Native name: tomParaStyleHeading9
     * @type {Integer (Int32)}
     */
    static ParaStyleHeading9 => -10

    /**
     * The unit is a single character.
     * Native name: tomCharacter
     * @type {Integer (Int32)}
     */
    static Character => 1

    /**
     * The unit is a word.
     * Native name: tomWord
     * @type {Integer (Int32)}
     */
    static Word => 2

    /**
     * The unit is a sentence.
     * Native name: tomSentence
     * @type {Integer (Int32)}
     */
    static Sentence => 3

    /**
     * The unit is a paragraph.
     * Native name: tomParagraph
     * @type {Integer (Int32)}
     */
    static Paragraph => 4

    /**
     * The unit is a line.
     * Native name: tomLine
     * @type {Integer (Int32)}
     */
    static Line => 5

    /**
     * The unit is a story; that is, a contiguous range of text that represent a part of a document, such as the main text of the document, headers and footers, footnotes, annotations, and so on.
     * Native name: tomStory
     * @type {Integer (Int32)}
     */
    static Story => 6

    /**
     * The unit is a screenful.
     * Native name: tomScreen
     * @type {Integer (Int32)}
     */
    static Screen => 7

    /**
     * The unit is a section.
     * Native name: tomSection
     * @type {Integer (Int32)}
     */
    static Section => 8

    /**
     * The unit is a table column.
     * Native name: tomTableColumn
     * @type {Integer (Int32)}
     */
    static TableColumn => 9

    /**
     * The unit is a text column.
     * Native name: tomColumn
     * @type {Integer (Int32)}
     */
    static Column => 9

    /**
     * The unit is a table row
     * Native name: tomRow
     * @type {Integer (Int32)}
     */
    static Row => 10

    /**
     * The unit is a window.
     * Native name: tomWindow
     * @type {Integer (Int32)}
     */
    static Window => 11

    /**
     * The unit is a spreadsheet cell.
     * Native name: tomCell
     * @type {Integer (Int32)}
     */
    static Cell => 12

    /**
     * The unit is a run of constant character formatting.
     * Native name: tomCharFormat
     * @type {Integer (Int32)}
     */
    static CharFormat => 13

    /**
     * The unit is a run of constant paragraph formatting.
     * Native name: tomParaFormat
     * @type {Integer (Int32)}
     */
    static ParaFormat => 14

    /**
     * The unit is a table.
     * Native name: tomTable
     * @type {Integer (Int32)}
     */
    static Table => 15

    /**
     * The unit is an embedded object.
     * Native name: tomObject
     * @type {Integer (Int32)}
     */
    static Object => 16

    /**
     * The unit is a page.
     * Native name: tomPage
     * @type {Integer (Int32)}
     */
    static Page => 17

    /**
     * The unit is a hard paragraph.
     * Native name: tomHardParagraph
     * @type {Integer (Int32)}
     */
    static HardParagraph => 18

    /**
     * The unit is a cluster of characters.
     * Native name: tomCluster
     * @type {Integer (Int32)}
     */
    static Cluster => 19

    /**
     * The unit is an inline object.
     * Native name: tomInlineObject
     * @type {Integer (Int32)}
     */
    static InlineObject => 20

    /**
     * The unit is an inline object argument.
     * Native name: tomInlineObjectArg
     * @type {Integer (Int32)}
     */
    static InlineObjectArg => 21

    /**
     * The unit is a leaf-level line.
     * Native name: tomLeafLine
     * @type {Integer (Int32)}
     */
    static LeafLine => 22

    /**
     * A layout column.
     * Native name: tomLayoutColumn
     * @type {Integer (Int32)}
     */
    static LayoutColumn => 23

    /**
     * The identifier of the current process.
     * Native name: tomProcessId
     * @type {Integer (Int32)}
     */
    static ProcessId => 1073741825

    /**
     * Match on whole words when doing a text search.
     * Native name: tomMatchWord
     * @type {Integer (Int32)}
     */
    static MatchWord => 2

    /**
     * A case-sensitive a text search.
     * Native name: tomMatchCase
     * @type {Integer (Int32)}
     */
    static MatchCase => 4

    /**
     * Match regular expressions when doing a text search.
     * Native name: tomMatchPattern
     * @type {Integer (Int32)}
     */
    static MatchPattern => 8

    /**
     * No special type.
     * Native name: tomUnknownStory
     * @type {Integer (Int32)}
     */
    static UnknownStory => 0

    /**
     * The main story always exists for a rich edit control.
     * Native name: tomMainTextStory
     * @type {Integer (Int32)}
     */
    static MainTextStory => 1

    /**
     * The story used for footnotes.
     * Native name: tomFootnotesStory
     * @type {Integer (Int32)}
     */
    static FootnotesStory => 2

    /**
     * The story used for endnotes.
     * Native name: tomEndnotesStory
     * @type {Integer (Int32)}
     */
    static EndnotesStory => 3

    /**
     * The story used for comments.
     * Native name: tomCommentsStory
     * @type {Integer (Int32)}
     */
    static CommentsStory => 4

    /**
     * The story used for a text box.
     * Native name: tomTextFrameStory
     * @type {Integer (Int32)}
     */
    static TextFrameStory => 5

    /**
     * The story containing headers for even pages.
     * Native name: tomEvenPagesHeaderStory
     * @type {Integer (Int32)}
     */
    static EvenPagesHeaderStory => 6

    /**
     * The story containing headers for odd pages.
     * Native name: tomPrimaryHeaderStory
     * @type {Integer (Int32)}
     */
    static PrimaryHeaderStory => 7

    /**
     * The story containing footers for even pages.
     * Native name: tomEvenPagesFooterStory
     * @type {Integer (Int32)}
     */
    static EvenPagesFooterStory => 8

    /**
     * The story containing footers for odd pages.
     * Native name: tomPrimaryFooterStory
     * @type {Integer (Int32)}
     */
    static PrimaryFooterStory => 9

    /**
     * The story containing the header for the first page.
     * Native name: tomFirstPageHeaderStory
     * @type {Integer (Int32)}
     */
    static FirstPageHeaderStory => 10

    /**
     * The story containing the footer for the first page.
     * Native name: tomFirstPageFooterStory
     * @type {Integer (Int32)}
     */
    static FirstPageFooterStory => 11

    /**
     * The scratch story.
     * Native name: tomScratchStory
     * @type {Integer (Int32)}
     */
    static ScratchStory => 127

    /**
     * The story used for a Find dialog.
     * Native name: tomFindStory
     * @type {Integer (Int32)}
     */
    static FindStory => 128

    /**
     * The story used for a Replace dialog.
     * Native name: tomReplaceStory
     * @type {Integer (Int32)}
     */
    static ReplaceStory => 129

    /**
     * Story is inactive.
     * Native name: tomStoryInactive
     * @type {Integer (Int32)}
     */
    static StoryInactive => 0

    /**
     * Story has display, but no UI.
     * Native name: tomStoryActiveDisplay
     * @type {Integer (Int32)}
     */
    static StoryActiveDisplay => 1

    /**
     * Story is UI active; that is, it receives keyboard and mouse input.
     * Native name: tomStoryActiveUI
     * @type {Integer (Int32)}
     */
    static StoryActiveUI => 2

    /**
     * Story has display and UI activity.
     * Native name: tomStoryActiveDisplayUI
     * @type {Integer (Int32)}
     */
    static StoryActiveDisplayUI => 3

    /**
     * Do not apply text animation.
     * Native name: tomNoAnimation
     * @type {Integer (Int32)}
     */
    static NoAnimation => 0

    /**
     * Text is bordered by marquee lights that blink between the colors red, yellow, green, and blue.
     * Native name: tomLasVegasLights
     * @type {Integer (Int32)}
     */
    static LasVegasLights => 1

    /**
     * Text has a black background that blinks on and off.
     * Native name: tomBlinkingBackground
     * @type {Integer (Int32)}
     */
    static BlinkingBackground => 2

    /**
     * Text is overlaid with multicolored stars that blink on and off at regular intervals
     * Native name: tomSparkleText
     * @type {Integer (Int32)}
     */
    static SparkleText => 3

    /**
     * Text is surrounded by a black dashed-line border. The border is animated so that the individual dashes appear to move clockwise around the text.
     * Native name: tomMarchingBlackAnts
     * @type {Integer (Int32)}
     */
    static MarchingBlackAnts => 4

    /**
     * Text is surrounded by a red dashed-line border that is animated to appear to move clockwise around the text.
     * Native name: tomMarchingRedAnts
     * @type {Integer (Int32)}
     */
    static MarchingRedAnts => 5

    /**
     * Text is alternately blurred and unblurred at regular intervals, to give the appearance of shimmering.
     * Native name: tomShimmer
     * @type {Integer (Int32)}
     */
    static Shimmer => 6

    /**
     * Text appears gradually from the top down.
     * Native name: tomWipeDown
     * @type {Integer (Int32)}
     */
    static WipeDown => 7

    /**
     * Text appears gradually from the bottom up.
     * Native name: tomWipeRight
     * @type {Integer (Int32)}
     */
    static WipeRight => 8

    /**
     * Defines the maximum animation flag value.
     * Native name: tomAnimationMax
     * @type {Integer (Int32)}
     */
    static AnimationMax => 8

    /**
     * Set text to lowercase.
     * Native name: tomLowerCase
     * @type {Integer (Int32)}
     */
    static LowerCase => 0

    /**
     * Set text to uppercase.
     * Native name: tomUpperCase
     * @type {Integer (Int32)}
     */
    static UpperCase => 1

    /**
     * Capitalize the first letter of each word.
     * Native name: tomTitleCase
     * @type {Integer (Int32)}
     */
    static TitleCase => 2

    /**
     * Capitalize the first letter of each sentence.
     * Native name: tomSentenceCase
     * @type {Integer (Int32)}
     */
    static SentenceCase => 4

    /**
     * Toggle the case of each letter.
     * Native name: tomToggleCase
     * @type {Integer (Int32)}
     */
    static ToggleCase => 5

    /**
     * Read only.
     * Native name: tomReadOnly
     * @type {Integer (Int32)}
     */
    static ReadOnly => 256

    /**
     * Other programs cannot read.
     * Native name: tomShareDenyRead
     * @type {Integer (Int32)}
     */
    static ShareDenyRead => 512

    /**
     * Other programs cannot write.
     * Native name: tomShareDenyWrite
     * @type {Integer (Int32)}
     */
    static ShareDenyWrite => 1024

    /**
     * Replace the selection with a file.
     * Native name: tomPasteFile
     * @type {Integer (Int32)}
     */
    static PasteFile => 4096

    /**
     * Create a new file. Fail if the file already exists.
     * Native name: tomCreateNew
     * @type {Integer (Int32)}
     */
    static CreateNew => 16

    /**
     * Create a new file. Destroy the existing file if it exists.
     * Native name: tomCreateAlways
     * @type {Integer (Int32)}
     */
    static CreateAlways => 32

    /**
     * Open an existing file. Fail if the file does not exist.
     * Native name: tomOpenExisting
     * @type {Integer (Int32)}
     */
    static OpenExisting => 48

    /**
     * Open an existing file. Create a new file if the file does not exist.
     * Native name: tomOpenAlways
     * @type {Integer (Int32)}
     */
    static OpenAlways => 64

    /**
     * Open an existing file, but truncate it to zero length.
     * Native name: tomTruncateExisting
     * @type {Integer (Int32)}
     */
    static TruncateExisting => 80

    /**
     * Open as  RTF.
     * @type {Integer (Int32)}
     */
    static tomRTF => 1

    /**
     * Open as text ANSI or Unicode.
     * Native name: tomText
     * @type {Integer (Int32)}
     */
    static Text => 2

    /**
     * Open as HTML.
     * @type {Integer (Int32)}
     */
    static tomHTML => 3

    /**
     * Open as Word document.
     * Native name: tomWordDocument
     * @type {Integer (Int32)}
     */
    static WordDocument => 4

    /**
     * Boldface.
     * Native name: tomBold
     * @type {Integer (Int32)}
     */
    static Bold => -2147483647

    /**
     * Italic.
     * Native name: tomItalic
     * @type {Integer (Int32)}
     */
    static Italic => -2147483646

    /**
     * Underline.
     * Native name: tomUnderline
     * @type {Integer (Int32)}
     */
    static Underline => -2147483644

    /**
     * Strikeout.
     * Native name: tomStrikeout
     * @type {Integer (Int32)}
     */
    static Strikeout => -2147483640

    /**
     * Protected.
     * Native name: tomProtected
     * @type {Integer (Int32)}
     */
    static Protected => -2147483632

    /**
     * Hyperlink.
     * Native name: tomLink
     * @type {Integer (Int32)}
     */
    static Link => -2147483616

    /**
     * Small caps.
     * Native name: tomSmallCaps
     * @type {Integer (Int32)}
     */
    static SmallCaps => -2147483584

    /**
     * All caps.
     * Native name: tomAllCaps
     * @type {Integer (Int32)}
     */
    static AllCaps => -2147483520

    /**
     * Hidden.
     * Native name: tomHidden
     * @type {Integer (Int32)}
     */
    static Hidden => -2147483392

    /**
     * Outline.
     * Native name: tomOutline
     * @type {Integer (Int32)}
     */
    static Outline => -2147483136

    /**
     * Shadow.
     * Native name: tomShadow
     * @type {Integer (Int32)}
     */
    static Shadow => -2147482624

    /**
     * Emboss.
     * Native name: tomEmboss
     * @type {Integer (Int32)}
     */
    static Emboss => -2147481600

    /**
     * Imprint.
     * Native name: tomImprint
     * @type {Integer (Int32)}
     */
    static Imprint => -2147479552

    /**
     * Disabled.
     * Native name: tomDisabled
     * @type {Integer (Int32)}
     */
    static Disabled => -2147475456

    /**
     * Revised.
     * Native name: tomRevised
     * @type {Integer (Int32)}
     */
    static Revised => -2147467264

    /**
     * Subscript character format.
     * Native name: tomSubscriptCF
     * @type {Integer (Int32)}
     */
    static SubscriptCF => -2147418112

    /**
     * Superscript character format.
     * Native name: tomSuperscriptCF
     * @type {Integer (Int32)}
     */
    static SuperscriptCF => -2147352576

    /**
     * Font bound (uses font binding).
     * Native name: tomFontBound
     * @type {Integer (Int32)}
     */
    static FontBound => -2146435072

    /**
     * The link is protected (friendly name link).
     * Native name: tomLinkProtected
     * @type {Integer (Int32)}
     */
    static LinkProtected => -2139095040

    /**
     * The start delimiter of an inline object.
     * Native name: tomInlineObjectStart
     * @type {Integer (Int32)}
     */
    static InlineObjectStart => -2130706432

    /**
     * The characters are less common members of a script. A font that supports a script should check if it has glyphs for such characters.
     * Native name: tomExtendedChar
     * @type {Integer (Int32)}
     */
    static ExtendedChar => -2113929216

    /**
     * Use system back color.
     * Native name: tomAutoBackColor
     * @type {Integer (Int32)}
     */
    static AutoBackColor => -2080374784

    /**
     * Don't build up operator.
     * Native name: tomMathZoneNoBuildUp
     * @type {Integer (Int32)}
     */
    static MathZoneNoBuildUp => -2013265920

    /**
     * Math zone.
     * Native name: tomMathZone
     * @type {Integer (Int32)}
     */
    static MathZone => -1879048192

    /**
     * Math zone ordinary text.
     * Native name: tomMathZoneOrdinary
     * @type {Integer (Int32)}
     */
    static MathZoneOrdinary => -1610612736

    /**
     * Use system text color.
     * Native name: tomAutoTextColor
     * @type {Integer (Int32)}
     */
    static AutoTextColor => -1073741824

    /**
     * Display math zone.
     * Native name: tomMathZoneDisplay
     * @type {Integer (Int32)}
     */
    static MathZoneDisplay => 262144

    /**
     * Right-to-left paragraph
     * Native name: tomParaEffectRTL
     * @type {Integer (Int32)}
     */
    static ParaEffectRTL => 1

    /**
     * Keep the paragraph together.
     * Native name: tomParaEffectKeep
     * @type {Integer (Int32)}
     */
    static ParaEffectKeep => 2

    /**
     * Keep with next the paragraph.
     * Native name: tomParaEffectKeepNext
     * @type {Integer (Int32)}
     */
    static ParaEffectKeepNext => 4

    /**
     * Put a page break before this paragraph.
     * Native name: tomParaEffectPageBreakBefore
     * @type {Integer (Int32)}
     */
    static ParaEffectPageBreakBefore => 8

    /**
     * No line number for this paragraph.
     * Native name: tomParaEffectNoLineNumber
     * @type {Integer (Int32)}
     */
    static ParaEffectNoLineNumber => 16

    /**
     * No widow control.
     * Native name: tomParaEffectNoWidowControl
     * @type {Integer (Int32)}
     */
    static ParaEffectNoWidowControl => 32

    /**
     * Don't hyphenate this paragraph.
     * Native name: tomParaEffectDoNotHyphen
     * @type {Integer (Int32)}
     */
    static ParaEffectDoNotHyphen => 64

    /**
     * Side by side.
     * Native name: tomParaEffectSideBySide
     * @type {Integer (Int32)}
     */
    static ParaEffectSideBySide => 128

    /**
     * Heading contents are collapsed (in outline view).
     * Native name: tomParaEffectCollapsed
     * @type {Integer (Int32)}
     */
    static ParaEffectCollapsed => 256

    /**
     * Outline view nested level.
     * Native name: tomParaEffectOutlineLevel
     * @type {Integer (Int32)}
     */
    static ParaEffectOutlineLevel => 512

    /**
     * Paragraph has boxed effect (is not displayed).
     * Native name: tomParaEffectBox
     * @type {Integer (Int32)}
     */
    static ParaEffectBox => 1024

    /**
     * At or inside table delimiter.
     * Native name: tomParaEffectTableRowDelimiter
     * @type {Integer (Int32)}
     */
    static ParaEffectTableRowDelimiter => 4096

    /**
     * Inside or at the start of a table.
     * Native name: tomParaEffectTable
     * @type {Integer (Int32)}
     */
    static ParaEffectTable => 16384

    /**
     * Use East Asian character-pair-width modification.
     * Native name: tomModWidthPairs
     * @type {Integer (Int32)}
     */
    static ModWidthPairs => 1

    /**
     * Use East Asian space-width modification.
     * Native name: tomModWidthSpace
     * @type {Integer (Int32)}
     */
    static ModWidthSpace => 2

    /**
     * Use East Asian auto spacing between alphabetics.
     * Native name: tomAutoSpaceAlpha
     * @type {Integer (Int32)}
     */
    static AutoSpaceAlpha => 4

    /**
     * Use East Asian auto spacing for digits.
     * Native name: tomAutoSpaceNumeric
     * @type {Integer (Int32)}
     */
    static AutoSpaceNumeric => 8

    /**
     * Use East Asian automatic spacing for parentheses or brackets.
     * Native name: tomAutoSpaceParens
     * @type {Integer (Int32)}
     */
    static AutoSpaceParens => 16

    /**
     * Embedded font (CLIP_EMBEDDED).
     * Native name: tomEmbeddedFont
     * @type {Integer (Int32)}
     */
    static EmbeddedFont => 32

    /**
     * Double strikeout.
     * Native name: tomDoublestrike
     * @type {Integer (Int32)}
     */
    static Doublestrike => 64

    /**
     * Run has overlapping text.
     * Native name: tomOverlapping
     * @type {Integer (Int32)}
     */
    static Overlapping => 128

    /**
     * Normal caret.
     * Native name: tomNormalCaret
     * @type {Integer (Int32)}
     */
    static NormalCaret => 0

    /**
     * The Korean block caret.
     * Native name: tomKoreanBlockCaret
     * @type {Integer (Int32)}
     */
    static KoreanBlockCaret => 1

    /**
     * NULL caret (caret suppressed).
     * Native name: tomNullCaret
     * @type {Integer (Int32)}
     */
    static NullCaret => 2

    /**
     * Add left/top insets to the client rectangle, and subtract right/bottom insets from the client rectangle.
     * Native name: tomIncludeInset
     * @type {Integer (Int32)}
     */
    static IncludeInset => 1

    /**
     * Use the Unicode bidirectional (bidi) algorithm.
     * Native name: tomUnicodeBiDi
     * @type {Integer (Int32)}
     */
    static UnicodeBiDi => 1

    /**
     * Check math-zone character formatting.
     * Native name: tomMathCFCheck
     * @type {Integer (Int32)}
     */
    static MathCFCheck => 4

    /**
     * Don't include text as part of a hyperlink.
     * Native name: tomUnlink
     * @type {Integer (Int32)}
     */
    static Unlink => 8

    /**
     * Don't insert as hidden text.
     * Native name: tomUnhide
     * @type {Integer (Int32)}
     */
    static Unhide => 16

    /**
     * Obey the current text limit instead of increasing the text to fit.
     * Native name: tomCheckTextLimit
     * @type {Integer (Int32)}
     */
    static CheckTextLimit => 32

    /**
     * Ignore the font that is active at a particular character position.
     * Native name: tomIgnoreCurrentFont
     * @type {Integer (Int32)}
     */
    static IgnoreCurrentFont => 0

    /**
     * Match the current character repertoire.
     * Native name: tomMatchCharRep
     * @type {Integer (Int32)}
     */
    static MatchCharRep => 1

    /**
     * Match the current font signature.
     * Native name: tomMatchFontSignature
     * @type {Integer (Int32)}
     */
    static MatchFontSignature => 2

    /**
     * Use the current font if its character repertoire is <b>tomAnsi</b>.
     * Native name: tomMatchAscii
     * @type {Integer (Int32)}
     */
    static MatchAscii => 4

    /**
     * Gets the height.
     * Native name: tomGetHeightOnly
     * @type {Integer (Int32)}
     */
    static GetHeightOnly => 8

    /**
     * Match a math font.
     * Native name: tomMatchMathFont
     * @type {Integer (Int32)}
     */
    static MatchMathFont => 16

    /**
     * Set the character repertoire based on the specified character set.
     * Native name: tomCharset
     * @type {Integer (Int32)}
     */
    static Charset => -2147483648

    /**
     * Set the character repertoire based on the specified LCID.
     * Native name: tomCharRepFromLcid
     * @type {Integer (Int32)}
     */
    static CharRepFromLcid => 1073741824

    /**
     * Latin 1
     * Native name: tomAnsi
     * @type {Integer (Int32)}
     */
    static Ansi => 0

    /**
     * From Latin 1 and 2
     * Native name: tomEastEurope
     * @type {Integer (Int32)}
     */
    static EastEurope => 1

    /**
     * Cyrillic
     * Native name: tomCyrillic
     * @type {Integer (Int32)}
     */
    static Cyrillic => 2

    /**
     * Greek
     * Native name: tomGreek
     * @type {Integer (Int32)}
     */
    static Greek => 3

    /**
     * Turkish (Latin 1 + dotless i, ...)
     * Native name: tomTurkish
     * @type {Integer (Int32)}
     */
    static Turkish => 4

    /**
     * Hebrew
     * Native name: tomHebrew
     * @type {Integer (Int32)}
     */
    static Hebrew => 5

    /**
     * Arabic
     * Native name: tomArabic
     * @type {Integer (Int32)}
     */
    static Arabic => 6

    /**
     * From Latin 1 and 2
     * Native name: tomBaltic
     * @type {Integer (Int32)}
     */
    static Baltic => 7

    /**
     * Latin 1 with some combining marks
     * Native name: tomVietnamese
     * @type {Integer (Int32)}
     */
    static Vietnamese => 8

    /**
     * Default character repertoire
     * Native name: tomDefaultCharRep
     * @type {Integer (Int32)}
     */
    static DefaultCharRep => 9

    /**
     * Symbol character set (not Unicode)
     * Native name: tomSymbol
     * @type {Integer (Int32)}
     */
    static Symbol => 10

    /**
     * Thai
     * Native name: tomThai
     * @type {Integer (Int32)}
     */
    static Thai => 11

    /**
     * Japanese
     * Native name: tomShiftJIS
     * @type {Integer (Int32)}
     */
    static ShiftJIS => 12

    /**
     * Simplified Chinese
     * @type {Integer (Int32)}
     */
    static tomGB2312 => 13

    /**
     * Hangul
     * Native name: tomHangul
     * @type {Integer (Int32)}
     */
    static Hangul => 14

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
     * Native name: tomMac
     * @type {Integer (Int32)}
     */
    static Mac => 18

    /**
     * Armenian
     * Native name: tomArmenian
     * @type {Integer (Int32)}
     */
    static Armenian => 19

    /**
     * Syriac
     * Native name: tomSyriac
     * @type {Integer (Int32)}
     */
    static Syriac => 20

    /**
     * Thaana
     * Native name: tomThaana
     * @type {Integer (Int32)}
     */
    static Thaana => 21

    /**
     * Devanagari
     * Native name: tomDevanagari
     * @type {Integer (Int32)}
     */
    static Devanagari => 22

    /**
     * Bangla (formerly Bengali)
     * Native name: tomBengali
     * @type {Integer (Int32)}
     */
    static Bengali => 23

    /**
     * Gurmukhi
     * Native name: tomGurmukhi
     * @type {Integer (Int32)}
     */
    static Gurmukhi => 24

    /**
     * Gujarati
     * Native name: tomGujarati
     * @type {Integer (Int32)}
     */
    static Gujarati => 25

    /**
     * Odia (formerly Oriya)
     * Native name: tomOriya
     * @type {Integer (Int32)}
     */
    static Oriya => 26

    /**
     * Tamil
     * Native name: tomTamil
     * @type {Integer (Int32)}
     */
    static Tamil => 27

    /**
     * Telugu
     * Native name: tomTelugu
     * @type {Integer (Int32)}
     */
    static Telugu => 28

    /**
     * Kannada
     * Native name: tomKannada
     * @type {Integer (Int32)}
     */
    static Kannada => 29

    /**
     * Malayalam
     * Native name: tomMalayalam
     * @type {Integer (Int32)}
     */
    static Malayalam => 30

    /**
     * Sinhala
     * Native name: tomSinhala
     * @type {Integer (Int32)}
     */
    static Sinhala => 31

    /**
     * Lao
     * Native name: tomLao
     * @type {Integer (Int32)}
     */
    static Lao => 32

    /**
     * Tibetan
     * Native name: tomTibetan
     * @type {Integer (Int32)}
     */
    static Tibetan => 33

    /**
     * Myanmar
     * Native name: tomMyanmar
     * @type {Integer (Int32)}
     */
    static Myanmar => 34

    /**
     * Georgian
     * Native name: tomGeorgian
     * @type {Integer (Int32)}
     */
    static Georgian => 35

    /**
     * Jamo
     * Native name: tomJamo
     * @type {Integer (Int32)}
     */
    static Jamo => 36

    /**
     * Ethiopic
     * Native name: tomEthiopic
     * @type {Integer (Int32)}
     */
    static Ethiopic => 37

    /**
     * Cherokee
     * Native name: tomCherokee
     * @type {Integer (Int32)}
     */
    static Cherokee => 38

    /**
     * Aboriginal
     * Native name: tomAboriginal
     * @type {Integer (Int32)}
     */
    static Aboriginal => 39

    /**
     * Ogham
     * Native name: tomOgham
     * @type {Integer (Int32)}
     */
    static Ogham => 40

    /**
     * Runic
     * Native name: tomRunic
     * @type {Integer (Int32)}
     */
    static Runic => 41

    /**
     * Khmer
     * Native name: tomKhmer
     * @type {Integer (Int32)}
     */
    static Khmer => 42

    /**
     * Mongolian
     * Native name: tomMongolian
     * @type {Integer (Int32)}
     */
    static Mongolian => 43

    /**
     * Braille
     * Native name: tomBraille
     * @type {Integer (Int32)}
     */
    static Braille => 44

    /**
     * Yi
     * Native name: tomYi
     * @type {Integer (Int32)}
     */
    static Yi => 45

    /**
     * Limbu
     * Native name: tomLimbu
     * @type {Integer (Int32)}
     */
    static Limbu => 46

    /**
     * TaiLe
     * Native name: tomTaiLe
     * @type {Integer (Int32)}
     */
    static TaiLe => 47

    /**
     * TaiLue
     * Native name: tomNewTaiLue
     * @type {Integer (Int32)}
     */
    static NewTaiLue => 48

    /**
     * Syloti Nagri
     * Native name: tomSylotiNagri
     * @type {Integer (Int32)}
     */
    static SylotiNagri => 49

    /**
     * Kharoshthi
     * Native name: tomKharoshthi
     * @type {Integer (Int32)}
     */
    static Kharoshthi => 50

    /**
     * Kayah Li
     * Native name: tomKayahli
     * @type {Integer (Int32)}
     */
    static Kayahli => 51

    /**
     * Unicode symbol
     * Native name: tomUsymbol
     * @type {Integer (Int32)}
     */
    static Usymbol => 52

    /**
     * Emoji
     * Native name: tomEmoji
     * @type {Integer (Int32)}
     */
    static Emoji => 53

    /**
     * Glagolitic
     * Native name: tomGlagolitic
     * @type {Integer (Int32)}
     */
    static Glagolitic => 54

    /**
     * Lisu
     * Native name: tomLisu
     * @type {Integer (Int32)}
     */
    static Lisu => 55

    /**
     * Vai
     * Native name: tomVai
     * @type {Integer (Int32)}
     */
    static Vai => 56

    /**
     * N'Ko
     * @type {Integer (Int32)}
     */
    static tomNKo => 57

    /**
     * Osmanya
     * Native name: tomOsmanya
     * @type {Integer (Int32)}
     */
    static Osmanya => 58

    /**
     * Phags-pa
     * Native name: tomPhagsPa
     * @type {Integer (Int32)}
     */
    static PhagsPa => 59

    /**
     * Gothic
     * Native name: tomGothic
     * @type {Integer (Int32)}
     */
    static Gothic => 60

    /**
     * Deseret
     * Native name: tomDeseret
     * @type {Integer (Int32)}
     */
    static Deseret => 61

    /**
     * Tifinagh
     * Native name: tomTifinagh
     * @type {Integer (Int32)}
     */
    static Tifinagh => 62

    /**
     * The maximum character repertoire flag value.
     * Native name: tomCharRepMax
     * @type {Integer (Int32)}
     */
    static CharRepMax => 63

    /**
     * Use Microsoft Rich Edit 1.0 mode.
     * @type {Integer (Int32)}
     */
    static tomRE10Mode => 1

    /**
     * Use a font with a name that starts with @,  for CJK vertical text. When rendered vertically, the characters in such a font are rotated 90 degrees so that they look upright instead of sideways.
     * Native name: tomUseAtFont
     * @type {Integer (Int32)}
     */
    static UseAtFont => 2

    /**
     * Mask for the following four text orientations.
     * Native name: tomTextFlowMask
     * @type {Integer (Int32)}
     */
    static TextFlowMask => 12

    /**
     * Ordinary left-to-right horizontal text.
     * Native name: tomTextFlowES
     * @type {Integer (Int32)}
     */
    static TextFlowES => 0

    /**
     * Ordinary East Asian vertical text.
     * Native name: tomTextFlowSW
     * @type {Integer (Int32)}
     */
    static TextFlowSW => 4

    /**
     * Alternative orientation.
     * Native name: tomTextFlowWN
     * @type {Integer (Int32)}
     */
    static TextFlowWN => 8

    /**
     * Alternative orientation.
     * Native name: tomTextFlowNE
     * @type {Integer (Int32)}
     */
    static TextFlowNE => 12

    /**
     * Disables the IME operation (see <a href="https://docs.microsoft.com/windows/desktop/Controls/rich-edit-control-styles">ES_NOIME</a>).
     * Native name: tomNoIME
     * @type {Integer (Int32)}
     */
    static NoIME => 524288

    /**
     * Directs the rich edit control to allow the application to handle all IME operations (see <a href="https://docs.microsoft.com/windows/desktop/Controls/rich-edit-control-styles">ES_SELFIME</a>).
     * Native name: tomSelfIME
     * @type {Integer (Int32)}
     */
    static SelfIME => 262144

    /**
     * Horizontal scrolling is disabled.
     * Native name: tomNoUpScroll
     * @type {Integer (Int32)}
     */
    static NoUpScroll => 65536

    /**
     * Vertical scrolling is disabled.
     * Native name: tomNoVpScroll
     * @type {Integer (Int32)}
     */
    static NoVpScroll => 262144

    /**
     * Not a link.
     * Native name: tomNoLink
     * @type {Integer (Int32)}
     */
    static NoLink => 0

    /**
     * The URL only; that is, no friendly name.
     * Native name: tomClientLink
     * @type {Integer (Int32)}
     */
    static ClientLink => 1

    /**
     * The name of friendly name link.
     * Native name: tomFriendlyLinkName
     * @type {Integer (Int32)}
     */
    static FriendlyLinkName => 2

    /**
     * The URL of a friendly name link.
     * Native name: tomFriendlyLinkAddress
     * @type {Integer (Int32)}
     */
    static FriendlyLinkAddress => 3

    /**
     * The URL of an automatic link.
     * Native name: tomAutoLinkURL
     * @type {Integer (Int32)}
     */
    static AutoLinkURL => 4

    /**
     * An automatic link to an email address.
     * Native name: tomAutoLinkEmail
     * @type {Integer (Int32)}
     */
    static AutoLinkEmail => 5

    /**
     * An automatic link to a phone number.
     * Native name: tomAutoLinkPhone
     * @type {Integer (Int32)}
     */
    static AutoLinkPhone => 6

    /**
     * An automatic link to a storage location.
     * Native name: tomAutoLinkPath
     * @type {Integer (Int32)}
     */
    static AutoLinkPath => 7

    /**
     * No compression.
     * Native name: tomCompressNone
     * @type {Integer (Int32)}
     */
    static CompressNone => 0

    /**
     * Compress punctuation.
     * Native name: tomCompressPunctuation
     * @type {Integer (Int32)}
     */
    static CompressPunctuation => 1

    /**
     * Compress punctuation and kana.
     * Native name: tomCompressPunctuationAndKana
     * @type {Integer (Int32)}
     */
    static CompressPunctuationAndKana => 2

    /**
     * The maximum compression flag value.
     * Native name: tomCompressMax
     * @type {Integer (Int32)}
     */
    static CompressMax => 2

    /**
     * Automatically set the underline position.
     * Native name: tomUnderlinePositionAuto
     * @type {Integer (Int32)}
     */
    static UnderlinePositionAuto => 0

    /**
     * Render underline below text.
     * Native name: tomUnderlinePositionBelow
     * @type {Integer (Int32)}
     */
    static UnderlinePositionBelow => 1

    /**
     * Render underline above text.
     * Native name: tomUnderlinePositionAbove
     * @type {Integer (Int32)}
     */
    static UnderlinePositionAbove => 2

    /**
     * The maximum underline position flag value.
     * Native name: tomUnderlinePositionMax
     * @type {Integer (Int32)}
     */
    static UnderlinePositionMax => 2

    /**
     * For horizontal layout, align CJK characters on the baseline. For vertical layout, center align CJK characters.
     * Native name: tomFontAlignmentAuto
     * @type {Integer (Int32)}
     */
    static FontAlignmentAuto => 0

    /**
     * For horizontal layout, top align CJK characters. For vertical layout, right align CJK characters.
     * Native name: tomFontAlignmentTop
     * @type {Integer (Int32)}
     */
    static FontAlignmentTop => 1

    /**
     * For horizontal or vertical layout, align CJK characters on the baseline.
     * Native name: tomFontAlignmentBaseline
     * @type {Integer (Int32)}
     */
    static FontAlignmentBaseline => 2

    /**
     * For horizontal layout, bottom align CJK characters. For vertical layout, left align CJK characters.
     * Native name: tomFontAlignmentBottom
     * @type {Integer (Int32)}
     */
    static FontAlignmentBottom => 3

    /**
     * For horizontal layout, center CJK characters vertically. For vertical layout, center align CJK characters horizontally.
     * Native name: tomFontAlignmentCenter
     * @type {Integer (Int32)}
     */
    static FontAlignmentCenter => 4

    /**
     * The maximum font alignment flag value.
     * Native name: tomFontAlignmentMax
     * @type {Integer (Int32)}
     */
    static FontAlignmentMax => 4

    /**
     * Native name: tomRubyBelow
     * @type {Integer (Int32)}
     */
    static RubyBelow => 128

    /**
     * Native name: tomRubyAlignCenter
     * @type {Integer (Int32)}
     */
    static RubyAlignCenter => 0

    /**
     * Native name: tomRubyAlign010
     * @type {Integer (Int32)}
     */
    static RubyAlign010 => 1

    /**
     * Native name: tomRubyAlign121
     * @type {Integer (Int32)}
     */
    static RubyAlign121 => 2

    /**
     * Native name: tomRubyAlignLeft
     * @type {Integer (Int32)}
     */
    static RubyAlignLeft => 3

    /**
     * Native name: tomRubyAlignRight
     * @type {Integer (Int32)}
     */
    static RubyAlignRight => 4

    /**
     * Limit locations use document default.
     * Native name: tomLimitsDefault
     * @type {Integer (Int32)}
     */
    static LimitsDefault => 0

    /**
     * Limits are placed under and over the operator.
     * Native name: tomLimitsUnderOver
     * @type {Integer (Int32)}
     */
    static LimitsUnderOver => 1

    /**
     * Limits are operator subscript and superscript.
     * Native name: tomLimitsSubSup
     * @type {Integer (Int32)}
     */
    static LimitsSubSup => 2

    /**
     * The upper limit is a superscript.
     * Native name: tomUpperLimitAsSuperScript
     * @type {Integer (Int32)}
     */
    static UpperLimitAsSuperScript => 3

    /**
     * Switch between <b>tomLimitsSubSup</b> and <b>tomLimitsUnderOver</b>.
     * Native name: tomLimitsOpposite
     * @type {Integer (Int32)}
     */
    static LimitsOpposite => 4

    /**
     * Show empty lower limit placeholder.
     * Native name: tomShowLLimPlaceHldr
     * @type {Integer (Int32)}
     */
    static ShowLLimPlaceHldr => 8

    /**
     * Show empty upper limit placeholder.
     * Native name: tomShowULimPlaceHldr
     * @type {Integer (Int32)}
     */
    static ShowULimPlaceHldr => 16

    /**
     * Don't grow the <i>n</i>-ary operator with the argument.
     * Native name: tomDontGrowWithContent
     * @type {Integer (Int32)}
     */
    static DontGrowWithContent => 64

    /**
     * Grow the <i>n</i>-ary operator with the argument.
     * Native name: tomGrowWithContent
     * @type {Integer (Int32)}
     */
    static GrowWithContent => 128

    /**
     * Align subscript under superscript.
     * Native name: tomSubSupAlign
     * @type {Integer (Int32)}
     */
    static SubSupAlign => 1

    /**
     * Mask for <b>tomLimitAlignCenter</b>, <b>tomLimitAlignLeft</b>, and <b>tomLimitAlignRight.</b>
     * Native name: tomLimitAlignMask
     * @type {Integer (Int32)}
     */
    static LimitAlignMask => 3

    /**
     * Center limit under base.
     * Native name: tomLimitAlignCenter
     * @type {Integer (Int32)}
     */
    static LimitAlignCenter => 0

    /**
     * Align left ends of limit and base.
     * Native name: tomLimitAlignLeft
     * @type {Integer (Int32)}
     */
    static LimitAlignLeft => 1

    /**
     * Align right ends of limit and base.
     * Native name: tomLimitAlignRight
     * @type {Integer (Int32)}
     */
    static LimitAlignRight => 2

    /**
     * Show empty radical degree placeholder.
     * Native name: tomShowDegPlaceHldr
     * @type {Integer (Int32)}
     */
    static ShowDegPlaceHldr => 8

    /**
     * Center brackets at baseline.
     * Native name: tomAlignDefault
     * @type {Integer (Int32)}
     */
    static AlignDefault => 0

    /**
     * Use brackets that match the argument ascent and descent.
     * Native name: tomAlignMatchAscentDescent
     * @type {Integer (Int32)}
     */
    static AlignMatchAscentDescent => 2

    /**
     * Bits 7, 6 can have TeX variant enumeration values:
     * Native name: tomMathVariant
     * @type {Integer (Int32)}
     */
    static MathVariant => 32

    /**
     * The math handler determines the style.
     * Native name: tomStyleDefault
     * @type {Integer (Int32)}
     */
    static StyleDefault => 0

    /**
     * The 2<sup>nd</sup> and higher level subscript superscript size, cramped.
     * Native name: tomStyleScriptScriptCramped
     * @type {Integer (Int32)}
     */
    static StyleScriptScriptCramped => 1

    /**
     * The 2<sup>nd</sup> and higher level subscript superscript size.
     * Native name: tomStyleScriptScript
     * @type {Integer (Int32)}
     */
    static StyleScriptScript => 2

    /**
     * The 1<sup>st</sup> level subscript superscript size, cramped.
     * Native name: tomStyleScriptCramped
     * @type {Integer (Int32)}
     */
    static StyleScriptCramped => 3

    /**
     * The 1<sup>st</sup> level subscript superscript size.
     * Native name: tomStyleScript
     * @type {Integer (Int32)}
     */
    static StyleScript => 4

    /**
     * Text size cramped, for example, inside a square root.
     * Native name: tomStyleTextCramped
     * @type {Integer (Int32)}
     */
    static StyleTextCramped => 5

    /**
     * The standard inline text size.
     * Native name: tomStyleText
     * @type {Integer (Int32)}
     */
    static StyleText => 6

    /**
     * Display style cramped.
     * Native name: tomStyleDisplayCramped
     * @type {Integer (Int32)}
     */
    static StyleDisplayCramped => 7

    /**
     * Display style.
     * Native name: tomStyleDisplay
     * @type {Integer (Int32)}
     */
    static StyleDisplay => 8

    /**
     * Indicates one of these is active: <b>tomDecDecSize</b>, <b>tomDecSize</b>, <b>tomIncSize</b>, <b>tomIncIncSize</b>. Note that the maximum size is <b>tomStyleText</b> size, and the minimum size is <b>tomStyleScriptScript</b> size.
     * Native name: tomMathRelSize
     * @type {Integer (Int32)}
     */
    static MathRelSize => 64

    /**
     * Two sizes smaller than the default.
     * Native name: tomDecDecSize
     * @type {Integer (Int32)}
     */
    static DecDecSize => 254

    /**
     * One size smaller than the default.
     * Native name: tomDecSize
     * @type {Integer (Int32)}
     */
    static DecSize => 255

    /**
     * One size bigger than the default.
     * Native name: tomIncSize
     * @type {Integer (Int32)}
     */
    static IncSize => 65

    /**
     * Two sizes bigger than the default.
     * Native name: tomIncIncSize
     * @type {Integer (Int32)}
     */
    static IncIncSize => 66

    /**
     * Use selection user interface rules.
     * Native name: tomGravityUI
     * @type {Integer (Int32)}
     */
    static GravityUI => 0

    /**
     * Both ends have backward gravity.
     * Native name: tomGravityBack
     * @type {Integer (Int32)}
     */
    static GravityBack => 1

    /**
     * Both ends have forward gravity.
     * Native name: tomGravityFore
     * @type {Integer (Int32)}
     */
    static GravityFore => 2

    /**
     * Inward gravity; that is, the start is forward, and the end is backward.
     * Native name: tomGravityIn
     * @type {Integer (Int32)}
     */
    static GravityIn => 3

    /**
     * Outward gravity; that is, the start is backward, and the end is forward.
     * Native name: tomGravityOut
     * @type {Integer (Int32)}
     */
    static GravityOut => 4

    /**
     * Native name: tomGravityBackward
     * @type {Integer (Int32)}
     */
    static GravityBackward => 536870912

    /**
     * Native name: tomGravityForward
     * @type {Integer (Int32)}
     */
    static GravityForward => 1073741824

    /**
     * Adjust CR/LFs at the start.
     * Native name: tomAdjustCRLF
     * @type {Integer (Int32)}
     */
    static AdjustCRLF => 1

    /**
     * Use CR/LF in place of a carriage return or a line feed.
     * Native name: tomUseCRLF
     * @type {Integer (Int32)}
     */
    static UseCRLF => 2

    /**
     * Copy up to 0xFFFC (OLE object).
     * Native name: tomTextize
     * @type {Integer (Int32)}
     */
    static Textize => 4

    /**
     * Allow a final end-of-paragraph (EOP) marker.
     * Native name: tomAllowFinalEOP
     * @type {Integer (Int32)}
     */
    static AllowFinalEOP => 8

    /**
     * Fold math alphanumerics to ASCII/Greek.
     * Native name: tomFoldMathAlpha
     * @type {Integer (Int32)}
     */
    static FoldMathAlpha => 16

    /**
     * Don't include hidden text.
     * Native name: tomNoHidden
     * @type {Integer (Int32)}
     */
    static NoHidden => 32

    /**
     * Include list numbers.
     * Native name: tomIncludeNumbering
     * @type {Integer (Int32)}
     */
    static IncludeNumbering => 64

    /**
     * Replace table row delimiter characters with spaces.
     * Native name: tomTranslateTableCell
     * @type {Integer (Int32)}
     */
    static TranslateTableCell => 128

    /**
     * Don't include math zone brackets.
     * Native name: tomNoMathZoneBrackets
     * @type {Integer (Int32)}
     */
    static NoMathZoneBrackets => 256

    /**
     * Convert to or from math italic and/or math bold according to the status of italic and bold retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextfont2-geteffects">ITextFont2::GetEffects</a> method.
     * Native name: tomConvertMathChar
     * @type {Integer (Int32)}
     */
    static ConvertMathChar => 512

    /**
     * Don’t use math italics for upper-case Greek letters. This value is used with  
     * <b>tomConvertMathChar</b>.
     * Native name: tomNoUCGreekItalic
     * @type {Integer (Int32)}
     */
    static NoUCGreekItalic => 1024

    /**
     * Allow math bold.  This value is used with  
     * <b>tomConvertMathChar</b>.
     * Native name: tomAllowMathBold
     * @type {Integer (Int32)}
     */
    static AllowMathBold => 2048

    /**
     * Get the BCP-47 language tag for this range.
     * Native name: tomLanguageTag
     * @type {Integer (Int32)}
     */
    static LanguageTag => 4096

    /**
     * Get text in RTF.
     * Native name: tomConvertRTF
     * @type {Integer (Int32)}
     */
    static ConvertRTF => 8192

    /**
     * Apply RTF document default properties.
     * Native name: tomApplyRtfDocProps
     * @type {Integer (Int32)}
     */
    static ApplyRtfDocProps => 16384

    /**
     * Display the phantom object's argument.
     * Native name: tomPhantomShow
     * @type {Integer (Int32)}
     */
    static PhantomShow => 1

    /**
     * The phantom object has zero width.
     * Native name: tomPhantomZeroWidth
     * @type {Integer (Int32)}
     */
    static PhantomZeroWidth => 2

    /**
     * The phantom object has zero ascent.
     * Native name: tomPhantomZeroAscent
     * @type {Integer (Int32)}
     */
    static PhantomZeroAscent => 4

    /**
     * The phantom object has zero descent.
     * Native name: tomPhantomZeroDescent
     * @type {Integer (Int32)}
     */
    static PhantomZeroDescent => 8

    /**
     * Space the phantom object as if only the argument is present.
     * Native name: tomPhantomTransparent
     * @type {Integer (Int32)}
     */
    static PhantomTransparent => 16

    /**
     * Ascent smash.
     * Native name: tomPhantomASmash
     * @type {Integer (Int32)}
     */
    static PhantomASmash => 5

    /**
     * Descent smash.
     * Native name: tomPhantomDSmash
     * @type {Integer (Int32)}
     */
    static PhantomDSmash => 9

    /**
     * Horizontal smash.
     * Native name: tomPhantomHSmash
     * @type {Integer (Int32)}
     */
    static PhantomHSmash => 3

    /**
     * Full smash.
     * Native name: tomPhantomSmash
     * @type {Integer (Int32)}
     */
    static PhantomSmash => 13

    /**
     * Horizontal phantom.
     * Native name: tomPhantomHorz
     * @type {Integer (Int32)}
     */
    static PhantomHorz => 12

    /**
     * Vertical phantom.
     * Native name: tomPhantomVert
     * @type {Integer (Int32)}
     */
    static PhantomVert => 2

    /**
     * Hide top border.
     * Native name: tomBoxHideTop
     * @type {Integer (Int32)}
     */
    static BoxHideTop => 1

    /**
     * Hide bottom border.
     * Native name: tomBoxHideBottom
     * @type {Integer (Int32)}
     */
    static BoxHideBottom => 2

    /**
     * Hide left border.
     * Native name: tomBoxHideLeft
     * @type {Integer (Int32)}
     */
    static BoxHideLeft => 4

    /**
     * Hide right border.
     * Native name: tomBoxHideRight
     * @type {Integer (Int32)}
     */
    static BoxHideRight => 8

    /**
     * Display horizontal strikethrough.
     * Native name: tomBoxStrikeH
     * @type {Integer (Int32)}
     */
    static BoxStrikeH => 16

    /**
     * Display vertical strikethrough.
     * Native name: tomBoxStrikeV
     * @type {Integer (Int32)}
     */
    static BoxStrikeV => 32

    /**
     * Display diagonal strikethrough from the top left to the lower right.
     * Native name: tomBoxStrikeTLBR
     * @type {Integer (Int32)}
     */
    static BoxStrikeTLBR => 64

    /**
     * Display diagonal strikethrough from the lower left to the top right.
     * Native name: tomBoxStrikeBLTR
     * @type {Integer (Int32)}
     */
    static BoxStrikeBLTR => 128

    /**
     * Vertically align with center on baseline.
     * Native name: tomBoxAlignCenter
     * @type {Integer (Int32)}
     */
    static BoxAlignCenter => 1

    /**
     * Mask for <b>tomSpaceDefault</b>, <b>tomSpaceUnary</b>, <b>tomSpaceBinary</b>, <b>tomSpaceRelational</b>, <b>tomSpaceSkip</b>, <b>tomSpaceOrd</b>, and <b>tomSpaceDifferential.</b>
     * Native name: tomSpaceMask
     * @type {Integer (Int32)}
     */
    static SpaceMask => 28

    /**
     * Default spacing
     * Native name: tomSpaceDefault
     * @type {Integer (Int32)}
     */
    static SpaceDefault => 0

    /**
     * Space the object as if it were a unary operator.
     * Native name: tomSpaceUnary
     * @type {Integer (Int32)}
     */
    static SpaceUnary => 4

    /**
     * Space the object as if it were a binary operator.
     * Native name: tomSpaceBinary
     * @type {Integer (Int32)}
     */
    static SpaceBinary => 8

    /**
     * Space the object as if it were a relational operator.
     * Native name: tomSpaceRelational
     * @type {Integer (Int32)}
     */
    static SpaceRelational => 12

    /**
     * Space the object as if it were a unary operator.
     * Native name: tomSpaceSkip
     * @type {Integer (Int32)}
     */
    static SpaceSkip => 16

    /**
     * Space the object as if it were an ordinal operator.
     * Native name: tomSpaceOrd
     * @type {Integer (Int32)}
     */
    static SpaceOrd => 20

    /**
     * Space the object as if it were a differential operator.
     * Native name: tomSpaceDifferential
     * @type {Integer (Int32)}
     */
    static SpaceDifferential => 24

    /**
     * Treat as text size.
     * Native name: tomSizeText
     * @type {Integer (Int32)}
     */
    static SizeText => 32

    /**
     * Treat as script size (approximately 73% of text size).
     * Native name: tomSizeScript
     * @type {Integer (Int32)}
     */
    static SizeScript => 64

    /**
     * Treat as subscript size (approximately 60% of text size).
     * Native name: tomSizeScriptScript
     * @type {Integer (Int32)}
     */
    static SizeScriptScript => 96

    /**
     * Do not break arguments across a line.
     * Native name: tomNoBreak
     * @type {Integer (Int32)}
     */
    static NoBreak => 128

    /**
     * Position as if only the argument appears.
     * Native name: tomTransparentForPositioning
     * @type {Integer (Int32)}
     */
    static TransparentForPositioning => 256

    /**
     * Space according to argument properties.
     * Native name: tomTransparentForSpacing
     * @type {Integer (Int32)}
     */
    static TransparentForSpacing => 512

    /**
     * Stretch character below base.
     * Native name: tomStretchCharBelow
     * @type {Integer (Int32)}
     */
    static StretchCharBelow => 0

    /**
     * Stretch character above base.
     * Native name: tomStretchCharAbove
     * @type {Integer (Int32)}
     */
    static StretchCharAbove => 1

    /**
     * Stretch base  below character.
     * Native name: tomStretchBaseBelow
     * @type {Integer (Int32)}
     */
    static StretchBaseBelow => 2

    /**
     * Stretch base  above character.
     * Native name: tomStretchBaseAbove
     * @type {Integer (Int32)}
     */
    static StretchBaseAbove => 3

    /**
     * Mask for <b>tomMatrixAlignCenter</b>, <b>tomMatrixAlignTopRow</b>, and <b>tomMatrixAlignBottomRow.</b>
     * Native name: tomMatrixAlignMask
     * @type {Integer (Int32)}
     */
    static MatrixAlignMask => 3

    /**
     * Align the matrix center on baseline.
     * Native name: tomMatrixAlignCenter
     * @type {Integer (Int32)}
     */
    static MatrixAlignCenter => 0

    /**
     * Align the matrix top row on the baseline.
     * Native name: tomMatrixAlignTopRow
     * @type {Integer (Int32)}
     */
    static MatrixAlignTopRow => 1

    /**
     * Align the matrix bottom row on the baseline.
     * Native name: tomMatrixAlignBottomRow
     * @type {Integer (Int32)}
     */
    static MatrixAlignBottomRow => 3

    /**
     * Show empty element placeholder (a dotted box).
     * Native name: tomShowMatPlaceHldr
     * @type {Integer (Int32)}
     */
    static ShowMatPlaceHldr => 8

    /**
     * Expand the right size to the layout width (for equation number)
     * Native name: tomEqArrayLayoutWidth
     * @type {Integer (Int32)}
     */
    static EqArrayLayoutWidth => 1

    /**
     * Mask for <b>tomEqArrayAlignCenter</b>, <b>tomEqArrayAlignTopRow</b>, and <b>tomEqArrayBottomRow.</b>
     * Native name: tomEqArrayAlignMask
     * @type {Integer (Int32)}
     */
    static EqArrayAlignMask => 12

    /**
     * Align the center of the equation array on the baseline.
     * Native name: tomEqArrayAlignCenter
     * @type {Integer (Int32)}
     */
    static EqArrayAlignCenter => 0

    /**
     * Align the top of equations on the baseline.
     * 
     * Align the top row of the equation on the baseline.
     * Native name: tomEqArrayAlignTopRow
     * @type {Integer (Int32)}
     */
    static EqArrayAlignTopRow => 4

    /**
     * Align the bottom row of the equation on the baseline.
     * Native name: tomEqArrayAlignBottomRow
     * @type {Integer (Int32)}
     */
    static EqArrayAlignBottomRow => 12

    /**
     * Mask for <b>tomMathBreakLeft</b>, <b>tomMathBreakCenter</b>, and <b>tomMathBreakRight.</b>
     * Native name: tomMathManualBreakMask
     * @type {Integer (Int32)}
     */
    static MathManualBreakMask => 127

    /**
     * Align text following a manual break to the left.
     * Native name: tomMathBreakLeft
     * @type {Integer (Int32)}
     */
    static MathBreakLeft => 125

    /**
     * Center text following a manual break.
     * Native name: tomMathBreakCenter
     * @type {Integer (Int32)}
     */
    static MathBreakCenter => 126

    /**
     * Align text following a manual break to the right.
     * Native name: tomMathBreakRight
     * @type {Integer (Int32)}
     */
    static MathBreakRight => 127

    /**
     * Math equation alignment.
     * Native name: tomMathEqAlign
     * @type {Integer (Int32)}
     */
    static MathEqAlign => 128

    /**
     * Start shading math arguments.
     * Native name: tomMathArgShadingStart
     * @type {Integer (Int32)}
     */
    static MathArgShadingStart => 593

    /**
     * End shading math arguments.
     * Native name: tomMathArgShadingEnd
     * @type {Integer (Int32)}
     */
    static MathArgShadingEnd => 594

    /**
     * Start shading math objects.
     * Native name: tomMathObjShadingStart
     * @type {Integer (Int32)}
     */
    static MathObjShadingStart => 595

    /**
     * End shading math objects.
     * Native name: tomMathObjShadingEnd
     * @type {Integer (Int32)}
     */
    static MathObjShadingEnd => 596

    /**
     * Not in the function list.
     * Native name: tomFunctionTypeNone
     * @type {Integer (Int32)}
     */
    static FunctionTypeNone => 0

    /**
     * An ordinary math function that takes arguments.
     * Native name: tomFunctionTypeTakesArg
     * @type {Integer (Int32)}
     */
    static FunctionTypeTakesArg => 1

    /**
     * Use the lower limit for _, and so on.
     * Native name: tomFunctionTypeTakesLim
     * @type {Integer (Int32)}
     */
    static FunctionTypeTakesLim => 2

    /**
     * Turn the preceding FA into an NBSP.
     * Native name: tomFunctionTypeTakesLim2
     * @type {Integer (Int32)}
     */
    static FunctionTypeTakesLim2 => 3

    /**
     * A "lim" function.
     * Native name: tomFunctionTypeIsLim
     * @type {Integer (Int32)}
     */
    static FunctionTypeIsLim => 4

    /**
     * The default alignment for math paragraphs.
     * Native name: tomMathParaAlignDefault
     * @type {Integer (Int32)}
     */
    static MathParaAlignDefault => 0

    /**
     * Center math paragraphs as a group.
     * Native name: tomMathParaAlignCenterGroup
     * @type {Integer (Int32)}
     */
    static MathParaAlignCenterGroup => 1

    /**
     * Center math paragraphs.
     * Native name: tomMathParaAlignCenter
     * @type {Integer (Int32)}
     */
    static MathParaAlignCenter => 2

    /**
     * Left-align math paragraphs.
     * Native name: tomMathParaAlignLeft
     * @type {Integer (Int32)}
     */
    static MathParaAlignLeft => 3

    /**
     * Right-align math paragraphs.
     * Native name: tomMathParaAlignRight
     * @type {Integer (Int32)}
     */
    static MathParaAlignRight => 4

    /**
     * Mask for <b>tomMathDispAlignCenterGroup</b>, <b>tomMathDispAlignCenter</b>, <b>tomMathDispAlignLeft</b>, <b>tomMathDispAlignRight</b>, <b>tomMathDispIntUnderOver</b>, and <b>tomMathDispNaryGrow</b>.
     * Native name: tomMathDispAlignMask
     * @type {Integer (Int32)}
     */
    static MathDispAlignMask => 3

    /**
     * Center a math paragraph as a group.
     * Native name: tomMathDispAlignCenterGroup
     * @type {Integer (Int32)}
     */
    static MathDispAlignCenterGroup => 0

    /**
     * Center all equations in a math paragraph.
     * Native name: tomMathDispAlignCenter
     * @type {Integer (Int32)}
     */
    static MathDispAlignCenter => 1

    /**
     * Left justify all equations in a math paragraph.
     * Native name: tomMathDispAlignLeft
     * @type {Integer (Int32)}
     */
    static MathDispAlignLeft => 2

    /**
     * Right justify all equations in a math paragraph.
     * Native name: tomMathDispAlignRight
     * @type {Integer (Int32)}
     */
    static MathDispAlignRight => 3

    /**
     * Display-mode integral limits location.
     * Native name: tomMathDispIntUnderOver
     * @type {Integer (Int32)}
     */
    static MathDispIntUnderOver => 4

    /**
     * Indicates whether to use display-mode nested fraction script size.
     * Native name: tomMathDispFracTeX
     * @type {Integer (Int32)}
     */
    static MathDispFracTeX => 8

    /**
     * Indicates whether to use math-paragraph n-ary grow.
     * Native name: tomMathDispNaryGrow
     * @type {Integer (Int32)}
     */
    static MathDispNaryGrow => 16

    /**
     * Empty arguments display mask.
     * Native name: tomMathDocEmptyArgMask
     * @type {Integer (Int32)}
     */
    static MathDocEmptyArgMask => 96

    /**
     * Dotted square, if necessary.
     * Native name: tomMathDocEmptyArgAuto
     * @type {Integer (Int32)}
     */
    static MathDocEmptyArgAuto => 0

    /**
     * Dotted square, always.
     * Native name: tomMathDocEmptyArgAlways
     * @type {Integer (Int32)}
     */
    static MathDocEmptyArgAlways => 32

    /**
     * Nothing.
     * Native name: tomMathDocEmptyArgNever
     * @type {Integer (Int32)}
     */
    static MathDocEmptyArgNever => 64

    /**
     * Do not display the underscore (_) as subscripted, or the caret (^) as superscripted.
     * Native name: tomMathDocSbSpOpUnchanged
     * @type {Integer (Int32)}
     */
    static MathDocSbSpOpUnchanged => 128

    /**
     * Style mask for the <b>tomMathDocDiffUpright</b>, <b>tomMathDocDiffItalic</b>, <b>tomMathDocDiffOpenItalic </b> options.
     * Native name: tomMathDocDiffMask
     * @type {Integer (Int32)}
     */
    static MathDocDiffMask => 768

    /**
     * Use default glyphs for math differentials.
     * Native name: tomMathDocDiffDefault
     * @type {Integer (Int32)}
     */
    static MathDocDiffDefault => 0

    /**
     * Use upright glyphs for math differentials.
     * Native name: tomMathDocDiffUpright
     * @type {Integer (Int32)}
     */
    static MathDocDiffUpright => 256

    /**
     * Use italic glyphs for math differentials.
     * Native name: tomMathDocDiffItalic
     * @type {Integer (Int32)}
     */
    static MathDocDiffItalic => 512

    /**
     * No glyph change.
     * Native name: tomMathDocDiffOpenItalic
     * @type {Integer (Int32)}
     */
    static MathDocDiffOpenItalic => 768

    /**
     * Math-paragraph non-integral n-ary limits location.
     * Native name: tomMathDispNarySubSup
     * @type {Integer (Int32)}
     */
    static MathDispNarySubSup => 1024

    /**
     * Math-paragraph spacing defaults. Use math paragraph offsets instead of regular paragraph offsets.
     * Native name: tomMathDispDef
     * @type {Integer (Int32)}
     */
    static MathDispDef => 2048

    /**
     * Enable right-to-left (RTL) math zones in RTL paragraphs.
     * Native name: tomMathEnableRtl
     * @type {Integer (Int32)}
     */
    static MathEnableRtl => 4096

    /**
     * Equation line break mask.
     * Native name: tomMathBrkBinMask
     * @type {Integer (Int32)}
     */
    static MathBrkBinMask => 196608

    /**
     * Break before  binary/relational operator.
     * Native name: tomMathBrkBinBefore
     * @type {Integer (Int32)}
     */
    static MathBrkBinBefore => 0

    /**
     * Break after binary/relational operator.
     * Native name: tomMathBrkBinAfter
     * @type {Integer (Int32)}
     */
    static MathBrkBinAfter => 65536

    /**
     * Duplicate binary/relational before/after.
     * Native name: tomMathBrkBinDup
     * @type {Integer (Int32)}
     */
    static MathBrkBinDup => 131072

    /**
     * Duplicate mask for minus operator.
     * Native name: tomMathBrkBinSubMask
     * @type {Integer (Int32)}
     */
    static MathBrkBinSubMask => 786432

    /**
     * -- (minus on both lines).
     * Native name: tomMathBrkBinSubMM
     * @type {Integer (Int32)}
     */
    static MathBrkBinSubMM => 0

    /**
     * + -
     * Native name: tomMathBrkBinSubPM
     * @type {Integer (Int32)}
     */
    static MathBrkBinSubPM => 262144

    /**
     * - +
     * Native name: tomMathBrkBinSubMP
     * @type {Integer (Int32)}
     */
    static MathBrkBinSubMP => 524288

    /**
     * Set the selection character position and character count to range values.
     * Native name: tomSelRange
     * @type {Integer (Int32)}
     */
    static SelRange => 597

    /**
     * Use a string handle (<b>HSTRING</b>) instead of a binary string (<b>BSTR</b>).
     * Native name: tomHstring
     * @type {Integer (Int32)}
     */
    static Hstring => 596

    /**
     * Gets the TeX style of the font.
     * Native name: tomFontPropTeXStyle
     * @type {Integer (Int32)}
     */
    static FontPropTeXStyle => 828

    /**
     * Use <b>tomFontPropAlign</b> to get the <b>Align</b> property of an operator in a math zone. Here are how the values are assigned:<ul>
     * <li>Value 0 implies no special alignment.</li>
     * <li>Values 1 through 127 align the operator with the (n – 1)st operator on the first line of an equation.</li>
     * <li>Value 128 identifies operators to be vertically aligned with respect to one another ("Align at ="). </li>
     * <li>Other values are illegal.</li>
     * </ul>
     * Native name: tomFontPropAlign
     * @type {Integer (Int32)}
     */
    static FontPropAlign => 829

    /**
     * Native name: tomFontStretch
     * @type {Integer (Int32)}
     */
    static FontStretch => 830

    /**
     * Native name: tomFontStyle
     * @type {Integer (Int32)}
     */
    static FontStyle => 831

    /**
     * Represents the normal upright font style.
     * Native name: tomFontStyleUpright
     * @type {Integer (Int32)}
     */
    static FontStyleUpright => 0

    /**
     * Represents an oblique font style.
     * Native name: tomFontStyleOblique
     * @type {Integer (Int32)}
     */
    static FontStyleOblique => 1

    /**
     * Represents an italic font style.
     * Native name: tomFontStyleItalic
     * @type {Integer (Int32)}
     */
    static FontStyleItalic => 2

    /**
     * No defined font stretch.
     * Native name: tomFontStretchDefault
     * @type {Integer (Int32)}
     */
    static FontStretchDefault => 0

    /**
     * An ultra-condensed font stretch (50% of normal).
     * Native name: tomFontStretchUltraCondensed
     * @type {Integer (Int32)}
     */
    static FontStretchUltraCondensed => 1

    /**
     * An extra-condensed font stretch (62.5% of normal).
     * Native name: tomFontStretchExtraCondensed
     * @type {Integer (Int32)}
     */
    static FontStretchExtraCondensed => 2

    /**
     * A condensed font stretch (75% of normal).
     * Native name: tomFontStretchCondensed
     * @type {Integer (Int32)}
     */
    static FontStretchCondensed => 3

    /**
     * A semi-condensed font stretch (87.5% of normal).
     * Native name: tomFontStretchSemiCondensed
     * @type {Integer (Int32)}
     */
    static FontStretchSemiCondensed => 4

    /**
     * The normal font stretch that all other font stretch values relate to (100%).
     * Native name: tomFontStretchNormal
     * @type {Integer (Int32)}
     */
    static FontStretchNormal => 5

    /**
     * A semi-expanded font stretch (112.5% of normal).
     * Native name: tomFontStretchSemiExpanded
     * @type {Integer (Int32)}
     */
    static FontStretchSemiExpanded => 6

    /**
     * An expanded font stretch (125% of normal).
     * Native name: tomFontStretchExpanded
     * @type {Integer (Int32)}
     */
    static FontStretchExpanded => 7

    /**
     * An extra-expanded font stretch (150% of normal).
     * Native name: tomFontStretchExtraExpanded
     * @type {Integer (Int32)}
     */
    static FontStretchExtraExpanded => 8

    /**
     * An ultra-expanded font stretch (200% of normal).
     * Native name: tomFontStretchUltraExpanded
     * @type {Integer (Int32)}
     */
    static FontStretchUltraExpanded => 9

    /**
     * The default font weight.
     * Native name: tomFontWeightDefault
     * @type {Integer (Int32)}
     */
    static FontWeightDefault => 0

    /**
     * Thin font weight.
     * Native name: tomFontWeightThin
     * @type {Integer (Int32)}
     */
    static FontWeightThin => 100

    /**
     * Extra light font weight.
     * Native name: tomFontWeightExtraLight
     * @type {Integer (Int32)}
     */
    static FontWeightExtraLight => 200

    /**
     * Light font weight.
     * Native name: tomFontWeightLight
     * @type {Integer (Int32)}
     */
    static FontWeightLight => 300

    /**
     * Normal font weight.
     * Native name: tomFontWeightNormal
     * @type {Integer (Int32)}
     */
    static FontWeightNormal => 400

    /**
     * Same as <b>tomFontWeightNormal</b>.
     * Native name: tomFontWeightRegular
     * @type {Integer (Int32)}
     */
    static FontWeightRegular => 400

    /**
     * Medium font weight.
     * Native name: tomFontWeightMedium
     * @type {Integer (Int32)}
     */
    static FontWeightMedium => 500

    /**
     * Semi bold font weight.
     * Native name: tomFontWeightSemiBold
     * @type {Integer (Int32)}
     */
    static FontWeightSemiBold => 600

    /**
     * Bold font weight.
     * Native name: tomFontWeightBold
     * @type {Integer (Int32)}
     */
    static FontWeightBold => 700

    /**
     * Extra bold font weight.
     * Native name: tomFontWeightExtraBold
     * @type {Integer (Int32)}
     */
    static FontWeightExtraBold => 800

    /**
     * Heavy font weight.
     * Native name: tomFontWeightBlack
     * @type {Integer (Int32)}
     */
    static FontWeightBlack => 900

    /**
     * Same as <b>tomFontWeightBlack</b>.
     * Native name: tomFontWeightHeavy
     * @type {Integer (Int32)}
     */
    static FontWeightHeavy => 900

    /**
     * Extra heavy font weight.
     * Native name: tomFontWeightExtraBlack
     * @type {Integer (Int32)}
     */
    static FontWeightExtraBlack => 950

    /**
     * Alignment properties for a math paragraph.
     * Native name: tomParaPropMathAlign
     * @type {Integer (Int32)}
     */
    static ParaPropMathAlign => 1079

    /**
     * Used with the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextdocument2-setproperty">ITextDocument2::SetProperty</a> method to set any combination of <b>tomMathAutoCorrect</b>, <b>tomTeX</b>, or <b>tomMathAlphabetics</b>.
     * Native name: tomDocMathBuild
     * @type {Integer (Int32)}
     */
    static DocMathBuild => 128

    /**
     * Left margin for display math.
     * Native name: tomMathLMargin
     * @type {Integer (Int32)}
     */
    static MathLMargin => 129

    /**
     * Right margin for display math.
     * Native name: tomMathRMargin
     * @type {Integer (Int32)}
     */
    static MathRMargin => 130

    /**
     * Equation wrap indent for display math.
     * Native name: tomMathWrapIndent
     * @type {Integer (Int32)}
     */
    static MathWrapIndent => 131

    /**
     * Equation right wrap indent for display math (in a left-to-right (LTR) math zone).
     * Native name: tomMathWrapRight
     * @type {Integer (Int32)}
     */
    static MathWrapRight => 132

    /**
     * Space after a display math equation.
     * Native name: tomMathPostSpace
     * @type {Integer (Int32)}
     */
    static MathPostSpace => 134

    /**
     * Space before a display math equation.
     * Native name: tomMathPreSpace
     * @type {Integer (Int32)}
     */
    static MathPreSpace => 133

    /**
     * Space between equations in math paragraphs.
     * Native name: tomMathInterSpace
     * @type {Integer (Int32)}
     */
    static MathInterSpace => 135

    /**
     * Space between lines in a display math equation.
     * Native name: tomMathIntraSpace
     * @type {Integer (Int32)}
     */
    static MathIntraSpace => 136

    /**
     * Indicates whether data can be copied to the clipboard.
     * Native name: tomCanCopy
     * @type {Integer (Int32)}
     */
    static CanCopy => 137

    /**
     * Indicates whether one or more redo operations exist.
     * Native name: tomCanRedo
     * @type {Integer (Int32)}
     */
    static CanRedo => 138

    /**
     * Indicates whether one or more undo operations exist.
     * Native name: tomCanUndo
     * @type {Integer (Int32)}
     */
    static CanUndo => 139

    /**
     * The undo stack count limit.
     * Native name: tomUndoLimit
     * @type {Integer (Int32)}
     */
    static UndoLimit => 140

    /**
     * A document automatic link.
     * Native name: tomDocAutoLink
     * @type {Integer (Int32)}
     */
    static DocAutoLink => 141

    /**
     * The ellipsis mode.
     * Native name: tomEllipsisMode
     * @type {Integer (Int32)}
     */
    static EllipsisMode => 142

    /**
     * The ellipsis state.
     * Native name: tomEllipsisState
     * @type {Integer (Int32)}
     */
    static EllipsisState => 143

    /**
     * Ellipsis is disabled.
     * Native name: tomEllipsisNone
     * @type {Integer (Int32)}
     */
    static EllipsisNone => 0

    /**
     * An ellipsis forces a break anywhere in the line.
     * Native name: tomEllipsisEnd
     * @type {Integer (Int32)}
     */
    static EllipsisEnd => 1

    /**
     * An ellipsis forces a break between words.
     * Native name: tomEllipsisWord
     * @type {Integer (Int32)}
     */
    static EllipsisWord => 3

    /**
     * Ellipsis is present.
     * Native name: tomEllipsisPresent
     * @type {Integer (Int32)}
     */
    static EllipsisPresent => 1

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
     * Native name: tomRowUpdate
     * @type {Integer (Int32)}
     */
    static RowUpdate => 1

    /**
     * Native name: tomRowApplyDefault
     * @type {Integer (Int32)}
     */
    static RowApplyDefault => 0

    /**
     * Changes cell width(s) or cell count (for changing column widths and inserting/deleting columns without changing cell border properties, and so forth.)
     * Native name: tomCellStructureChangeOnly
     * @type {Integer (Int32)}
     */
    static CellStructureChangeOnly => 1

    /**
     * The actual height of a table row.
     * Native name: tomRowHeightActual
     * @type {Integer (Int32)}
     */
    static RowHeightActual => 2059
}
