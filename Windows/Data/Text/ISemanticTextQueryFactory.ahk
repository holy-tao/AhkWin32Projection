#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SemanticTextQuery.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class ISemanticTextQueryFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISemanticTextQueryFactory
     * @type {Guid}
     */
    static IID => Guid("{238c0503-f995-4587-8777-a2b7d80acfef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithLanguage"]

    /**
     * Create Extended Stored Procedures
     * @param {HSTRING} aqsFilter 
     * @returns {SemanticTextQuery} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(aqsFilter) {
        if(aqsFilter is String) {
            pin := HSTRING.Create(aqsFilter)
            aqsFilter := pin.Value
        }
        aqsFilter := aqsFilter is Win32Handle ? NumGet(aqsFilter, "ptr") : aqsFilter

        result := ComCall(6, this, "ptr", aqsFilter, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SemanticTextQuery(result_)
    }

    /**
     * 
     * @param {HSTRING} aqsFilter 
     * @param {HSTRING} filterLanguage 
     * @returns {SemanticTextQuery} 
     */
    CreateWithLanguage(aqsFilter, filterLanguage) {
        if(aqsFilter is String) {
            pin := HSTRING.Create(aqsFilter)
            aqsFilter := pin.Value
        }
        aqsFilter := aqsFilter is Win32Handle ? NumGet(aqsFilter, "ptr") : aqsFilter
        if(filterLanguage is String) {
            pin := HSTRING.Create(filterLanguage)
            filterLanguage := pin.Value
        }
        filterLanguage := filterLanguage is Win32Handle ? NumGet(filterLanguage, "ptr") : filterLanguage

        result := ComCall(7, this, "ptr", aqsFilter, "ptr", filterLanguage, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SemanticTextQuery(result_)
    }
}
