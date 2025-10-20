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
     * 
     * @param {Pointer<UInt32>} ulVersionSupport 
     * @returns {HRESULT} 
     */
    GetVersionSupport(ulVersionSupport) {
        result := ComCall(3, this, "uint*", ulVersionSupport, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
