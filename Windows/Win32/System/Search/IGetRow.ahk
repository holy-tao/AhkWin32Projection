#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IGetRow extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGetRow
     * @type {Guid}
     */
    static IID => Guid("{0c733aaf-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRowFromHROW", "GetURLFromHROW"]

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer} hRow 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    GetRowFromHROW(pUnkOuter, hRow, riid) {
        result := ComCall(3, this, "ptr", pUnkOuter, "ptr", hRow, "ptr", riid, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * 
     * @param {Pointer} hRow 
     * @returns {PWSTR} 
     */
    GetURLFromHROW(hRow) {
        result := ComCall(4, this, "ptr", hRow, "ptr*", &ppwszURL := 0, "HRESULT")
        return ppwszURL
    }
}
