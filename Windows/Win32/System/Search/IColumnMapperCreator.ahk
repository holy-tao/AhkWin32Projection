#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IColumnMapper.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Contains a method to retrieves a column mapper object.
 * @see https://docs.microsoft.com/windows/win32/api//indexsrv/nn-indexsrv-icolumnmappercreator
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IColumnMapperCreator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IColumnMapperCreator
     * @type {Guid}
     */
    static IID => Guid("{0b63e37b-9ccc-11d0-bcdb-00805fccce04}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetColumnMapper"]

    /**
     * 
     * @param {PWSTR} wcsMachineName 
     * @param {PWSTR} wcsCatalogName 
     * @returns {IColumnMapper} 
     * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nf-indexsrv-icolumnmappercreator-getcolumnmapper
     */
    GetColumnMapper(wcsMachineName, wcsCatalogName) {
        wcsMachineName := wcsMachineName is String ? StrPtr(wcsMachineName) : wcsMachineName
        wcsCatalogName := wcsCatalogName is String ? StrPtr(wcsCatalogName) : wcsCatalogName

        result := ComCall(3, this, "ptr", wcsMachineName, "ptr", wcsCatalogName, "ptr*", &ppColumnMapper := 0, "HRESULT")
        return IColumnMapper(ppColumnMapper)
    }
}
