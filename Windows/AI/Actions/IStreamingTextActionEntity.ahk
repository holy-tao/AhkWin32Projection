#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IStreamingTextActionEntity extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamingTextActionEntity
     * @type {Guid}
     */
    static IID => Guid("{44cd8a16-abc9-5703-b4bf-6fe8b7a802fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsComplete", "GetText", "get_TextFormat", "add_TextChanged", "remove_TextChanged"]

    /**
     * @type {Boolean} 
     */
    IsComplete {
        get => this.get_IsComplete()
    }

    /**
     * @type {Integer} 
     */
    TextFormat {
        get => this.get_TextFormat()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsComplete() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

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
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-gettextalign
     */
    GetText() {
        result_ := HSTRING()
        result := ComCall(7, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextFormat() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<StreamingTextActionEntity, StreamingTextActionEntityTextChangedArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TextChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
