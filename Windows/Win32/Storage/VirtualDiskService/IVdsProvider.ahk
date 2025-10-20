#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Returns the properties of a hardware or software provider.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsprovider
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsProvider extends IUnknown{
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
     * 
     * @param {Pointer<VDS_PROVIDER_PROP>} pProviderProp 
     * @returns {HRESULT} 
     */
    GetProperties(pProviderProp) {
        result := ComCall(3, this, "ptr", pProviderProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
