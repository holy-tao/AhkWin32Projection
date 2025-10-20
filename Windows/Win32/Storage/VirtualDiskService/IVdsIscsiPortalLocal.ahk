#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for setting local-initiator-specific IPSEC pre-shared keys on an iSCSI portal.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsiscsiportallocal
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsIscsiPortalLocal extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsIscsiPortalLocal
     * @type {Guid}
     */
    static IID => Guid("{ad837c28-52c1-421d-bf04-fae7da665396}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetIpsecSecurityLocal"]

    /**
     * 
     * @param {Integer} ullSecurityFlags 
     * @param {Pointer<VDS_ISCSI_IPSEC_KEY>} pIpsecKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsiscsiportallocal-setipsecsecuritylocal
     */
    SetIpsecSecurityLocal(ullSecurityFlags, pIpsecKey) {
        result := ComCall(3, this, "uint", ullSecurityFlags, "ptr", pIpsecKey, "HRESULT")
        return result
    }
}
