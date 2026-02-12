#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\NumeralSystemTranslator.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization.NumberFormatting
 * @version WindowsRuntime 1.4
 */
class INumeralSystemTranslatorFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INumeralSystemTranslatorFactory
     * @type {Guid}
     */
    static IID => Guid("{9630c8da-36ef-4d88-a85c-6f0d98d620a6}")

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
     * @param {IIterable<HSTRING>} languages 
     * @returns {NumeralSystemTranslator} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(languages) {
        result := ComCall(6, this, "ptr", languages, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NumeralSystemTranslator(result_)
    }
}
