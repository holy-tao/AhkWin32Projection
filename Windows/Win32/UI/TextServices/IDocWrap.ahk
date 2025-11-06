#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IDocWrap extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDocWrap
     * @type {Guid}
     */
    static IID => Guid("{dcd285fe-0be0-43bd-99c9-aaaec513c555}")

    /**
     * The class identifier for DocWrap
     * @type {Guid}
     */
    static CLSID => Guid("{bf426f7e-7a5e-44d6-830c-a390ea9462a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDoc", "GetWrappedDoc"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     */
    SetDoc(riid, punk) {
        result := ComCall(3, this, "ptr", riid, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    GetWrappedDoc(riid) {
        result := ComCall(4, this, "ptr", riid, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }
}
