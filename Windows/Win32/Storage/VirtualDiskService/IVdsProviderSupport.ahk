#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method to indicate what versions of the VDS interfaces are supported by the provider.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsprovidersupport
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsProviderSupport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsProviderSupport
     * @type {Guid}
     */
    static IID => Guid("{1732be13-e8f9-4a03-bfbc-5f616aa66ce1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVersionSupport"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsprovidersupport-getversionsupport
     */
    GetVersionSupport() {
        result := ComCall(3, this, "uint*", &ulVersionSupport := 0, "HRESULT")
        return ulVersionSupport
    }
}
