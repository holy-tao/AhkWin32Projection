#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents the lines found in a recognition segment.
 * @remarks
 * The following example shows the baseline, midline, ascender line, and descender line of a segment.
 * 
 * <img alt="Illustration showing components of line metrics" border="" src="images/af81489d-317e-499e-a78b-702519efe530.gif"/>
 * For East Asian languages written horizontally, the descender line and baseline are located at the bottom of the characters and the ascender line at the top of the characters. The midline is between the ascender and descender lines.
 * 
 * For East Asian languages written vertically, the descender line is the leftmost edge, the ascender line is the rightmost edge, and baseline is between the descender and ascender lines. The midline for Komoji characters is the leftmost edge and the location for punctuation characters depends on the character.
 * @see https://learn.microsoft.com/windows/win32/api/rectypes/ne-rectypes-line_metrics
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class LINE_METRICS extends Win32Enum{

    /**
     * Requests baseline metrics. For an example that shows the baseline of a segment, see the Remarks section.
     * @type {Integer (Int32)}
     */
    static LM_BASELINE => 0

    /**
     * Requests midline metrics. For an example that shows the midline of a segment, see the remarks section.
     * @type {Integer (Int32)}
     */
    static LM_MIDLINE => 1

    /**
     * Requests ascender metrics. For an example that shows the ascender line of a segment, see the Remarks section.
     * @type {Integer (Int32)}
     */
    static LM_ASCENDER => 2

    /**
     * Requests descender metrics. For an example that shows the descender line of a segment, see the Remarks section.
     * @type {Integer (Int32)}
     */
    static LM_DESCENDER => 3
}
