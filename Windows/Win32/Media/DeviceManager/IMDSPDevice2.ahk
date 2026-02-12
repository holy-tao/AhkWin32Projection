#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMDSPStorage.ahk
#Include .\IMDSPDevice.ahk

/**
 * The IMDSPDevice2 interface extends IMDSPDevice by getting extended formats, getting Plug and Play (PnP) device names, enabling the use of property pages, and making it possible to get a pointer to a storage medium from its name.
 * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nn-mswmdm-imdspdevice2
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPDevice2 extends IMDSPDevice{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDSPDevice2
     * @type {Guid}
     */
    static IID => Guid("{420d16ad-c97d-4e00-82aa-00e9f4335ddd}")

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
     * The GetStorage method makes it possible to go directly to a storage based on its name instead of enumerating through all storages to find it.
     * @remarks
     * The <b>GetStorage</b> method does not support wildcard characters. It is not recursive, that is, it will only find storages in the root of the device.
     * 
     * If this method is not implemented, it should return E_NOTIMPL. (It should not return WMDM_E_NOT_SUPPORTED or any other codes indicating that this method is not implemented). This will ensure that Windows Media Device Manager will attempt to substitute this functionality itself by enumerating all storages to find a match based on the storage name passed in as <i>pszStorageName</i>.
     * 
     * It is strongly recommended that a service provider implement this method to efficiently return a storage object based on name.
     * 
     * This method is optional. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @param {PWSTR} pszStorageName Pointer to a null-terminated string containing the name of the storage to find.
     * @returns {IMDSPStorage} Pointer to the storage object specified by the <i>pszStorageName</i> parameter.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspdevice2-getstorage
     */
    GetStorage(pszStorageName) {
        pszStorageName := pszStorageName is String ? StrPtr(pszStorageName) : pszStorageName

        result := ComCall(14, this, "ptr", pszStorageName, "ptr*", &ppStorage := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMDSPStorage(ppStorage)
    }

    /**
     * The GetFormatSupport2 method gets the formats supported by a device, including audio and video codecs, and MIME file formats.
     * @remarks
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @param {Integer} dwFlags <b>DWORD</b> containing audio formats, video formats, and MIME types. This flag specifies what the application is requesting the service provider to fill in. The caller can set one or more of the following three values.
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
     * @param {Pointer<Pointer<WAVEFORMATEX>>} ppAudioFormatEx Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/WMDM/-waveformatex">_WAVEFORMATEX</a> structures containing information about audio codecs and bit rates supported by the device.
     * @param {Pointer<Integer>} pnAudioFormatCount Pointer to an integer containing the audio format count.
     * @param {Pointer<Pointer<VIDEOINFOHEADER>>} ppVideoFormatEx Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/WMDM/-videoinfoheader">_VIDEOINFOHEADER</a> structures containing information about video codecs and formats supported by the device.
     * @param {Pointer<Integer>} pnVideoFormatCount Pointer to an integer containing the video format count.
     * @param {Pointer<Pointer<WMFILECAPABILITIES>>} ppFileType Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmfilecapabilities">WMFILECAPABILITIES</a> structures containing information about file types supported by the device.
     * @param {Pointer<Integer>} pnFileTypeCount Pointer to an integer containing the file format count.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspdevice2-getformatsupport2
     */
    GetFormatSupport2(dwFlags, ppAudioFormatEx, pnAudioFormatCount, ppVideoFormatEx, pnVideoFormatCount, ppFileType, pnFileTypeCount) {
        ppAudioFormatExMarshal := ppAudioFormatEx is VarRef ? "ptr*" : "ptr"
        pnAudioFormatCountMarshal := pnAudioFormatCount is VarRef ? "uint*" : "ptr"
        ppVideoFormatExMarshal := ppVideoFormatEx is VarRef ? "ptr*" : "ptr"
        pnVideoFormatCountMarshal := pnVideoFormatCount is VarRef ? "uint*" : "ptr"
        ppFileTypeMarshal := ppFileType is VarRef ? "ptr*" : "ptr"
        pnFileTypeCountMarshal := pnFileTypeCount is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "uint", dwFlags, ppAudioFormatExMarshal, ppAudioFormatEx, pnAudioFormatCountMarshal, pnAudioFormatCount, ppVideoFormatExMarshal, ppVideoFormatEx, pnVideoFormatCountMarshal, pnVideoFormatCount, ppFileTypeMarshal, ppFileType, pnFileTypeCountMarshal, pnFileTypeCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetSpecifyPropertyPages method gets property pages describing non-standard capabilities of portable devices.
     * @remarks
     * Memory for the <i>pppUnknowns</i> array should be allocated by this method and must be freed by the caller using <b>CoTaskMemFree</b>, a standard Win32 function.
     * 
     * This method is optional. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @param {Pointer<ISpecifyPropertyPages>} ppSpecifyPropPages Pointer to a Win32 <b>ISpecifyPropertyPages</b> interface pointer.
     * @param {Pointer<Pointer<IUnknown>>} pppUnknowns Array of <b>IUnknown</b> interface pointers. These interfaces will be passed to the property page and can be used to pass information between the property page and the service provider.
     * @param {Pointer<Integer>} pcUnks Size of the <i>pppUnknowns</i> array.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspdevice2-getspecifypropertypages
     */
    GetSpecifyPropertyPages(ppSpecifyPropPages, pppUnknowns, pcUnks) {
        pppUnknownsMarshal := pppUnknowns is VarRef ? "ptr*" : "ptr"
        pcUnksMarshal := pcUnks is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "ptr*", ppSpecifyPropPages, pppUnknownsMarshal, pppUnknowns, pcUnksMarshal, pcUnks, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetCanonicalPName method gets the canonical name of a device.
     * @remarks
     * This method returns a canonical name for the device. The service provider should return the device path name of the device as its canonical name. The service provider is passed the device path name in the <b>CreateDevice</b> method on the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-imdserviceprovider2">IMDServiceProvider2</a> interface.
     * 
     * This is optional. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @param {PWSTR} pwszPnPName A wide character, null-terminated buffer holding the canonical name. The caller allocates and releases this buffer.
     * @param {Integer} nMaxChars Integer containing the maximum number of characters that can be placed in <i>pwszCanonicalName</i>, including the termination character.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspdevice2-getcanonicalname
     */
    GetCanonicalName(pwszPnPName, nMaxChars) {
        pwszPnPName := pwszPnPName is String ? StrPtr(pwszPnPName) : pwszPnPName

        result := ComCall(17, this, "ptr", pwszPnPName, "uint", nMaxChars, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
