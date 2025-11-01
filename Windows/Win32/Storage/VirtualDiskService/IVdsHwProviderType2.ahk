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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProviderType2"]

    /**
     * 
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdshwprovidertype2-getprovidertype2
     */
    GetProviderType2(pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pTypeMarshal, pType, "HRESULT")
        return result
    }
}
