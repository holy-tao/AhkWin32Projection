#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVdsAsync.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to support volume shrinking.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsvolumeshrink
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsVolumeShrink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsVolumeShrink
     * @type {Guid}
     */
    static IID => Guid("{d68168c9-82a2-4f85-b6e9-74707c49a58f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryMaxReclaimableBytes", "Shrink"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumeshrink-querymaxreclaimablebytes
     */
    QueryMaxReclaimableBytes() {
        result := ComCall(3, this, "uint*", &pullMaxNumberOfReclaimableBytes := 0, "HRESULT")
        return pullMaxNumberOfReclaimableBytes
    }

    /**
     * 
     * @param {Integer} ullDesiredNumberOfReclaimableBytes 
     * @param {Integer} ullMinNumberOfReclaimableBytes 
     * @returns {IVdsAsync} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumeshrink-shrink
     */
    Shrink(ullDesiredNumberOfReclaimableBytes, ullMinNumberOfReclaimableBytes) {
        result := ComCall(4, this, "uint", ullDesiredNumberOfReclaimableBytes, "uint", ullMinNumberOfReclaimableBytes, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }
}
