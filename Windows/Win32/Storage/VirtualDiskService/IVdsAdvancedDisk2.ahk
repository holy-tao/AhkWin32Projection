#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method to change partition types.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsadvanceddisk2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsAdvancedDisk2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsAdvancedDisk2
     * @type {Guid}
     */
    static IID => Guid("{9723f420-9355-42de-ab66-e31bb15beeac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ChangePartitionType"]

    /**
     * 
     * @param {Integer} ullOffset 
     * @param {BOOL} bForce 
     * @param {Pointer<CHANGE_PARTITION_TYPE_PARAMETERS>} para 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsadvanceddisk2-changepartitiontype
     */
    ChangePartitionType(ullOffset, bForce, para) {
        result := ComCall(3, this, "uint", ullOffset, "int", bForce, "ptr", para, "HRESULT")
        return result
    }
}
