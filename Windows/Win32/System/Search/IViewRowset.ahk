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
     * @returns {IUnknown} 
     */
    GetSpecification(riid) {
        result := ComCall(3, this, "ptr", riid, "ptr*", &ppObject := 0, "HRESULT")
        return IUnknown(ppObject)
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    OpenViewRowset(pUnkOuter, riid) {
        result := ComCall(4, this, "ptr", pUnkOuter, "ptr", riid, "ptr*", &ppRowset := 0, "HRESULT")
        return IUnknown(ppRowset)
    }
}
