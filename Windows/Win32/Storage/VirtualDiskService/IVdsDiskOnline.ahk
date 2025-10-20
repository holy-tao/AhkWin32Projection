#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to bring a disk online and take it offline.Windows Vista:  This interface is not supported until Windows Vista with Service Pack 1 (SP1). Use IVdsDisk2 instead.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsdiskonline
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsDiskOnline extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsDiskOnline
     * @type {Guid}
     */
    static IID => Guid("{90681b1d-6a7f-48e8-9061-31b7aa125322}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Online", "Offline"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsdiskonline-online
     */
    Online() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsdiskonline-offline
     */
    Offline() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
