#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class ILanguageStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILanguageStatics2
     * @type {Guid}
     */
    static IID => Guid("{30199f6e-914b-4b2a-9d6e-e3b0e27dbe4f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TrySetInputMethodLanguageTag"]

    /**
     * 
     * @param {HSTRING} languageTag 
     * @returns {Boolean} 
     */
    TrySetInputMethodLanguageTag(languageTag) {
        if(languageTag is String) {
            pin := HSTRING.Create(languageTag)
            languageTag := pin.Value
        }
        languageTag := languageTag is Win32Handle ? NumGet(languageTag, "ptr") : languageTag

        result := ComCall(6, this, "ptr", languageTag, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
