#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used by a fax client application to configure the security on a fax server; also permits the calling application to set and retrieve a security descriptor for the fax server.
 * @remarks
 * 
 * This interface is supported only on Windows Vista or later. For earlier versions of Windows use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxsecurity">IFaxSecurity</a>.
 * 
 * Only an administrator with permissions can configure the security of the fax server. For more information, see <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a>.
 * 
 * A default implementation is provided as <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity2">FaxSecurity2</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxsecurity2
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxSecurity2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxSecurity2
     * @type {Guid}
     */
    static IID => Guid("{17d851f4-d09b-48fc-99c9-8f24c4db9ab1}")

    /**
     * The class identifier for FaxSecurity2
     * @type {Guid}
     */
    static CLSID => Guid("{735c1248-ec89-4c30-a127-656e92e3c4ea}")

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
     * @type {VARIANT} 
     */
    Descriptor {
        get => this.get_Descriptor()
        set => this.put_Descriptor(value)
    }

    /**
     * @type {Integer} 
     */
    GrantedRights {
        get => this.get_GrantedRights()
    }

    /**
     * @type {Integer} 
     */
    InformationType {
        get => this.get_InformationType()
        set => this.put_InformationType(value)
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsecurity2-get_descriptor
     */
    get_Descriptor() {
        pvDescriptor := VARIANT()
        result := ComCall(7, this, "ptr", pvDescriptor, "HRESULT")
        return pvDescriptor
    }

    /**
     * 
     * @param {VARIANT} vDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsecurity2-put_descriptor
     */
    put_Descriptor(vDescriptor) {
        result := ComCall(8, this, "ptr", vDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsecurity2-get_grantedrights
     */
    get_GrantedRights() {
        result := ComCall(9, this, "int*", &pGrantedRights := 0, "HRESULT")
        return pGrantedRights
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsecurity2-refresh
     */
    Refresh() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsecurity2-save
     */
    Save() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsecurity2-get_informationtype
     */
    get_InformationType() {
        result := ComCall(12, this, "int*", &plInformationType := 0, "HRESULT")
        return plInformationType
    }

    /**
     * 
     * @param {Integer} lInformationType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxsecurity2-put_informationtype
     */
    put_InformationType(lInformationType) {
        result := ComCall(13, this, "int", lInformationType, "HRESULT")
        return result
    }
}
