#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Search
 * @version WindowsRuntime 1.4
 */
class ISearchSuggestionCollection extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchSuggestionCollection
     * @type {Guid}
     */
    static IID => Guid("{323a8a4b-fbea-4446-abbc-3da7915fdd3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Size", "AppendQuerySuggestion", "AppendQuerySuggestions", "AppendResultSuggestion", "AppendSearchSeparator"]

    /**
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} text 
     * @returns {HRESULT} 
     */
    AppendQuerySuggestion(text) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(7, this, "ptr", text, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<HSTRING>} suggestions 
     * @returns {HRESULT} 
     */
    AppendQuerySuggestions(suggestions) {
        result := ComCall(8, this, "ptr", suggestions, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} text 
     * @param {HSTRING} detailText 
     * @param {HSTRING} tag 
     * @param {IRandomAccessStreamReference} image_ 
     * @param {HSTRING} imageAlternateText 
     * @returns {HRESULT} 
     */
    AppendResultSuggestion(text, detailText, tag, image_, imageAlternateText) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text
        if(detailText is String) {
            pin := HSTRING.Create(detailText)
            detailText := pin.Value
        }
        detailText := detailText is Win32Handle ? NumGet(detailText, "ptr") : detailText
        if(tag is String) {
            pin := HSTRING.Create(tag)
            tag := pin.Value
        }
        tag := tag is Win32Handle ? NumGet(tag, "ptr") : tag
        if(imageAlternateText is String) {
            pin := HSTRING.Create(imageAlternateText)
            imageAlternateText := pin.Value
        }
        imageAlternateText := imageAlternateText is Win32Handle ? NumGet(imageAlternateText, "ptr") : imageAlternateText

        result := ComCall(9, this, "ptr", text, "ptr", detailText, "ptr", tag, "ptr", image_, "ptr", imageAlternateText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} label 
     * @returns {HRESULT} 
     */
    AppendSearchSeparator(label) {
        if(label is String) {
            pin := HSTRING.Create(label)
            label := pin.Value
        }
        label := label is Win32Handle ? NumGet(label, "ptr") : label

        result := ComCall(10, this, "ptr", label, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
