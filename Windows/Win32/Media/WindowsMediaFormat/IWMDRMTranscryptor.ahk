#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\INSSBuffer.ahk
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
     * @param {IWMStatusCallback} pCallback 
     * @param {Pointer<Void>} pvContext 
     * @returns {INSSBuffer} 
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(bstrFileName, pbLicenseRequestMsg, cbLicenseRequestMsg, pCallback, pvContext) {
        bstrFileName := bstrFileName is String ? BSTR.Alloc(bstrFileName).Value : bstrFileName

        pbLicenseRequestMsgMarshal := pbLicenseRequestMsg is VarRef ? "char*" : "ptr"
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", bstrFileName, pbLicenseRequestMsgMarshal, pbLicenseRequestMsg, "uint", cbLicenseRequestMsg, "ptr*", &ppLicenseResponseMsg := 0, "ptr", pCallback, pvContextMarshal, pvContext, "HRESULT")
        return INSSBuffer(ppLicenseResponseMsg)
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
        pbDataMarshal := pbData is VarRef ? "char*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pbDataMarshal, pbData, pcbDataMarshal, pcbData, "HRESULT")
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
