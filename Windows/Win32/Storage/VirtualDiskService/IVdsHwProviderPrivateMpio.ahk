#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method that sets the status of paths originating from a particular HBA port to the provider.
 * @see https://docs.microsoft.com/windows/win32/api//vdshwprv/nn-vdshwprv-ivdshwproviderprivatempio
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsHwProviderPrivateMpio extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsHwProviderPrivateMpio
     * @type {Guid}
     */
    static IID => Guid("{310a7715-ac2b-4c6f-9827-3d742f351676}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAllPathStatusesFromHbaPort"]

    /**
     * 
     * @param {VDS_HBAPORT_PROP} hbaPortProp 
     * @param {Integer} status 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdshwproviderprivatempio-setallpathstatusesfromhbaport
     */
    SetAllPathStatusesFromHbaPort(hbaPortProp, status) {
        result := ComCall(3, this, "ptr", hbaPortProp, "int", status, "HRESULT")
        return result
    }
}
