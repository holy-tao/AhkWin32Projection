#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PrintPageRange.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class IPrintPageRangeFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintPageRangeFactory
     * @type {Guid}
     */
    static IID => Guid("{408fd45f-e047-5f85-7129-fb085a4fad14}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithSinglePage"]

    /**
     * Create Extended Stored Procedures
     * @param {Integer} firstPage 
     * @param {Integer} lastPage 
     * @returns {PrintPageRange} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(firstPage, lastPage) {
        result := ComCall(6, this, "int", firstPage, "int", lastPage, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintPageRange(result_)
    }

    /**
     * 
     * @param {Integer} page_ 
     * @returns {PrintPageRange} 
     */
    CreateWithSinglePage(page_) {
        result := ComCall(7, this, "int", page_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintPageRange(result_)
    }
}
