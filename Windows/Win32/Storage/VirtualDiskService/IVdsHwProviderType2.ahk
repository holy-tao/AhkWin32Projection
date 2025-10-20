#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is not implemented. Use IVdsHwProviderType instead.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdshwprovidertype2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsHwProviderType2 extends IUnknown{
    /**
     * The interface identifier for IVdsHwProviderType2
     * @type {Guid}
     */
    static IID => Guid("{8190236f-c4d0-4e81-8011-d69512fcc984}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} pType 
     * @returns {HRESULT} 
     */
    GetProviderType2(pType) {
        result := ComCall(3, this, "int*", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
