#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\Collections\IVectorView.ahk
#Include .\JapanesePhoneme.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class IJapanesePhoneticAnalyzerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IJapanesePhoneticAnalyzerStatics
     * @type {Guid}
     */
    static IID => Guid("{88ab9e90-93de-41b2-b4d5-8edb227fd1c2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetWords", "GetWordsWithMonoRubyOption"]

    /**
     * 
     * @param {HSTRING} input_ 
     * @returns {IVectorView<JapanesePhoneme>} 
     */
    GetWords(input_) {
        if(input_ is String) {
            pin := HSTRING.Create(input_)
            input_ := pin.Value
        }
        input_ := input_ is Win32Handle ? NumGet(input_, "ptr") : input_

        result := ComCall(6, this, "ptr", input_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(JapanesePhoneme, result_)
    }

    /**
     * 
     * @param {HSTRING} input_ 
     * @param {Boolean} monoRuby 
     * @returns {IVectorView<JapanesePhoneme>} 
     */
    GetWordsWithMonoRubyOption(input_, monoRuby) {
        if(input_ is String) {
            pin := HSTRING.Create(input_)
            input_ := pin.Value
        }
        input_ := input_ is Win32Handle ? NumGet(input_, "ptr") : input_

        result := ComCall(7, this, "ptr", input_, "int", monoRuby, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(JapanesePhoneme, result_)
    }
}
