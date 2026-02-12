#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IReadData extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IReadData
     * @type {Guid}
     */
    static IID => Guid("{0c733a6a-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadData", "ReleaseChapter"]

    /**
     * 
     * @param {Pointer} hChapter 
     * @param {Pointer} cbBookmark 
     * @param {Pointer<Integer>} pBookmark 
     * @param {Pointer} lRowsOffset 
     * @param {HACCESSOR} hAccessor_ 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer<Integer>>} ppFixedData 
     * @param {Pointer<Pointer>} pcbVariableTotal 
     * @param {Pointer<Pointer<Integer>>} ppVariableData 
     * @returns {Pointer} 
     */
    ReadData(hChapter, cbBookmark, pBookmark, lRowsOffset, hAccessor_, cRows, ppFixedData, pcbVariableTotal, ppVariableData) {
        hAccessor_ := hAccessor_ is Win32Handle ? NumGet(hAccessor_, "ptr") : hAccessor_

        pBookmarkMarshal := pBookmark is VarRef ? "char*" : "ptr"
        ppFixedDataMarshal := ppFixedData is VarRef ? "ptr*" : "ptr"
        pcbVariableTotalMarshal := pcbVariableTotal is VarRef ? "ptr*" : "ptr"
        ppVariableDataMarshal := ppVariableData is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", hChapter, "ptr", cbBookmark, pBookmarkMarshal, pBookmark, "ptr", lRowsOffset, "ptr", hAccessor_, "ptr", cRows, "ptr*", &pcRowsObtained := 0, ppFixedDataMarshal, ppFixedData, pcbVariableTotalMarshal, pcbVariableTotal, ppVariableDataMarshal, ppVariableData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcRowsObtained
    }

    /**
     * 
     * @param {Pointer} hChapter 
     * @returns {HRESULT} 
     */
    ReleaseChapter(hChapter) {
        result := ComCall(4, this, "ptr", hChapter, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
