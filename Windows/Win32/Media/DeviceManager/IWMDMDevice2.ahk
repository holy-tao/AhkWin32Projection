#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMStorage.ahk
#Include .\IWMDMDevice.ahk

/**
 * The IWMDMDevice2 interface extends IWMDMDevice by making it possible to get the video formats supported by a device, find storage from its name, and use property pages.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmdevice2
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMDevice2 extends IWMDMDevice{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMDevice2
     * @type {Guid}
     */
    static IID => Guid("{e34f3d37-9d67-4fc1-9252-62d28b2f8b55}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStorage", "GetFormatSupport2", "GetSpecifyPropertyPages", "GetCanonicalName"]

    /**
     * The GetStorage method searches the immediate children of the root storage for a storage with the given name.
     * @param {PWSTR} pszStorageName Pointer to a <b>null</b>-terminated string specifying the name of the storage to find. This parameter does not support wildcard characters.
     * @returns {IWMDMStorage} Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmstorage">IWMDMStorage</a> interface of the storage specified by the <i>pszStorageName</i> parameter. The caller must release this interface when done with it.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmdevice2-getstorage
     */
    GetStorage(pszStorageName) {
        pszStorageName := pszStorageName is String ? StrPtr(pszStorageName) : pszStorageName

        result := ComCall(14, this, "ptr", pszStorageName, "ptr*", &ppStorage := 0, "HRESULT")
        return IWMDMStorage(ppStorage)
    }

    /**
     * The GetFormatSupport2 method retrieves the formats supported by the device, including audio and video codecs, and MIME file formats.
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
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmdevice2-getformatsupport2
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
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmdevice2-getspecifypropertypages
     */
    GetSpecifyPropertyPages(ppSpecifyPropPages, pppUnknowns, pcUnks) {
        pppUnknownsMarshal := pppUnknowns is VarRef ? "ptr*" : "ptr"
        pcUnksMarshal := pcUnks is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "ptr*", ppSpecifyPropPages, pppUnknownsMarshal, pppUnknowns, pcUnksMarshal, pcUnks, "HRESULT")
        return result
    }

    /**
     * The GetCanonicalName method retrieves the canonical name of the device.
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
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmdevice2-getcanonicalname
     */
    GetCanonicalName(pwszPnPName, nMaxChars) {
        pwszPnPName := pwszPnPName is String ? StrPtr(pwszPnPName) : pwszPnPName

        result := ComCall(17, this, "ptr", pwszPnPName, "uint", nMaxChars, "HRESULT")
        return result
    }
}
