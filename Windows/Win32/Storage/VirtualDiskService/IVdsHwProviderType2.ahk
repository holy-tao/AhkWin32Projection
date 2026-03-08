#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVdsHwProviderType2 interface (vdshwprv.h) is not implemented. Use IVdsHwProviderType interface (vds.h) instead.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdshwprovidertype2
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
     * The IVdsHwProviderType2::GetProviderType2 (vdshwprv.h) method retrieves the type of the hardware provider.
     * @remarks
     * If the provider object supports the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdshwprovidertype2">IVdsHwProviderType2</a> interface, the server must call the <b>GetProviderType2</b> method on the provider object to retrieve the provider type and then return an HRESULT indicating failure or success.
     * @returns {Integer} A pointer to a caller-allocated variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_hwprovider_type">VDS_HWPROVIDER_TYPE</a> enumeration value that specifies the hardware provider type. This parameter is required and cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdshwprovidertype2-getprovidertype2
     */
    GetProviderType2() {
        result := ComCall(3, this, "int*", &pType := 0, "HRESULT")
        return pType
    }
}
