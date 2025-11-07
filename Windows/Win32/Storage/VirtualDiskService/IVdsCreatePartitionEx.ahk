#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVdsAsync.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates a partition on a basic disk.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdscreatepartitionex
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsCreatePartitionEx extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsCreatePartitionEx
     * @type {Guid}
     */
    static IID => Guid("{9882f547-cfc3-420b-9750-00dfbec50662}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePartitionEx"]

    /**
     * 
     * @param {Integer} ullOffset 
     * @param {Integer} ullSize 
     * @param {Integer} ulAlign 
     * @param {Pointer<CREATE_PARTITION_PARAMETERS>} para 
     * @returns {IVdsAsync} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdscreatepartitionex-createpartitionex
     */
    CreatePartitionEx(ullOffset, ullSize, ulAlign, para) {
        result := ComCall(3, this, "uint", ullOffset, "uint", ullSize, "uint", ulAlign, "ptr", para, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }
}
