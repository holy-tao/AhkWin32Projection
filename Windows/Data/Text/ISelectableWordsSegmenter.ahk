#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SelectableWordSegment.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class ISelectableWordsSegmenter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISelectableWordsSegmenter
     * @type {Guid}
     */
    static IID => Guid("{f6dc31e7-4b13-45c5-8897-7d71269e085d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ResolvedLanguage", "GetTokenAt", "GetTokens", "Tokenize"]

    /**
     * @type {HSTRING} 
     */
    ResolvedLanguage {
        get => this.get_ResolvedLanguage()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResolvedLanguage() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} text 
     * @param {Integer} startIndex 
     * @returns {SelectableWordSegment} 
     */
    GetTokenAt(text, startIndex) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(7, this, "ptr", text, "uint", startIndex, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SelectableWordSegment(result_)
    }

    /**
     * 
     * @param {HSTRING} text 
     * @returns {IVectorView<SelectableWordSegment>} 
     */
    GetTokens(text) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(8, this, "ptr", text, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(SelectableWordSegment, result_)
    }

    /**
     * 
     * @param {HSTRING} text 
     * @param {Integer} startIndex 
     * @param {SelectableWordSegmentsTokenizingHandler} handler 
     * @returns {HRESULT} 
     */
    Tokenize(text, startIndex, handler) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(9, this, "ptr", text, "uint", startIndex, "ptr", handler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
