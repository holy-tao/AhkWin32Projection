#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to enable VDS to perform miscellaneous operations on provider objects.
 * @see https://learn.microsoft.com/windows/win32/api//content/vdshwprv/nn-vdshwprv-ivdsproviderprivate
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsProviderPrivate extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsProviderPrivate
     * @type {Guid}
     */
    static IID => Guid("{11f3cd41-b7e8-48ff-9472-9dff018aa292}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetObject", "OnLoad", "OnUnload"]

    /**
     * Returns the specified object.
     * @remarks
     * The object can be a  subsystem, controller, LUN, LUN plex, drive, pack, disk, volume, or volume plex object. Each object represents a physical device (such as a subsystem, drive, or controllers) or a virtual device (such as a LUN or LUN plex). The hardware provider should create one COM object for each physical or virtual device.
     * @param {Guid} ObjectId_ The GUID of the object.
     * @param {Integer} type The object type enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_object_type">VDS_OBJECT_TYPE</a>.
     * @returns {IUnknown} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer for the object. When the pointer is no longer needed, the caller should release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/vdshwprv/nf-vdshwprv-ivdsproviderprivate-getobject
     */
    GetObject(ObjectId_, type) {
        result := ComCall(3, this, "ptr", ObjectId_, "int", type, "ptr*", &ppObjectUnk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppObjectUnk)
    }

    /**
     * Prompts the provider to initialize itself, and passes a callback object that the provider uses to get necessary interfaces.
     * @remarks
     * VDS calls this method immediately after calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> method on a provider.
     * 
     * Implementers must implement this method. Invoke the  <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a> method 
     *     to query for the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsadvisesink">IVdsAdviseSink</a> interface.
     * @param {PWSTR} pwszMachineName This parameter is reserved.
     * @param {IUnknown} pCallbackObject Pointer to a callback object.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider is initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INITIALIZED_FAILED</b></dt>
     * <dt>0x80042401L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider failed to initialize.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vdshwprv/nf-vdshwprv-ivdsproviderprivate-onload
     */
    OnLoad(pwszMachineName, pCallbackObject) {
        pwszMachineName := pwszMachineName is String ? StrPtr(pwszMachineName) : pwszMachineName

        result := ComCall(4, this, "ptr", pwszMachineName, "ptr", pCallbackObject, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Prompts the provider object to uninitialize itself.
     * @remarks
     * VDS calls this method immediately before releasing the reference to the provider object. When the reference count drops to zero, the provider unloads. If the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsproviderprivate-onload">OnLoad</a> method fails, VDS does not call <b>OnUnload</b>.
     * 
     * <b>Notes to implementers:  </b>You must perform all necessary clean up, even without the call to <b>OnUnload</b>.
     * @param {BOOL} bForceUnload If true, VDS attempts to forcibly unload the provider. If false, VDS makes no such attempt.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider is unloaded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider is unable to unload at this time. VDS tries again later.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vdshwprv/nf-vdshwprv-ivdsproviderprivate-onunload
     */
    OnUnload(bForceUnload) {
        result := ComCall(5, this, "int", bForceUnload, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
