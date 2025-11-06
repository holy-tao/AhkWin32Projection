#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method that enables VDS to determine whether the hardware provider manages a specified LUN.
 * @see https://docs.microsoft.com/windows/win32/api//vdshwprv/nn-vdshwprv-ivdshwproviderprivate
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsHwProviderPrivate extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsHwProviderPrivate
     * @type {Guid}
     */
    static IID => Guid("{98f17bf3-9f33-4f12-8714-8b4075092c2e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryIfCreatedLun"]

    /**
     * 
     * @param {PWSTR} pwszDevicePath 
     * @param {Pointer<VDS_LUN_INFORMATION>} pVdsLunInformation 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdshwproviderprivate-queryifcreatedlun
     */
    QueryIfCreatedLun(pwszDevicePath, pVdsLunInformation) {
        pwszDevicePath := pwszDevicePath is String ? StrPtr(pwszDevicePath) : pwszDevicePath

        pLunId := Guid()
        result := ComCall(3, this, "ptr", pwszDevicePath, "ptr", pVdsLunInformation, "ptr", pLunId, "HRESULT")
        return pLunId
    }
}
