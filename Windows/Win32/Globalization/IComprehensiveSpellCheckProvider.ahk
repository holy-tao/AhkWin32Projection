#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * Allows the provider to optionally support a more comprehensive spell checking functionality.
 * @see https://docs.microsoft.com/windows/win32/api//spellcheckprovider/nn-spellcheckprovider-icomprehensivespellcheckprovider
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IComprehensiveSpellCheckProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComprehensiveSpellCheckProvider
     * @type {Guid}
     */
    static IID => Guid("{0c58f8de-8e94-479e-9717-70c42c4ad2c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ComprehensiveCheck"]

    /**
     * 
     * @param {PWSTR} text 
     * @param {Pointer<IEnumSpellingError>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Intl/icomprehensivespellcheckprovider-comprehensivecheck
     */
    ComprehensiveCheck(text, value) {
        text := text is String ? StrPtr(text) : text

        result := ComCall(3, this, "ptr", text, "ptr*", value, "HRESULT")
        return result
    }
}
