#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IReadData extends IUnknown{
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
     * 
     * @param {Pointer} hChapter 
     * @param {Pointer} cbBookmark 
     * @param {Pointer<Byte>} pBookmark 
     * @param {Pointer} lRowsOffset 
     * @param {HACCESSOR} hAccessor 
     * @param {Pointer} cRows 
     * @param {Pointer<UIntPtr>} pcRowsObtained 
     * @param {Pointer<Byte>} ppFixedData 
     * @param {Pointer<UIntPtr>} pcbVariableTotal 
     * @param {Pointer<Byte>} ppVariableData 
     * @returns {HRESULT} 
     */
    ReadData(hChapter, cbBookmark, pBookmark, lRowsOffset, hAccessor, cRows, pcRowsObtained, ppFixedData, pcbVariableTotal, ppVariableData) {
        hAccessor := hAccessor is Win32Handle ? NumGet(hAccessor, "ptr") : hAccessor

        result := ComCall(3, this, "ptr", hChapter, "ptr", cbBookmark, "char*", pBookmark, "ptr", lRowsOffset, "ptr", hAccessor, "ptr", cRows, "ptr*", pcRowsObtained, "char*", ppFixedData, "ptr*", pcbVariableTotal, "char*", ppVariableData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hChapter 
     * @returns {HRESULT} 
     */
    ReleaseChapter(hChapter) {
        result := ComCall(4, this, "ptr", hChapter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
