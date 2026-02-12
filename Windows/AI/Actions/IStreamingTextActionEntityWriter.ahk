#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\StreamingTextActionEntity.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IStreamingTextActionEntityWriter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamingTextActionEntityWriter
     * @type {Guid}
     */
    static IID => Guid("{6bce2f76-a8af-5ff2-833c-108737ba0f42}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ReaderEntity", "get_TextFormat", "SetText"]

    /**
     * @type {StreamingTextActionEntity} 
     */
    ReaderEntity {
        get => this.get_ReaderEntity()
    }

    /**
     * @type {Integer} 
     */
    TextFormat {
        get => this.get_TextFormat()
    }

    /**
     * 
     * @returns {StreamingTextActionEntity} 
     */
    get_ReaderEntity() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StreamingTextActionEntity(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextFormat() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * The SetTextAlign function sets the text-alignment flags for the specified device context.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-textouta">TextOut</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-exttextouta">ExtTextOut</a> functions use the text-alignment flags to position a string of text on a display or other device. The flags specify the relationship between a reference point and a rectangle that bounds the text. The reference point is either the current position or a point passed to a text output function.
     * 
     * The rectangle that bounds the text is formed by the character cells in the text string.
     * 
     * The best way to get left-aligned text is to use either
     * 
     * 
     * ```cpp
     * 
     * SetTextAlign (hdc, GetTextAlign(hdc) & (~TA_CENTER))
     * 
     * ```
     * 
     * 
     * or
     * 
     * 
     * ```cpp
     * 
     * SetTextAlign (hdc,TA_LEFT | <other flags>)
     * 
     * ```
     * 
     * 
     * You can also use <b>SetTextAlign</b> (hdc, TA_LEFT) for this purpose, but this loses any vertical or right-to-left settings.
     * 
     * <div class="alert"><b>Note</b>  You should not use <b>SetTextAlign</b> with TA_UPDATECP when you are using <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptstringout">ScriptStringOut</a>, because selected text is not rendered correctly. If you must use this flag, you can unset and reset it as necessary to avoid the problem.</div>
     * <div> </div>
     * @param {HSTRING} text 
     * @returns {HRESULT} If the function succeeds, the return value is the previous text-alignment setting.
     * 
     * If the function fails, the return value is GDI_ERROR.
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-settextalign
     */
    SetText(text) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(8, this, "ptr", text, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
