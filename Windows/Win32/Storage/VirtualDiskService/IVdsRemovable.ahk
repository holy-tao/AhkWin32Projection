#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to query and eject a removable disk, such as a CD-ROM.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsremovable
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsRemovable extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsRemovable
     * @type {Guid}
     */
    static IID => Guid("{0316560b-5db4-4ed9-bbb5-213436ddc0d9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryMedia", "Eject"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsremovable-querymedia
     */
    QueryMedia() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsremovable-eject
     */
    Eject() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
