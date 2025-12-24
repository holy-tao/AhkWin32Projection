#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Registers providers with VDS.
 * @see https://docs.microsoft.com/windows/win32/api//vdshwprv/nn-vdshwprv-ivdsadmin
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsAdmin extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsAdmin
     * @type {Guid}
     */
    static IID => Guid("{d188e97d-85aa-4d33-abc6-26299a10ffc1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterProvider", "UnregisterProvider"]

    /**
     * Registers the specified hardware provider with VDS. Hardware providers call this method.
     * @param {Guid} providerId The GUID of the hardware provider.
     * @param {Guid} providerClsid The COM class identifier (Clsid) of the hardware provider.
     * @param {PWSTR} pwszName The name of the hardware provider as  a zero-terminated, human-readable string.
     * @param {Integer} type The provider types enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_provider_type">VDS_PROVIDER_TYPE</a>. 
     *      Use the <b>VDS_PT_HARDWARE</b> value to register a hardware provider with VDS.
     * @param {PWSTR} pwszMachineName The name of the computer on which the hardware provider executes; a null-terminated, human-readable string. 
     *      Use <b>NULL</b> to reference the current computer.
     * @param {PWSTR} pwszVersion The  version of the provider as a zero-terminated, human-readable string.
     * @param {Guid} guidVersionId The GUID for this version of the provider.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_ALREADY_REGISTERED</b></dt>
     * <dt>0x80042403L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>providerId</i> is already registered. Only one version of a provider can be 
     *        registered at any given time.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vdshwprv/nf-vdshwprv-ivdsadmin-registerprovider
     */
    RegisterProvider(providerId, providerClsid, pwszName, type, pwszMachineName, pwszVersion, guidVersionId) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName
        pwszMachineName := pwszMachineName is String ? StrPtr(pwszMachineName) : pwszMachineName
        pwszVersion := pwszVersion is String ? StrPtr(pwszVersion) : pwszVersion

        result := ComCall(3, this, "ptr", providerId, "ptr", providerClsid, "ptr", pwszName, "int", type, "ptr", pwszMachineName, "ptr", pwszVersion, "ptr", guidVersionId, "HRESULT")
        return result
    }

    /**
     * Removes VDS provider registration data. Hardware providers call this method.
     * @param {Guid} providerId The GUID of the provider.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is being used.
     * @see https://docs.microsoft.com/windows/win32/api//vdshwprv/nf-vdshwprv-ivdsadmin-unregisterprovider
     */
    UnregisterProvider(providerId) {
        result := ComCall(4, this, "ptr", providerId, "HRESULT")
        return result
    }
}
