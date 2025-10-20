#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IPropertyStoreFactory.ahk

/**
 * Exposes a method to create a specified IPropertyStore object in circumstances where property access is potentially slow.
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-idelayedpropertystorefactory
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IDelayedPropertyStoreFactory extends IPropertyStoreFactory{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDelayedPropertyStoreFactory
     * @type {Guid}
     */
    static IID => Guid("{40d4577f-e237-4bdb-bd69-58f089431b6a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDelayedPropertyStore"]

    /**
     * 
     * @param {Integer} flags 
     * @param {Integer} dwStoreId 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-idelayedpropertystorefactory-getdelayedpropertystore
     */
    GetDelayedPropertyStore(flags, dwStoreId, riid, ppv) {
        result := ComCall(5, this, "int", flags, "uint", dwStoreId, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }
}
