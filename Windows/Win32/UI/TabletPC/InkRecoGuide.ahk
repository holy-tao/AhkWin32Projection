#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Deprecated. Represents information about the recognition guide. Use the WritingBox Property, DrawnBox Property, Rows Property, Columns Property, and Midline Property [InkRecognizerGuide Class] properties instead.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ns-msinkaut-inkrecoguide
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkRecoGuide extends Win32Struct
{
    static sizeof => 44

    static packingSize => 4

    /**
     * Deprecated.
     * @type {RECT}
     */
    rectWritingBox{
        get {
            if(!this.HasProp("__rectWritingBox"))
                this.__rectWritingBox := RECT(0, this)
            return this.__rectWritingBox
        }
    }

    /**
     * Deprecated.
     * @type {RECT}
     */
    rectDrawnBox{
        get {
            if(!this.HasProp("__rectDrawnBox"))
                this.__rectDrawnBox := RECT(16, this)
            return this.__rectDrawnBox
        }
    }

    /**
     * Deprecated.
     * @type {Integer}
     */
    cRows {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Deprecated.
     * @type {Integer}
     */
    cColumns {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Deprecated.
     * @type {Integer}
     */
    midline {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }
}
