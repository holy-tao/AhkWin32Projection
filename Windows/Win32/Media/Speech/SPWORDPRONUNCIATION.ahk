#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPWORDPRONUNCIATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<SPWORDPRONUNCIATION>}
     */
    pNextWordPronunciation {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    eLexiconType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    LangID {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    wPronunciationFlags {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * @type {Integer}
     */
    ePartOfSpeech {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Array<UInt16>}
     */
    szPronunciation{
        get {
            if(!this.HasProp("__szPronunciationProxyArray"))
                this.__szPronunciationProxyArray := Win32FixedArray(this.ptr + 20, 2, Primitive, "ushort")
            return this.__szPronunciationProxyArray
        }
    }
}
