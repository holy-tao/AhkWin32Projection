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
     * Retrieves the type of the hardware provider.
     * @returns {Integer} A pointer to a caller-allocated variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_hwprovider_type">VDS_HWPROVIDER_TYPE</a> enumeration value that specifies the hardware provider type. This parameter is required and cannot be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdshwprovidertype2-getprovidertype2
     */
    GetProviderType2() {
        result := ComCall(3, this, "int*", &pType := 0, "HRESULT")
        return pType
    }
}
