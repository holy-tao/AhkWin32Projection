#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetNextRowset extends IUnknown{
    /**
     * The interface identifier for IRowsetNextRowset
     * @type {Guid}
     */
    static IID => Guid("{0c733a72-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppNextRowset 
     * @returns {HRESULT} 
     */
    GetNextRowset(pUnkOuter, riid, ppNextRowset) {
        result := ComCall(3, this, "ptr", pUnkOuter, "ptr", riid, "ptr", ppNextRowset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
