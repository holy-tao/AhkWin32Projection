#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\MediaFoundation\VIDEOINFOHEADER.ahk" { VIDEOINFOHEADER }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Audio\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import ".\IWMDMOperation.ahk" { IWMDMOperation }

/**
 * The optional, application-implemented IWMDMOperation2 interface extends IWMDMOperation by providing methods to get and set extended attributes.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-iwmdmoperation2
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct IWMDMOperation2 extends IWMDMOperation {
    /**
     * The interface identifier for IWMDMOperation2
     * @type {Guid}
     */
    static IID := Guid("{33445b48-7df7-425c-ad8f-0fc6d82f9f75}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMDMOperation2 interfaces
    */
    struct Vtbl extends IWMDMOperation.Vtbl {
        SetObjectAttributes2 : IntPtr
        GetObjectAttributes2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMDMOperation2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetObjectAttributes2 method sets attributes of files or storages. This method is currently not called by Windows Media Device Manager.
     * @param {Integer} dwAttributes Pointer to a <b>DWORD</b> specifying the attributes as defined by the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorage-setattributes">IWMDMStorage::SetAttributes</a> method.
     * @param {Integer} dwAttributesEx <b>DWORD</b> specifying the extended attributes. No extended attributes are currently defined.
     * @param {Pointer<WAVEFORMATEX>} pFormat Optional pointer to a <a href="https://docs.microsoft.com/windows/desktop/WMDM/-waveformatex">_WAVEFORMATEX</a> structure that specifies audio information about the object.
     * @param {Pointer<VIDEOINFOHEADER>} pVideoFormat Optional pointer to a <a href="https://docs.microsoft.com/windows/desktop/WMDM/-videoinfoheader">_VIDEOINFOHEADER</a> structure that specifies video information about the object.
     * @returns {HRESULT} The application should return one of the following <b>HRESULT</b> values.
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
     * The read operation should continue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_USER_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The read operation should be cancelled without finishing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred, and the read operation should be cancelled without finishing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmoperation2-setobjectattributes2
     */
    SetObjectAttributes2(dwAttributes, dwAttributesEx, pFormat, pVideoFormat) {
        result := ComCall(13, this, "uint", dwAttributes, "uint", dwAttributesEx, WAVEFORMATEX.Ptr, pFormat, VIDEOINFOHEADER.Ptr, pVideoFormat, "HRESULT")
        return result
    }

    /**
     * Windows Media Device Manager calls GetObjectAttributes when a file is written to the device in order to learn the attributes of the file.
     * @param {Pointer<Integer>} pdwAttributes Pointer to a <b>DWORD</b> specifying the storage attributes defined in the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstorage-getattributes">IWMDMStorage::GetAttributes</a> method.
     * @param {Pointer<Integer>} pdwAttributesEx Pointer to a <b>DWORD</b> specifying extended attributes. There are currently no extended attributes defined.
     * @param {Pointer<WAVEFORMATEX>} pAudioFormat Optional pointer to a <a href="https://docs.microsoft.com/windows/desktop/WMDM/-waveformatex">_WAVEFORMATEX</a> structure that specifies audio file attributes.
     * @param {Pointer<VIDEOINFOHEADER>} pVideoFormat Optional pointer to a <a href="https://docs.microsoft.com/windows/desktop/WMDM/-videoinfoheader">_VIDEOINFOHEADER</a> structure that specifies video object attributes.
     * @returns {HRESULT} The application should return one of the following <b>HRESULT</b> values.
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
     * The read operation should continue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_USER_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The read operation should be cancelled without finishing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred, and the read operation should be cancelled without finishing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmoperation2-getobjectattributes2
     */
    GetObjectAttributes2(pdwAttributes, pdwAttributesEx, pAudioFormat, pVideoFormat) {
        pdwAttributesMarshal := pdwAttributes is VarRef ? "uint*" : "ptr"
        pdwAttributesExMarshal := pdwAttributesEx is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pdwAttributesMarshal, pdwAttributes, pdwAttributesExMarshal, pdwAttributesEx, WAVEFORMATEX.Ptr, pAudioFormat, VIDEOINFOHEADER.Ptr, pVideoFormat, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMDMOperation2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetObjectAttributes2 := CallbackCreate(GetMethod(implObj, "SetObjectAttributes2"), flags, 5)
        this.vtbl.GetObjectAttributes2 := CallbackCreate(GetMethod(implObj, "GetObjectAttributes2"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetObjectAttributes2)
        CallbackFree(this.vtbl.GetObjectAttributes2)
    }
}
