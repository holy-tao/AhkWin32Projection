#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVdsAsync.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method to create aligned volumes on a pack.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdspack2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsPack2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsPack2
     * @type {Guid}
     */
    static IID => Guid("{13b50bff-290a-47dd-8558-b7c58db1a71a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateVolume2"]

    /**
     * 
     * @param {Integer} type 
     * @param {Pointer<VDS_INPUT_DISK>} pInputDiskArray 
     * @param {Integer} lNumberOfDisks 
     * @param {Integer} ulStripeSize 
     * @param {Integer} ulAlign 
     * @returns {IVdsAsync} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdspack2-createvolume2
     */
    CreateVolume2(type, pInputDiskArray, lNumberOfDisks, ulStripeSize, ulAlign) {
        result := ComCall(3, this, "int", type, "ptr", pInputDiskArray, "int", lNumberOfDisks, "uint", ulStripeSize, "uint", ulAlign, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }
}
