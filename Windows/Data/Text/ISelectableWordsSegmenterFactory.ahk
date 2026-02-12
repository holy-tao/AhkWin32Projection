#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SelectableWordsSegmenter.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class ISelectableWordsSegmenterFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISelectableWordsSegmenterFactory
     * @type {Guid}
     */
    static IID => Guid("{8c7a7648-6057-4339-bc70-f210010a4150}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWithLanguage"]

    /**
     * 
     * @param {HSTRING} language_ 
     * @returns {SelectableWordsSegmenter} 
     */
    CreateWithLanguage(language_) {
        if(language_ is String) {
            pin := HSTRING.Create(language_)
            language_ := pin.Value
        }
        language_ := language_ is Win32Handle ? NumGet(language_, "ptr") : language_

        result := ComCall(6, this, "ptr", language_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SelectableWordsSegmenter(result_)
    }
}
