#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the shape that joins two lines or segments.
 * @remarks
 * A miter limit affects how sharp miter joins are allowed to be.
 * 	If the line join style is <b>D2D1_LINE_JOIN_MITER_OR_BEVEL</b>, then the join will be mitered with regular angular vertices if it doesn't extend
 * 	beyond the miter limit; otherwise, the line join will be beveled.
 * 
 * The following illustration shows  different line join settings for the same stroked path geometry.  
 * 
 * <img alt="Illustration of line join settings" src="./images/StrokeStyle_Join.png"/>
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_line_join
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_LINE_JOIN {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Regular angular vertices.
     * @type {Integer (Int32)}
     */
    static D2D1_LINE_JOIN_MITER => 0

    /**
     * Beveled vertices.
     * @type {Integer (Int32)}
     */
    static D2D1_LINE_JOIN_BEVEL => 1

    /**
     * Rounded vertices.
     * @type {Integer (Int32)}
     */
    static D2D1_LINE_JOIN_ROUND => 2

    /**
     * Regular angular vertices unless the join would extend beyond the miter limit; otherwise, beveled vertices.
     * @type {Integer (Int32)}
     */
    static D2D1_LINE_JOIN_MITER_OR_BEVEL => 3
}
