#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IGetRow extends IUnknown{
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
     * 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @param {Pointer} hRow 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    GetRowFromHROW(pUnkOuter, hRow, riid, ppUnk) {
        result := ComCall(3, this, "ptr", pUnkOuter, "ptr", hRow, "ptr", riid, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hRow 
     * @param {Pointer<PWSTR>} ppwszURL 
     * @returns {HRESULT} 
     */
    GetURLFromHROW(hRow, ppwszURL) {
        result := ComCall(4, this, "ptr", hRow, "ptr", ppwszURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
