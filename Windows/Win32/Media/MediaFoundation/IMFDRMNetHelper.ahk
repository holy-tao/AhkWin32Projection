#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Configures Windows Media Digital Rights Management (DRM) for Network Devices on a network sink.
 * @remarks
 * 
 * To stream protected content over a network, the <i>ASF streaming media sink</i> provides an output trust authority (OTA) that supports  Windows Media DRM for Network Devices and implements the <b>IMFDRMNetHelper</b> interface. For this OTA,  encryption occurs on each frame before multiplexing. The license request and response process takes place in the media sink.
 * 
 * The application gets a pointer to <b>IMFDRMNetHelper</b> and uses the methods to handle the license request and response. The application is also responsible for sending the license to the client.
 * 
 * To stream the content, the application does the following:
 * 
 * <ol>
 * <li>Provide the HTTP byte stream to which the media sink writes the streamed content. To stream DRM-protected content over a network from a server to a client, an application must use the Microsoft Media Foundation Protected Media Path (PMP). The media sink and the application-provided HTTP byte stream exist in  mfpmp.exe. Therefore, the byte stream must expose the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface so that it can be created out-of-process.<div class="alert"><b>Note</b>  This might affect how the code is packaged. The DLL that contains the HTTP byte stream and other dependent DLLs must be signed for the Protected Environment (PE-signed).  </div>
 * <div> </div>
 * 
 * 
 * </li>
 * <li>Set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-asfmediasink-drmaction-property">MFPKEY_ASFMEDIASINK_DRMACTION</a> property to <b>MFSINK_WMDRMACTION_TRANSCRYPT</b>. The media sink's property store is available to the application through the <a href="https://docs.microsoft.com/windows/desktop/medfound/asf-contentinfo-object">ASF ContentInfo</a>. To get the property store, call <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfcontentinfo-getencodingconfigurationpropertystore">IMFASFContentInfo::GetEncodingConfigurationPropertyStore</a>.</li>
 * <li>Get a pointer to the <b>IMFDRMNetHelper</b> interface by querying the media sink.</li>
 * <li>To make a license request, call <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfdrmnethelper-processlicenserequest">IMFDRMNetHelper::ProcessLicenseRequest</a>. This method calls into the OTA implementation and retrieves the license.When the clock starts for the first time or restarts , the encrypter that is used for encrypting samples is retrieved, and   the license response is cached.
 * 
 * </li>
 * <li>To get the cached license response, call <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfdrmnethelper-getchainedlicenseresponse">IMFDRMNetHelper::GetChainedLicenseResponse</a>.</li>
 * </ol>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nn-wmcontainer-imfdrmnethelper
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFDRMNetHelper extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFDRMNetHelper
     * @type {Guid}
     */
    static IID => Guid("{3d1ff0ea-679a-4190-8d46-7fa69e8c7e15}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ProcessLicenseRequest", "GetChainedLicenseResponse"]

    /**
     * 
     * @param {Pointer<Integer>} pLicenseRequest 
     * @param {Integer} cbLicenseRequest 
     * @param {Pointer<Pointer<Integer>>} ppLicenseResponse 
     * @param {Pointer<Integer>} pcbLicenseResponse 
     * @param {Pointer<BSTR>} pbstrKID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfdrmnethelper-processlicenserequest
     */
    ProcessLicenseRequest(pLicenseRequest, cbLicenseRequest, ppLicenseResponse, pcbLicenseResponse, pbstrKID) {
        pLicenseRequestMarshal := pLicenseRequest is VarRef ? "char*" : "ptr"
        ppLicenseResponseMarshal := ppLicenseResponse is VarRef ? "ptr*" : "ptr"
        pcbLicenseResponseMarshal := pcbLicenseResponse is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pLicenseRequestMarshal, pLicenseRequest, "uint", cbLicenseRequest, ppLicenseResponseMarshal, ppLicenseResponse, pcbLicenseResponseMarshal, pcbLicenseResponse, "ptr", pbstrKID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppLicenseResponse 
     * @param {Pointer<Integer>} pcbLicenseResponse 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfdrmnethelper-getchainedlicenseresponse
     */
    GetChainedLicenseResponse(ppLicenseResponse, pcbLicenseResponse) {
        ppLicenseResponseMarshal := ppLicenseResponse is VarRef ? "ptr*" : "ptr"
        pcbLicenseResponseMarshal := pcbLicenseResponse is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, ppLicenseResponseMarshal, ppLicenseResponse, pcbLicenseResponseMarshal, pcbLicenseResponse, "HRESULT")
        return result
    }
}
