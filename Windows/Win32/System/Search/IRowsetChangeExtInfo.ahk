#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetChangeExtInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowsetChangeExtInfo
     * @type {Guid}
     */
    static IID => Guid("{0c733a8f-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOriginalRow", "GetPendingColumns"]

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} hRow 
     * @param {Pointer<Pointer>} phRowOriginal 
     * @returns {HRESULT} 
     */
    GetOriginalRow(hReserved, hRow, phRowOriginal) {
        phRowOriginalMarshal := phRowOriginal is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", hReserved, "ptr", hRow, phRowOriginalMarshal, phRowOriginal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} hRow 
     * @param {Integer} cColumnOrdinals 
     * @param {Pointer<Integer>} rgiOrdinals 
     * @param {Pointer<Integer>} rgColumnStatus 
     * @returns {HRESULT} 
     */
    GetPendingColumns(hReserved, hRow, cColumnOrdinals, rgiOrdinals, rgColumnStatus) {
        rgiOrdinalsMarshal := rgiOrdinals is VarRef ? "uint*" : "ptr"
        rgColumnStatusMarshal := rgColumnStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", hReserved, "ptr", hRow, "uint", cColumnOrdinals, rgiOrdinalsMarshal, rgiOrdinals, rgColumnStatusMarshal, rgColumnStatus, "HRESULT")
        return result
    }
}
