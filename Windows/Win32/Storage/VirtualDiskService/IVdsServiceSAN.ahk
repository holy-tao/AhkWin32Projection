#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for managing disk online and offline SAN policy for the operating system.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsservicesan
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsServiceSAN extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsServiceSAN
     * @type {Guid}
     */
    static IID => Guid("{fc5d23e8-a88b-41a5-8de0-2d2f73c5a630}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSANPolicy", "SetSANPolicy"]

    /**
     * 
     * @param {Pointer<Integer>} pSanPolicy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservicesan-getsanpolicy
     */
    GetSANPolicy(pSanPolicy) {
        pSanPolicyMarshal := pSanPolicy is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pSanPolicyMarshal, pSanPolicy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SanPolicy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservicesan-setsanpolicy
     */
    SetSANPolicy(SanPolicy) {
        result := ComCall(4, this, "int", SanPolicy, "HRESULT")
        return result
    }
}
