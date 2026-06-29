#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Audio\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import ".\WMFILECAPABILITIES.ahk" { WMFILECAPABILITIES }
#Import "..\..\System\Ole\ISpecifyPropertyPages.ahk" { ISpecifyPropertyPages }
#Import ".\IWMDMStorage.ahk" { IWMDMStorage }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IWMDMDevice.ahk" { IWMDMDevice }
#Import "..\MediaFoundation\VIDEOINFOHEADER.ahk" { VIDEOINFOHEADER }

/**
 * The IWMDMDevice2 interface extends IWMDMDevice by making it possible to get the video formats supported by a device, find storage from its name, and use property pages.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-iwmdmdevice2
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct IWMDMDevice2 extends IWMDMDevice {
    /**
     * The interface identifier for IWMDMDevice2
     * @type {Guid}
     */
    static IID := Guid("{e34f3d37-9d67-4fc1-9252-62d28b2f8b55}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMDMDevice2 interfaces
    */
    struct Vtbl extends IWMDMDevice.Vtbl {
        GetStorage              : IntPtr
        GetFormatSupport2       : IntPtr
        GetSpecifyPropertyPages : IntPtr
        GetCanonicalName        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMDMDevice2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetStorage method searches the immediate children of the root storage for a storage with the given name.
     * @remarks
     * This function is not recursive; it only searches the immediate children of the device root storage. For a recursive search version of this function, use <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevice3-findstorage">IWMDMDevice3::FindStorage</a>.
     * @param {PWSTR} pszStorageName Pointer to a <b>null</b>-terminated string specifying the name of the storage to find. This parameter does not support wildcard characters.
     * @returns {IWMDMStorage} Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmstorage">IWMDMStorage</a> interface of the storage specified by the <i>pszStorageName</i> parameter. The caller must release this interface when done with it.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevice2-getstorage
     */
    GetStorage(pszStorageName) {
        pszStorageName := pszStorageName is String ? StrPtr(pszStorageName) : pszStorageName

        result := ComCall(14, this, "ptr", pszStorageName, "ptr*", &ppStorage := 0, "HRESULT")
        return IWMDMStorage(ppStorage)
    }

    /**
     * The GetFormatSupport2 method retrieves the formats supported by the device, including audio and video codecs, and MIME file formats.
     * @remarks
     * This method extends <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevice-getformatsupport">IWMDMDevice::GetFormatSupport</a> to handle video formats. The recommended method for getting format support, however, is <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevice3-getformatcapability">IWMDMDevice3::GetFormatCapability</a>. If <b>GetFormatCapability</b> isn't supported, the device will probably not support video, and <b>GetFormatSupport</b> is probably sufficient.
     * @param {Integer} dwFlags <b>DWORD</b> specifying audio formats, video formats, and MIME types. This flag specifies what the application is requesting the service provider to fill in. The caller can set one or more of the following three values.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_GET_FORMAT_SUPPORT_AUDIO</td>
     * <td>Service provider should fill in audio parameters.</td>
     * </tr>
     * <tr>
     * <td>WMDM_GET_FORMAT_SUPPORT_VIDEO</td>
     * <td>Service provider should fill in video parameters.</td>
     * </tr>
     * <tr>
     * <td>WMDM_GET_FORMAT_SUPPORT_FILE</td>
     * <td>Service provider should fill in file parameters.</td>
     * </tr>
     * </table>
     * @param {Pointer<Pointer<WAVEFORMATEX>>} ppAudioFormatEx Pointer to an array of <b>_WAVEFORMATEX</b> structures specifying information about audio codecs and bit rates supported by the device. The memory for this parameter is allocated by Windows Media Device Manager, and must be released by the caller with the Win32 function <b>CoTaskMemFree</b>.
     * @param {Pointer<Integer>} pnAudioFormatCount Pointer to an integer specifying the audio format count.
     * @param {Pointer<Pointer<VIDEOINFOHEADER>>} ppVideoFormatEx Pointer to an array of <b>_VIDEOFORMATEX</b> structures specifying information about video codes and formats supported by the device. The memory for this parameter is allocated by Windows Media Device Manager, and must be released by the caller with the Win32 function <b>CoTaskMemFree</b>.
     * @param {Pointer<Integer>} pnVideoFormatCount Pointer to an integer specifying the video format count.
     * @param {Pointer<Pointer<WMFILECAPABILITIES>>} ppFileType Pointer to an array of <b>WMFILECAPABILITIES</b> file-type objects. The memory for this parameter is allocated by Windows Media Device Manager, and must be released by the caller with the Win32 function <b>CoTaskMemFree</b>.
     * @param {Pointer<Integer>} pnFileTypeCount Pointer to an integer specifying the file-type count.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevice2-getformatsupport2
     */
    GetFormatSupport2(dwFlags, ppAudioFormatEx, pnAudioFormatCount, ppVideoFormatEx, pnVideoFormatCount, ppFileType, pnFileTypeCount) {
        ppAudioFormatExMarshal := ppAudioFormatEx is VarRef ? "ptr*" : "ptr"
        pnAudioFormatCountMarshal := pnAudioFormatCount is VarRef ? "uint*" : "ptr"
        ppVideoFormatExMarshal := ppVideoFormatEx is VarRef ? "ptr*" : "ptr"
        pnVideoFormatCountMarshal := pnVideoFormatCount is VarRef ? "uint*" : "ptr"
        ppFileTypeMarshal := ppFileType is VarRef ? "ptr*" : "ptr"
        pnFileTypeCountMarshal := pnFileTypeCount is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "uint", dwFlags, ppAudioFormatExMarshal, ppAudioFormatEx, pnAudioFormatCountMarshal, pnAudioFormatCount, ppVideoFormatExMarshal, ppVideoFormatEx, pnVideoFormatCountMarshal, pnVideoFormatCount, ppFileTypeMarshal, ppFileType, pnFileTypeCountMarshal, pnFileTypeCount, "HRESULT")
        return result
    }

    /**
     * The GetSpecifyPropertyPages method retrieves the property page for the device. Property pages can be used to report device-specific properties and branding information.
     * @param {Pointer<ISpecifyPropertyPages>} ppSpecifyPropPages Pointer to a pointer to an <b>ISpecifyPropertyPages</b> interface. <b>ISpecifyPropertyPages</b> is documented in the COM area of the Platform SDK. The caller must release this interface when done with it.
     * @param {Pointer<Pointer<IUnknown>>} pppUnknowns Specifies an array of <b>IUnknown</b> interface pointers. These interfaces are passed to the property page and can be used to pass information between the property page and the service provider. The array is allocated by Windows Media Device Manager, but the caller must call <b>Release</b> on each interface retrieved, and <b>CoTaskMemFree</b> on the retrieved array.
     * @param {Pointer<Integer>} pcUnks Retrieves the size of the <i>pppUnknowns</i> array.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevice2-getspecifypropertypages
     */
    GetSpecifyPropertyPages(ppSpecifyPropPages, pppUnknowns, pcUnks) {
        pppUnknownsMarshal := pppUnknowns is VarRef ? "ptr*" : "ptr"
        pcUnksMarshal := pcUnks is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, ISpecifyPropertyPages.Ptr, ppSpecifyPropPages, pppUnknownsMarshal, pppUnknowns, pcUnksMarshal, pcUnks, "HRESULT")
        return result
    }

    /**
     * The GetCanonicalName method retrieves the canonical name of the device.
     * @remarks
     * The application can use the retrieved canonical name to call <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdevicemanager2-getdevicefromcanonicalname">IWMDeviceManager2::GetDeviceFromCanonicalName</a> to find this device again.
     * 
     * The returned canonical name is in the format &lt; <i>PnP Device Path</i> &gt;$&lt; <i>index</i> &gt;, where <i>index</i> is a zero-based index into the device objects returned by the service provider for the specified PnP device path.
     * 
     * The format of canonical name is subject to change in future releases of Windows Media Device Manager.
     * @param {PWSTR} pwszPnPName Wide-character buffer for the canonical names. This buffer must be allocated and released by the caller.
     * @param {Integer} nMaxChars Integer specifying the maximum number of characters that can be placed in <i>pwszPnPName</i>, including the termination character.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pwszPnPName</i> parameter is an invalid or <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device does not support a canonical name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer specified is too small for the canonical name.
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
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevice2-getcanonicalname
     */
    GetCanonicalName(pwszPnPName, nMaxChars) {
        pwszPnPName := pwszPnPName is String ? StrPtr(pwszPnPName) : pwszPnPName

        result := ComCall(17, this, "ptr", pwszPnPName, "uint", nMaxChars, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMDMDevice2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStorage := CallbackCreate(GetMethod(implObj, "GetStorage"), flags, 3)
        this.vtbl.GetFormatSupport2 := CallbackCreate(GetMethod(implObj, "GetFormatSupport2"), flags, 8)
        this.vtbl.GetSpecifyPropertyPages := CallbackCreate(GetMethod(implObj, "GetSpecifyPropertyPages"), flags, 4)
        this.vtbl.GetCanonicalName := CallbackCreate(GetMethod(implObj, "GetCanonicalName"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStorage)
        CallbackFree(this.vtbl.GetFormatSupport2)
        CallbackFree(this.vtbl.GetSpecifyPropertyPages)
        CallbackFree(this.vtbl.GetCanonicalName)
    }
}
