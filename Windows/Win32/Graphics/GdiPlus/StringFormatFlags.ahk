#Requires AutoHotkey v2.0.0 64-bit

/**
 * The StringFormatFlags enumeration specifies text layout information (such as orientation and clipping) and display manipulations (such as ellipsis insertion, digit substitution, and representation of characters that are not supported by a font).
 * @remarks
 * 
  * Multiple flags set can produce combined effects: 
  * 
  * <ul>
  * <li>When both <b><b>StringFormatFlagsDirectionVertical</b></b> and <b><b>StringFormatFlagsDirectionRightToLeft</b></b> are set, individual lines of text are drawn vertically. The first line starts at the right edge of the layout rectangle; the second line of text is to the left of the first line, and so on. </li>
  * <li>When <b><b>StringFormatFlagsDirectionVertical</b></b> is set and <b><b>StringFormatFlagsDirectionRightToLeft</b></b> is not set, individual lines of text are drawn vertically. The first line starts at the left edge of the layout rectangle; the second line of text is to the right of the first line. </li>
  * <li>When <b><b>StringFormatFlagsDirectionRightToLeft</b></b> is set and <b><b>StringFormatFlagsDirectionVertical</b></b> is not set, the individual lines of text are horizontal and the reading order is from right to left. This setting does not change the order in which characters are displayed, it simply specifies the order in which characters can be read. </li>
  * </ul>
  * The <b><b>StringFormatFlagsDirectionVertical</b></b> and <b><b>StringFormatFlagsDirectionRightToLeft</b></b> flags can affect string alignment.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-stringformatflags
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class StringFormatFlags{

    /**
     * Specifies that reading order is right to left. For horizontal text, characters are read from right to left. For vertical text, columns are read from right to left. By default, horizontal or vertical text is read from left to right.
     * @type {Integer (Int32)}
     */
    static StringFormatFlagsDirectionRightToLeft => 1

    /**
     * Specifies that individual lines of text are drawn vertically on the display device. By default, lines of text are horizontal, each new line below the previous line.
     * @type {Integer (Int32)}
     */
    static StringFormatFlagsDirectionVertical => 2

    /**
     * Specifies that parts of characters are allowed to overhang the string's layout rectangle. By default, characters are first aligned inside the rectangle's boundaries, then any characters which still overhang the boundaries are repositioned to avoid any overhang and thereby avoid affecting pixels outside the layout rectangle. An italic, lowercase letter F (
 * 				<i>f</i>) is an example of a character that may have overhanging parts. Setting this flag ensures that the character aligns visually with the lines above and below but may cause parts of characters, which lie outside the layout rectangle, to be clipped or painted.
     * @type {Integer (Int32)}
     */
    static StringFormatFlagsNoFitBlackBox => 4

    /**
     * Specifies that Unicode layout control characters are displayed with a representative character.
     * @type {Integer (Int32)}
     */
    static StringFormatFlagsDisplayFormatControl => 32

    /**
     * Specifies that an alternate font is used for characters that are not supported in the requested font. By default, any missing characters are displayed with the "fonts missing" character, usually an open square.
     * @type {Integer (Int32)}
     */
    static StringFormatFlagsNoFontFallback => 1024

    /**
     * Specifies that the space at the end of each line is included in a string measurement. By default, the boundary rectangle returned by the 
 * 				<a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-measurestring(inconstwchar_inint_inconstfont_inconstpointf__inconststringformat_outrectf)">Graphics::MeasureString</a> method excludes the space at the end of each line. Set this flag to include that space in the measurement.
     * @type {Integer (Int32)}
     */
    static StringFormatFlagsMeasureTrailingSpaces => 2048

    /**
     * Specifies that the wrapping of text to the next line is disabled. NoWrap is implied when a point of origin is used instead of a layout rectangle. When drawing text within a rectangle, by default, text is broken at the last word boundary that is inside the rectangle's boundary and wrapped to the next line.
     * @type {Integer (Int32)}
     */
    static StringFormatFlagsNoWrap => 4096

    /**
     * Specifies that only entire lines are laid out in the layout rectangle. By default, layout continues until the end of the text or until no more lines are visible as a result of clipping, whichever comes first. The default settings allow the last line to be partially obscured by a layout rectangle that is not a whole multiple of the line height. To ensure that only whole lines are seen, set this flag and be careful to provide a layout rectangle at least as tall as the height of one line.
     * @type {Integer (Int32)}
     */
    static StringFormatFlagsLineLimit => 8192

    /**
     * Specifies that characters overhanging the layout rectangle and text extending outside the layout rectangle are allowed to show. By default, all overhanging characters and text that extends outside the layout rectangle are clipped. Any trailing spaces (spaces that are at the end of a line) that extend outside the layout rectangle are clipped. Therefore, the setting of this flag will have an effect on a string measurement if trailing spaces are being included in the measurement. If clipping is enabled, trailing spaces that extend outside the layout rectangle are not included in the measurement. If clipping is disabled, all trailing spaces are included in the measurement, regardless of whether they are outside the layout rectangle.
     * @type {Integer (Int32)}
     */
    static StringFormatFlagsNoClip => 16384

    /**
     * 
     * @type {Integer (Int32)}
     */
    static StringFormatFlagsBypassGDI => -2147483648
}
