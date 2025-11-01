#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IMDDataset extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDDataset
     * @type {Guid}
     */
    static IID => Guid("{a07cccd1-8148-11d0-87bb-00c04fc33942}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FreeAxisInfo", "GetAxisInfo", "GetAxisRowset", "GetCellData", "GetSpecification"]

    /**
     * 
     * @param {Pointer} cAxes 
     * @param {Pointer<MDAXISINFO>} rgAxisInfo 
     * @returns {HRESULT} 
     */
    FreeAxisInfo(cAxes, rgAxisInfo) {
        result := ComCall(3, this, "ptr", cAxes, "ptr", rgAxisInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} pcAxes 
     * @param {Pointer<Pointer<MDAXISINFO>>} prgAxisInfo 
     * @returns {HRESULT} 
     */
    GetAxisInfo(pcAxes, prgAxisInfo) {
        pcAxesMarshal := pcAxes is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pcAxesMarshal, pcAxes, "ptr*", prgAxisInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer} iAxis 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @param {Pointer<IUnknown>} ppRowset 
     * @returns {HRESULT} 
     */
    GetAxisRowset(pUnkOuter, iAxis, riid, cPropertySets, rgPropertySets, ppRowset) {
        result := ComCall(5, this, "ptr", pUnkOuter, "ptr", iAxis, "ptr", riid, "uint", cPropertySets, "ptr", rgPropertySets, "ptr*", ppRowset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HACCESSOR} hAccessor 
     * @param {Pointer} ulStartCell 
     * @param {Pointer} ulEndCell 
     * @param {Pointer<Void>} pData 
     * @returns {HRESULT} 
     */
    GetCellData(hAccessor, ulStartCell, ulEndCell, pData) {
        hAccessor := hAccessor is Win32Handle ? NumGet(hAccessor, "ptr") : hAccessor

        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, "ptr", hAccessor, "ptr", ulStartCell, "ptr", ulEndCell, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppSpecification 
     * @returns {HRESULT} 
     */
    GetSpecification(riid, ppSpecification) {
        result := ComCall(7, this, "ptr", riid, "ptr*", ppSpecification, "HRESULT")
        return result
    }
}
