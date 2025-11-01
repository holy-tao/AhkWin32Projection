#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDRMTranscryptor interface transforms a DRM-protected ASF file into a secure data stream conforming to the Windows Media DRM 10 for Network Devices protocol.
 * @remarks
 * 
  * The DRM transcryptor is initialized after a policy request message is sent by a device. You can parse a license request and obtain the device certificate, the device serial number, and the requested action by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmdrmmessageparser-parselicenserequestmsg">IWMDRMMessageParser::ParseLicenseRequestMsg</a>.
  * 
  * The methods of the <b>IWMDRMTranscryptor</b> interface use the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus">IWMStatusCallback::OnStatus</a> callback method to inform the application of progress. For more information, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/using-the-callback-methods">Using the Callback Methods</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmdrmtranscryptor
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMDRMTranscryptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDRMTranscryptor
     * @type {Guid}
     */
    static IID => Guid("{69059850-6e6f-4bb2-806f-71863ddfc471}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Seek", "Read", "Close"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {BSTR} bstrFileName 
     * @param {Pointer<Integer>} pbLicenseRequestMsg 
     * @param {Integer} cbLicenseRequestMsg 
     * @param {Pointer<INSSBuffer>} ppLicenseResponseMsg 
     * @param {IWMStatusCallback} pCallback 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(bstrFileName, pbLicenseRequestMsg, cbLicenseRequestMsg, ppLicenseResponseMsg, pCallback, pvContext) {
        bstrFileName := bstrFileName is String ? BSTR.Alloc(bstrFileName).Value : bstrFileName

        result := ComCall(3, this, "ptr", bstrFileName, "char*", pbLicenseRequestMsg, "uint", cbLicenseRequestMsg, "ptr*", ppLicenseResponseMsg, "ptr", pCallback, "ptr", pvContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hnsTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmtranscryptor-seek
     */
    Seek(hnsTime) {
        result := ComCall(4, this, "uint", hnsTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbData 
     * @param {Pointer<Integer>} pcbData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmtranscryptor-read
     */
    Read(pbData, pcbData) {
        result := ComCall(5, this, "char*", pbData, "uint*", pcbData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmtranscryptor-close
     */
    Close() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
