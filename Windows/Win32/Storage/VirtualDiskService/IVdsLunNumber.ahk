#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method to query the LUN number for a LUN.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdslunnumber
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsLunNumber extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsLunNumber
     * @type {Guid}
     */
    static IID => Guid("{d3f95e46-54b3-41f9-b678-0f1871443a08}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLunNumber"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslunnumber-getlunnumber
     */
    GetLunNumber() {
        result := ComCall(3, this, "uint*", &pulLunNumber := 0, "HRESULT")
        return pulLunNumber
    }
}
