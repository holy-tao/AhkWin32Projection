#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods to get an IPropertyStore object.
 * @remarks
 * 
  * This interface is typically obtained through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-bindtoobject">IShellFolder::BindToObject</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem-bindtohandler">IShellItem::BindToHandler</a>. It is useful for data source implementers who want to avoid the additional overhead of creating a property store through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertystore">IShellItem2::GetPropertyStore</a>. However, <b>IShellItem2::GetPropertyStore</b> is the recommended method to obtain a property store unless you are implementing a data source through a Shell folder extension.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-ipropertystorefactory
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPropertyStoreFactory extends IUnknown{
    /**
     * The interface identifier for IPropertyStoreFactory
     * @type {Guid}
     */
    static IID => Guid("{bc110b6d-57e8-4148-a9c6-91015ab2f3a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} flags 
     * @param {Pointer<IUnknown>} pUnkFactory 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetPropertyStore(flags, pUnkFactory, riid, ppv) {
        result := ComCall(3, this, "int", flags, "ptr", pUnkFactory, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} rgKeys 
     * @param {Integer} cKeys 
     * @param {Integer} flags 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetPropertyStoreForKeys(rgKeys, cKeys, flags, riid, ppv) {
        result := ComCall(4, this, "ptr", rgKeys, "uint", cKeys, "int", flags, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
