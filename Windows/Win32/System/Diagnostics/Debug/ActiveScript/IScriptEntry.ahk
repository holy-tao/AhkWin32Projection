#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include .\IScriptNode.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IScriptEntry extends IScriptNode{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScriptEntry
     * @type {Guid}
     */
    static IID => Guid("{0aee2a95-bcbb-11d0-8c72-00c04fc2b085}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetText", "SetText", "GetBody", "SetBody", "GetName", "SetName", "GetItemName", "SetItemName", "GetSignature", "SetSignature", "GetRange"]

    /**
     * The GetTextAlign function retrieves the text-alignment setting for the specified device context.
     * @remarks
     * The bounding rectangle is a rectangle bounding all of the character cells in a string of text. Its dimensions can be obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-gettextextentpoint32a">GetTextExtentPoint32</a> function.
     * 
     * The text-alignment flags determine how the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-textouta">TextOut</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-exttextouta">ExtTextOut</a> functions align a string of text in relation to the string's reference point provided to <b>TextOut</b> or <b>ExtTextOut</b>.
     * 
     * The text-alignment flags are not necessarily single bit flags and may be equal to zero. The flags must be examined in groups of related flags, as shown in the following list.
     * 
     * <ul>
     * <li>TA_LEFT, TA_RIGHT, and TA_CENTER</li>
     * <li>TA_BOTTOM, TA_TOP, and TA_BASELINE</li>
     * <li>TA_NOUPDATECP and TA_UPDATECP</li>
     * </ul>
     * If the current font has a vertical default base line, the related flags are as shown in the following list.
     * 
     * <ul>
     * <li>TA_LEFT, TA_RIGHT, and VTA_BASELINE</li>
     * <li>TA_BOTTOM, TA_TOP, and VTA_CENTER</li>
     * <li>TA_NOUPDATECP and TA_UPDATECP</li>
     * </ul>
     * <p class="proch"><b>To verify that a particular flag is set in the return value of this function:</b>
     * 
     * <ol>
     * <li>Apply the bitwise OR operator to the flag and its related flags.</li>
     * <li>Apply the bitwise AND operator to the result and the return value.</li>
     * <li>Test for the equality of this result and the flag.</li>
     * </ol>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-gettextalign
     */
    GetText() {
        pbstr := BSTR()
        result := ComCall(13, this, "ptr", pbstr, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstr
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
     * @param {PWSTR} psz 
     * @returns {HRESULT} If the function succeeds, the return value is the previous text-alignment setting.
     * 
     * If the function fails, the return value is GDI_ERROR.
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-settextalign
     */
    SetText(psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(14, this, "ptr", psz, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetBody() {
        pbstr := BSTR()
        result := ComCall(15, this, "ptr", pbstr, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstr
    }

    /**
     * 
     * @param {PWSTR} psz 
     * @returns {HRESULT} 
     */
    SetBody(psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(16, this, "ptr", psz, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetName
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wmformat/iwmcodecstrings-getname
     */
    GetName() {
        pbstr := BSTR()
        result := ComCall(17, this, "ptr", pbstr, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstr
    }

    /**
     * Sets the read mode and the blocking mode of the specified named pipe. If the specified handle is to the client end of a named pipe and if the named pipe server process is on a remote computer, the function can also be used to control local buffering.
     * @remarks
     * <b>Windows 10, version 1709:  </b>Pipes are only supported within an app-container; ie, from one UWP process to another UWP process that's part of the same app. Also, named pipes must use the syntax `\\.\pipe\LOCAL\` for the pipe name.
     * @param {PWSTR} psz 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/namedpipeapi/nf-namedpipeapi-setnamedpipehandlestate
     */
    SetName(psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(18, this, "ptr", psz, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetItemName() {
        pbstr := BSTR()
        result := ComCall(19, this, "ptr", pbstr, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstr
    }

    /**
     * 
     * @param {PWSTR} psz 
     * @returns {HRESULT} 
     */
    SetItemName(psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(20, this, "ptr", psz, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<ITypeInfo>} ppti 
     * @param {Pointer<Integer>} piMethod 
     * @returns {HRESULT} 
     */
    GetSignature(ppti, piMethod) {
        piMethodMarshal := piMethod is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, "ptr*", ppti, piMethodMarshal, piMethod, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ITypeInfo} pti 
     * @param {Integer} iMethod 
     * @returns {HRESULT} 
     */
    SetSignature(pti, iMethod) {
        result := ComCall(22, this, "ptr", pti, "uint", iMethod, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pichMin 
     * @param {Pointer<Integer>} pcch 
     * @returns {HRESULT} 
     */
    GetRange(pichMin, pcch) {
        pichMinMarshal := pichMin is VarRef ? "uint*" : "ptr"
        pcchMarshal := pcch is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, pichMinMarshal, pichMin, pcchMarshal, pcch, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
