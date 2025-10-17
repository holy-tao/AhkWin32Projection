#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DWRITE_PANOSE union describes typeface classification values that you use with IDWriteFont1::GetPanose to select and match the font.
 * @remarks
 * 
  * <div class="alert"><b>Note</b>  The <b>familyKind</b> member (index 0) is the only stable entry in the 10-byte array because all the entries that follow can change dynamically depending on the context of the first member.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/ns-dwrite_1-dwrite_panose
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PANOSE extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    class _text extends Win32Struct {
        static sizeof => 80
        static packingSize => 8

        /**
         * @type {Integer}
         */
        familyKind {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        serifStyle {
            get => NumGet(this, 1, "char")
            set => NumPut("char", value, this, 1)
        }
    
        /**
         * @type {Integer}
         */
        weight {
            get => NumGet(this, 2, "char")
            set => NumPut("char", value, this, 2)
        }
    
        /**
         * @type {Integer}
         */
        proportion {
            get => NumGet(this, 3, "char")
            set => NumPut("char", value, this, 3)
        }
    
        /**
         * @type {Integer}
         */
        contrast {
            get => NumGet(this, 4, "char")
            set => NumPut("char", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        strokeVariation {
            get => NumGet(this, 5, "char")
            set => NumPut("char", value, this, 5)
        }
    
        /**
         * @type {Integer}
         */
        armStyle {
            get => NumGet(this, 6, "char")
            set => NumPut("char", value, this, 6)
        }
    
        /**
         * @type {Integer}
         */
        letterform {
            get => NumGet(this, 7, "char")
            set => NumPut("char", value, this, 7)
        }
    
        /**
         * @type {Integer}
         */
        midline {
            get => NumGet(this, 8, "char")
            set => NumPut("char", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        xHeight {
            get => NumGet(this, 9, "char")
            set => NumPut("char", value, this, 9)
        }
    
    }

    class _script extends Win32Struct {
        static sizeof => 80
        static packingSize => 8

        /**
         * @type {Integer}
         */
        familyKind {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        toolKind {
            get => NumGet(this, 1, "char")
            set => NumPut("char", value, this, 1)
        }
    
        /**
         * @type {Integer}
         */
        weight {
            get => NumGet(this, 2, "char")
            set => NumPut("char", value, this, 2)
        }
    
        /**
         * @type {Integer}
         */
        spacing {
            get => NumGet(this, 3, "char")
            set => NumPut("char", value, this, 3)
        }
    
        /**
         * @type {Integer}
         */
        aspectRatio {
            get => NumGet(this, 4, "char")
            set => NumPut("char", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        contrast {
            get => NumGet(this, 5, "char")
            set => NumPut("char", value, this, 5)
        }
    
        /**
         * @type {Integer}
         */
        scriptTopology {
            get => NumGet(this, 6, "char")
            set => NumPut("char", value, this, 6)
        }
    
        /**
         * @type {Integer}
         */
        scriptForm {
            get => NumGet(this, 7, "char")
            set => NumPut("char", value, this, 7)
        }
    
        /**
         * @type {Integer}
         */
        finials {
            get => NumGet(this, 8, "char")
            set => NumPut("char", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        xAscent {
            get => NumGet(this, 9, "char")
            set => NumPut("char", value, this, 9)
        }
    
    }

    class _decorative extends Win32Struct {
        static sizeof => 80
        static packingSize => 8

        /**
         * @type {Integer}
         */
        familyKind {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        decorativeClass {
            get => NumGet(this, 1, "char")
            set => NumPut("char", value, this, 1)
        }
    
        /**
         * @type {Integer}
         */
        weight {
            get => NumGet(this, 2, "char")
            set => NumPut("char", value, this, 2)
        }
    
        /**
         * @type {Integer}
         */
        aspect {
            get => NumGet(this, 3, "char")
            set => NumPut("char", value, this, 3)
        }
    
        /**
         * @type {Integer}
         */
        contrast {
            get => NumGet(this, 4, "char")
            set => NumPut("char", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        serifVariant {
            get => NumGet(this, 5, "char")
            set => NumPut("char", value, this, 5)
        }
    
        /**
         * @type {Integer}
         */
        fill {
            get => NumGet(this, 6, "char")
            set => NumPut("char", value, this, 6)
        }
    
        /**
         * @type {Integer}
         */
        lining {
            get => NumGet(this, 7, "char")
            set => NumPut("char", value, this, 7)
        }
    
        /**
         * @type {Integer}
         */
        decorativeTopology {
            get => NumGet(this, 8, "char")
            set => NumPut("char", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        characterRange {
            get => NumGet(this, 9, "char")
            set => NumPut("char", value, this, 9)
        }
    
    }

    class _symbol extends Win32Struct {
        static sizeof => 80
        static packingSize => 8

        /**
         * @type {Integer}
         */
        familyKind {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        symbolKind {
            get => NumGet(this, 1, "char")
            set => NumPut("char", value, this, 1)
        }
    
        /**
         * @type {Integer}
         */
        weight {
            get => NumGet(this, 2, "char")
            set => NumPut("char", value, this, 2)
        }
    
        /**
         * @type {Integer}
         */
        spacing {
            get => NumGet(this, 3, "char")
            set => NumPut("char", value, this, 3)
        }
    
        /**
         * @type {Integer}
         */
        aspectRatioAndContrast {
            get => NumGet(this, 4, "char")
            set => NumPut("char", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        aspectRatio94 {
            get => NumGet(this, 5, "char")
            set => NumPut("char", value, this, 5)
        }
    
        /**
         * @type {Integer}
         */
        aspectRatio119 {
            get => NumGet(this, 6, "char")
            set => NumPut("char", value, this, 6)
        }
    
        /**
         * @type {Integer}
         */
        aspectRatio157 {
            get => NumGet(this, 7, "char")
            set => NumPut("char", value, this, 7)
        }
    
        /**
         * @type {Integer}
         */
        aspectRatio163 {
            get => NumGet(this, 8, "char")
            set => NumPut("char", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        aspectRatio211 {
            get => NumGet(this, 9, "char")
            set => NumPut("char", value, this, 9)
        }
    
    }

    /**
     * A 10-byte array of typeface classification values.
     * @type {Array<Byte>}
     */
    values{
        get {
            if(!this.HasProp("__valuesProxyArray"))
                this.__valuesProxyArray := Win32FixedArray(this.ptr + 0, 10, Primitive, "char")
            return this.__valuesProxyArray
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_panose_family">DWRITE_PANOSE_FAMILY</a>-typed value that specifies the typeface classification values to get.
     * @type {Integer}
     */
    familyKind {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * The text structure.
     * @type {_text}
     */
    text{
        get {
            if(!this.HasProp("__text"))
                this.__text := %this.__Class%._text(0, this)
            return this.__text
        }
    }

    /**
     * The script structure.
     * @type {_script}
     */
    script{
        get {
            if(!this.HasProp("__script"))
                this.__script := %this.__Class%._script(0, this)
            return this.__script
        }
    }

    /**
     * The decorative structure.
     * @type {_decorative}
     */
    decorative{
        get {
            if(!this.HasProp("__decorative"))
                this.__decorative := %this.__Class%._decorative(0, this)
            return this.__decorative
        }
    }

    /**
     * The symbol structure.
     * @type {_symbol}
     */
    symbol{
        get {
            if(!this.HasProp("__symbol"))
                this.__symbol := %this.__Class%._symbol(0, this)
            return this.__symbol
        }
    }
}
