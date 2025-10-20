#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IPersist.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IPersistPropertyBag2 extends IPersist{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPersistPropertyBag2
     * @type {Guid}
     */
    static IID => Guid("{22f55881-280b-11d0-a8a9-00a0c90c2004}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitNew", "Load", "Save", "IsDirty"]

    /**
     * 
     * @returns {HRESULT} 
     */
    InitNew() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPropertyBag2} pPropBag 
     * @param {IErrorLog} pErrLog 
     * @returns {HRESULT} 
     */
    Load(pPropBag, pErrLog) {
        result := ComCall(5, this, "ptr", pPropBag, "ptr", pErrLog, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPropertyBag2} pPropBag 
     * @param {BOOL} fClearDirty 
     * @param {BOOL} fSaveAllProperties 
     * @returns {HRESULT} 
     */
    Save(pPropBag, fClearDirty, fSaveAllProperties) {
        result := ComCall(6, this, "ptr", pPropBag, "int", fClearDirty, "int", fSaveAllProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsDirty() {
        result := ComCall(7, this, "int")
        return result
    }
}
