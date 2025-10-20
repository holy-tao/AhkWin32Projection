#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to query and configure iSCSI targets and portals on a subsystem.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdssubsystemiscsi
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsSubSystemIscsi extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsSubSystemIscsi
     * @type {Guid}
     */
    static IID => Guid("{0027346f-40d0-4b45-8cec-5906dc0380c8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryTargets", "QueryPortals", "CreateTarget", "SetIpsecGroupPresharedKey"]

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdssubsystemiscsi-querytargets
     */
    QueryTargets(ppEnum) {
        result := ComCall(3, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdssubsystemiscsi-queryportals
     */
    QueryPortals(ppEnum) {
        result := ComCall(4, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszIscsiName 
     * @param {PWSTR} pwszFriendlyName 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdssubsystemiscsi-createtarget
     */
    CreateTarget(pwszIscsiName, pwszFriendlyName, ppAsync) {
        pwszIscsiName := pwszIscsiName is String ? StrPtr(pwszIscsiName) : pwszIscsiName
        pwszFriendlyName := pwszFriendlyName is String ? StrPtr(pwszFriendlyName) : pwszFriendlyName

        result := ComCall(5, this, "ptr", pwszIscsiName, "ptr", pwszFriendlyName, "ptr*", ppAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VDS_ISCSI_IPSEC_KEY>} pIpsecKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdssubsystemiscsi-setipsecgrouppresharedkey
     */
    SetIpsecGroupPresharedKey(pIpsecKey) {
        result := ComCall(6, this, "ptr", pIpsecKey, "HRESULT")
        return result
    }
}
