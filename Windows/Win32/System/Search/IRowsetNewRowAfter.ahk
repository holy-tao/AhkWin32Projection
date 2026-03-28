#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetNewRowAfter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowsetNewRowAfter
     * @type {Guid}
     */
    static IID => Guid("{0c733a71-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetNewDataAfter"]

    /**
     * 
     * @param {Pointer} hChapter 
     * @param {Integer} cbbmPrevious 
     * @param {Pointer<Integer>} pbmPrevious 
     * @param {HACCESSOR} _hAccessor 
     * @param {Pointer<Integer>} pData 
     * @returns {Pointer} 
     */
    SetNewDataAfter(hChapter, cbbmPrevious, pbmPrevious, _hAccessor, pData) {
        _hAccessor := _hAccessor is Win32Handle ? NumGet(_hAccessor, "ptr") : _hAccessor

        pbmPreviousMarshal := pbmPrevious is VarRef ? "char*" : "ptr"
        pDataMarshal := pData is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", hChapter, "uint", cbbmPrevious, pbmPreviousMarshal, pbmPrevious, "ptr", _hAccessor, pDataMarshal, pData, "ptr*", &phRow := 0, "HRESULT")
        return phRow
    }
}
