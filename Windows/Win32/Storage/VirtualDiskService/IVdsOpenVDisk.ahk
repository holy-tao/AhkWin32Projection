#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods for managing a virtual disk.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsopenvdisk
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsOpenVDisk extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsOpenVDisk
     * @type {Guid}
     */
    static IID => Guid("{75c8f324-f715-4fe3-a28e-f9011b61a4a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Attach", "Detach", "DetachAndDelete", "Compact", "Merge", "Expand"]

    /**
     * 
     * @param {PWSTR} pStringSecurityDescriptor 
     * @param {Integer} Flags 
     * @param {Integer} ProviderSpecificFlags 
     * @param {Integer} TimeoutInMs 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsopenvdisk-attach
     */
    Attach(pStringSecurityDescriptor, Flags, ProviderSpecificFlags, TimeoutInMs, ppAsync) {
        pStringSecurityDescriptor := pStringSecurityDescriptor is String ? StrPtr(pStringSecurityDescriptor) : pStringSecurityDescriptor

        result := ComCall(3, this, "ptr", pStringSecurityDescriptor, "int", Flags, "uint", ProviderSpecificFlags, "uint", TimeoutInMs, "ptr*", ppAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Integer} ProviderSpecificFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsopenvdisk-detach
     */
    Detach(Flags, ProviderSpecificFlags) {
        result := ComCall(4, this, "int", Flags, "uint", ProviderSpecificFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Integer} ProviderSpecificFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsopenvdisk-detachanddelete
     */
    DetachAndDelete(Flags, ProviderSpecificFlags) {
        result := ComCall(5, this, "int", Flags, "uint", ProviderSpecificFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Integer} Reserved 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsopenvdisk-compact
     */
    Compact(Flags, Reserved, ppAsync) {
        result := ComCall(6, this, "int", Flags, "uint", Reserved, "ptr*", ppAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Integer} MergeDepth 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsopenvdisk-merge
     */
    Merge(Flags, MergeDepth, ppAsync) {
        result := ComCall(7, this, "int", Flags, "uint", MergeDepth, "ptr*", ppAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Integer} NewSize 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsopenvdisk-expand
     */
    Expand(Flags, NewSize, ppAsync) {
        result := ComCall(8, this, "int", Flags, "uint", NewSize, "ptr*", ppAsync, "HRESULT")
        return result
    }
}
