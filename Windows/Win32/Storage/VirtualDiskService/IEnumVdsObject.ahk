#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumVdsObject.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enumerates through a set of VDS objects of a given type. Objects can be providers, subsystems, controllers, LUNs, LUN plexes, drives, disk packs, disks, volumes, or volume plexes.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ienumvdsobject
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IEnumVdsObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumVdsObject
     * @type {Guid}
     */
    static IID => Guid("{118610b7-8d94-4030-b5b8-500889788e4e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<IUnknown>} ppObjectArray 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ienumvdsobject-next
     */
    Next(celt, ppObjectArray, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", ppObjectArray, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ienumvdsobject-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ienumvdsobject-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumVdsObject} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ienumvdsobject-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }
}
