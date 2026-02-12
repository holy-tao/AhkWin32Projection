#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\TextReverseConversionGenerator.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class ITextReverseConversionGeneratorFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextReverseConversionGeneratorFactory
     * @type {Guid}
     */
    static IID => Guid("{63bed326-1fda-41f6-89d5-23ddea3c729a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {HSTRING} languageTag 
     * @returns {TextReverseConversionGenerator} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(languageTag) {
        if(languageTag is String) {
            pin := HSTRING.Create(languageTag)
            languageTag := pin.Value
        }
        languageTag := languageTag is Win32Handle ? NumGet(languageTag, "ptr") : languageTag

        result := ComCall(6, this, "ptr", languageTag, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TextReverseConversionGenerator(result_)
    }
}
