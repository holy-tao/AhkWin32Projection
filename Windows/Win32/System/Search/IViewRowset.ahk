#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IViewRowset extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IViewRowset
     * @type {Guid}
     */
    static IID => Guid("{0c733a97-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSpecification", "OpenViewRowset"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppObject 
     * @returns {HRESULT} 
     */
    GetSpecification(riid, ppObject) {
        result := ComCall(3, this, "ptr", riid, "ptr*", ppObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppRowset 
     * @returns {HRESULT} 
     */
    OpenViewRowset(pUnkOuter, riid, ppRowset) {
        result := ComCall(4, this, "ptr", pUnkOuter, "ptr", riid, "ptr*", ppRowset, "HRESULT")
        return result
    }
}
