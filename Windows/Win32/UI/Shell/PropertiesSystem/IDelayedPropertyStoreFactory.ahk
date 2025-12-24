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
     * Gets an IPropertyStore interface object, as specified.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a></b>
     * 
     * The GPS_XXX flags that modify the store that is returned. See <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a>.
     * @param {Integer} dwStoreId Type: <b>DWORD</b>
     * 
     * The property store ID. Valid values are.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the desired IID.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-idelayedpropertystorefactory-getdelayedpropertystore
     */
    GetDelayedPropertyStore(flags, dwStoreId, riid) {
        result := ComCall(5, this, "int", flags, "uint", dwStoreId, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
