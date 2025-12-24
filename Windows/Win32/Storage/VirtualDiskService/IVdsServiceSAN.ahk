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
     * Gets the disk SAN policy for the operating system.
     * @returns {Integer} A pointer to a variable that receives a value from the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_san_policy">VDS_SAN_POLICY</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsservicesan-getsanpolicy
     */
    GetSANPolicy() {
        result := ComCall(3, this, "int*", &pSanPolicy := 0, "HRESULT")
        return pSanPolicy
    }

    /**
     * Sets the disk SAN policy for the operating system.
     * @param {Integer} SanPolicy A value from the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_san_policy">VDS_SAN_POLICY</a> enumeration that specifies the SAN policy.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_SET_SAN_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A driver error was reported when setting the SAN policy.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsservicesan-setsanpolicy
     */
    SetSANPolicy(SanPolicy) {
        result := ComCall(4, this, "int", SanPolicy, "HRESULT")
        return result
    }
}
