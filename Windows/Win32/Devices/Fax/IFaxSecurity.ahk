#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxSecurity configuration object is used by a fax client application to configure the security on a fax server, and permits the calling application to set and retrieve a security descriptor for the fax server.
 * @remarks
 * 
  * Only an administrator with permissions can configure the security of the fax server. For more information, see <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a>.
  * 
  * A default implementation of <b>IFaxSecurity</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity">FaxSecurity</a> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxsecurity
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxSecurity extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxSecurity
     * @type {Guid}
     */
    static IID => Guid("{77b508c1-09c0-47a2-91eb-fce7fdf2690e}")

    /**
     * The class identifier for FaxSecurity
     * @type {Guid}
     */
    static CLSID => Guid("{10c4ddde-abf0-43df-964f-7f3ac21a4c7b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Descriptor", "put_Descriptor", "get_GrantedRights", "Refresh", "Save", "get_InformationType", "put_InformationType"]

    /**
     * 
     * @param {Pointer<VARIANT>} pvDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsecurity-get_descriptor
     */
    get_Descriptor(pvDescriptor) {
        result := ComCall(7, this, "ptr", pvDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsecurity-put_descriptor
     */
    put_Descriptor(vDescriptor) {
        result := ComCall(8, this, "ptr", vDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pGrantedRights 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsecurity-get_grantedrights
     */
    get_GrantedRights(pGrantedRights) {
        result := ComCall(9, this, "int*", pGrantedRights, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsecurity-refresh
     */
    Refresh() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsecurity-save
     */
    Save() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plInformationType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsecurity-get_informationtype
     */
    get_InformationType(plInformationType) {
        result := ComCall(12, this, "int*", plInformationType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lInformationType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsecurity-put_informationtype
     */
    put_InformationType(lInformationType) {
        result := ComCall(13, this, "int", lInformationType, "HRESULT")
        return result
    }
}
