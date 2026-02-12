#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class IPhotoImportFindItemsResult2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoImportFindItemsResult2
     * @type {Guid}
     */
    static IID => Guid("{fbdd6a3b-ecf9-406a-815e-5015625b0a88}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddItemsInDateRangeToSelection"]

    /**
     * 
     * @param {DateTime} rangeStart 
     * @param {TimeSpan} rangeLength 
     * @returns {HRESULT} 
     */
    AddItemsInDateRangeToSelection(rangeStart, rangeLength) {
        result := ComCall(6, this, "ptr", rangeStart, "ptr", rangeLength, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
