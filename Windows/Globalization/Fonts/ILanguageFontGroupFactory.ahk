#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\LanguageFontGroup.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization.Fonts
 * @version WindowsRuntime 1.4
 */
class ILanguageFontGroupFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILanguageFontGroupFactory
     * @type {Guid}
     */
    static IID => Guid("{fcaeac67-4e77-49c7-b856-dde934fc735b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateLanguageFontGroup"]

    /**
     * 
     * @param {HSTRING} languageTag 
     * @returns {LanguageFontGroup} 
     */
    CreateLanguageFontGroup(languageTag) {
        if(languageTag is String) {
            pin := HSTRING.Create(languageTag)
            languageTag := pin.Value
        }
        languageTag := languageTag is Win32Handle ? NumGet(languageTag, "ptr") : languageTag

        result := ComCall(6, this, "ptr", languageTag, "ptr*", &recommendedFonts := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LanguageFontGroup(recommendedFonts)
    }
}
