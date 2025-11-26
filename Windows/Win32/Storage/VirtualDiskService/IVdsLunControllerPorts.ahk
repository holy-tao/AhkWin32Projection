#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumVdsObject.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for performing controller port configuration operations on a LUN.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsluncontrollerports
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsLunControllerPorts extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsLunControllerPorts
     * @type {Guid}
     */
    static IID => Guid("{451fe266-da6d-406a-bb60-82e534f85aeb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AssociateControllerPorts", "QueryActiveControllerPorts"]

    /**
     * Sets the subsystem controller ports to active or inactive with respect to the LUN. This method replaces IVdsLun::AssociateControllers.
     * @param {Pointer<Guid>} pActiveControllerPortIdArray A pointer to an array of controller port GUIDs. The provider sets these controller ports to active. This array 
     *       includes controller ports already set to active that are to remain active.
     * @param {Integer} lNumberOfActiveControllerPorts The number of controller ports specified in the  <i>pActiveControllerPortIdArray</i> parameter.
     * @param {Pointer<Guid>} pInactiveControllerPortIdArray A
     *       pointer to an array of controller port GUIDs. The provider sets these controller ports to inactive. This array 
     *       includes controller ports already set to inactive that are to remain inactive.
     * @param {Integer} lNumberOfInactiveControllerPorts The number of controller ports specified in the  <i>pInactiveControllerPortIdArray</i> parameter.
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
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The association name was successfully set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cache of the provider is corrupted. This indicates a software or communication problem inside a provider 
     *         that caches information about the attached devices. The caller can use the 
     *         <a href="/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method 
     *         followed by the  <a href="/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> method to 
     *         restore the cache.
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_OBJECT_DELETED</b></b></dt>
     * <dt>0x8004240BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LUN object is no longer present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_OBJECT_STATUS_FAILED</b></b></dt>
     * <dt>0x80042431L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LUN is in a failed state and is unable to perform the requested operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_ANOTHER_CALL_IN_PROGRESS</b></b></dt>
     * <dt>0x80042404L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another operation is in progress. This operation cannot proceed until previous operations are complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_OBJECT_NOT_FOUND</b></b></dt>
     * <dt>0x80042405L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more GUIDs of data type <b>VDS_OBJECT_ID</b> specified in 
     *         the <i>pActiveControllerPortIdArray</i> or 
     *         <i>pInactiveControllerPortIdArray</i> parameters do not refer to an existing object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_NOT_SUPPORTED</b></b></dt>
     * <dt>0x80042400L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This operation or combination of parameters is not supported by this provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsluncontrollerports-associatecontrollerports
     */
    AssociateControllerPorts(pActiveControllerPortIdArray, lNumberOfActiveControllerPorts, pInactiveControllerPortIdArray, lNumberOfInactiveControllerPorts) {
        result := ComCall(3, this, "ptr", pActiveControllerPortIdArray, "int", lNumberOfActiveControllerPorts, "ptr", pInactiveControllerPortIdArray, "int", lNumberOfInactiveControllerPorts, "HRESULT")
        return result
    }

    /**
     * Returns an enumeration of currently active controller ports.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface pointer that can be used to enumerate the controller ports  as <a href="https://docs.microsoft.com/windows/desktop/VDS/controller-port-object">controller port objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the controller port objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsluncontrollerports-queryactivecontrollerports
     */
    QueryActiveControllerPorts() {
        result := ComCall(4, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }
}
