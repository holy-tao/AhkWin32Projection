#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include .\Language.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class ILanguageFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILanguageFactory
     * @type {Guid}
     */
    static IID => Guid("{9b0252ac-0c27-44f8-b792-9793fb66c63e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateLanguage"]

    /**
     * 
     * @param {HSTRING} languageTag 
     * @returns {Language} 
     */
    CreateLanguage(languageTag) {
        if(languageTag is String) {
            pin := HSTRING.Create(languageTag)
            languageTag := pin.Value
        }
        languageTag := languageTag is Win32Handle ? NumGet(languageTag, "ptr") : languageTag

        result := ComCall(6, this, "ptr", languageTag, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Language(result_)
    }
}
