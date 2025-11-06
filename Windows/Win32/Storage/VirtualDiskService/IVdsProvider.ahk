#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_PROVIDER_PROP.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Returns the properties of a hardware or software provider.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsprovider
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsProvider
     * @type {Guid}
     */
    static IID => Guid("{10c5e575-7984-4e81-a56b-431f5f92ae42}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties"]

    /**
     * 
     * @returns {VDS_PROVIDER_PROP} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsprovider-getproperties
     */
    GetProperties() {
        pProviderProp := VDS_PROVIDER_PROP()
        result := ComCall(3, this, "ptr", pProviderProp, "HRESULT")
        return pProviderProp
    }
}
