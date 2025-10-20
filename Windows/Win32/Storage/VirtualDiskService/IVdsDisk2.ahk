#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method to set the SAN mode of a disk to offline or online.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsdisk2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsDisk2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsDisk2
     * @type {Guid}
     */
    static IID => Guid("{40f73c8b-687d-4a13-8d96-3d7f2e683936}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSANMode"]

    /**
     * 
     * @param {BOOL} bEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsdisk2-setsanmode
     */
    SetSANMode(bEnable) {
        result := ComCall(3, this, "int", bEnable, "HRESULT")
        return result
    }
}
