#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DWRITE_PANOSE union describes typeface classification values that you use with IDWriteFont1::GetPanose to select and match the font.
 * @remarks
 * <div class="alert"><b>Note</b>  The <b>familyKind</b> member (index 0) is the only stable entry in the 10-byte array because all the entries that follow can change dynamically depending on the context of the first member.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_panose
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_PANOSE {
    #StructPack 1


    struct _text {
        familyKind : Int8

        serifStyle : Int8

        weight : Int8

        proportion : Int8

        contrast : Int8

        strokeVariation : Int8

        armStyle : Int8

        letterform : Int8

        midline : Int8

        xHeight : Int8

    }

    struct _script {
        familyKind : Int8

        toolKind : Int8

        weight : Int8

        spacing : Int8

        aspectRatio : Int8

        contrast : Int8

        scriptTopology : Int8

        scriptForm : Int8

        finials : Int8

        xAscent : Int8

    }

    struct _decorative {
        familyKind : Int8

        decorativeClass : Int8

        weight : Int8

        aspect : Int8

        contrast : Int8

        serifVariant : Int8

        fill : Int8

        lining : Int8

        decorativeTopology : Int8

        characterRange : Int8

    }

    struct _symbol {
        familyKind : Int8

        symbolKind : Int8

        weight : Int8

        spacing : Int8

        aspectRatioAndContrast : Int8

        aspectRatio94 : Int8

        aspectRatio119 : Int8

        aspectRatio157 : Int8

        aspectRatio163 : Int8

        aspectRatio211 : Int8

    }

    /**
     * A 10-byte array of typeface classification values.
     */
    values : Int8[10]

    static __New() {
        DefineProp(this.Prototype, 'familyKind', { type: Int8, offset: 0 })
        DefineProp(this.Prototype, 'text', { type: DWRITE_PANOSE._text, offset: 0 })
        DefineProp(this.Prototype, 'script', { type: DWRITE_PANOSE._script, offset: 0 })
        DefineProp(this.Prototype, 'decorative', { type: DWRITE_PANOSE._decorative, offset: 0 })
        DefineProp(this.Prototype, 'symbol', { type: DWRITE_PANOSE._symbol, offset: 0 })
        this.DeleteProp("__New")
    }
}
