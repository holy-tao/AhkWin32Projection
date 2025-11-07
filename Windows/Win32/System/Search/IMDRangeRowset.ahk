#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IMDRangeRowset extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDRangeRowset
     * @type {Guid}
     */
    static IID => Guid("{0c733aa0-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRangeRowset"]

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer} ulStartCell 
     * @param {Pointer} ulEndCell 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @returns {IUnknown} 
     */
    GetRangeRowset(pUnkOuter, ulStartCell, ulEndCell, riid, cPropertySets, rgPropertySets) {
        result := ComCall(3, this, "ptr", pUnkOuter, "ptr", ulStartCell, "ptr", ulEndCell, "ptr", riid, "uint", cPropertySets, "ptr", rgPropertySets, "ptr*", &ppRowset := 0, "HRESULT")
        return IUnknown(ppRowset)
    }
}
