#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Deprecated. Represents information about the recognition guide. Use the WritingBox Property, DrawnBox Property, Rows Property, Columns Property, and Midline Property [InkRecognizerGuide Class] properties instead.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ns-msinkaut-inkrecoguide
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct InkRecoGuide {
    #StructPack 4

    /**
     * Deprecated.
     */
    rectWritingBox : RECT

    /**
     * Deprecated.
     */
    rectDrawnBox : RECT

    /**
     * Deprecated.
     */
    cRows : Int32

    /**
     * Deprecated.
     */
    cColumns : Int32

    /**
     * Deprecated.
     */
    midline : Int32

}
