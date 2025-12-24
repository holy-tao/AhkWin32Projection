#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMReaderAdvanced5.ahk

/**
 * The IWMReaderAdvanced6 interface enables sample protection.An IWMReaderAdvanced6 interface exists for every reader object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmreaderadvanced6
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderAdvanced6 extends IWMReaderAdvanced5{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMReaderAdvanced6
     * @type {Guid}
     */
    static IID => Guid("{18a2e7f8-428f-4acd-8a00-e64639bc93de}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 50

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProtectStreamSamples"]

    /**
     * The SetProtectStreamSamples method configures sample protection.
     * @param {Pointer<Integer>} pbCertificate Buffer containing the certificate to use for protection.
     * @param {Integer} cbCertificate Size of the certificate in bytes.
     * @param {Integer} dwCertificateType Type of certificate passed in <i>pbCertificate</i>. The only supported type is WMDRM_CERTIFICATE_TYPE_XML.
     * @param {Integer} dwFlags The type of session protection to use for re-encoding. The only supported type is WMDRM_PROTECTION_TYPE_RC4.
     * @param {Pointer<Integer>} pcbInitializationVector On input, the size of the buffer passed as <i>pbInitializationVector</i>. On output, the size of the used portion of the buffer. If you pass <b>NULL</b> for <i>pbInitializationVector</i>, this value is set to the required buffer size on output.
     * @returns {Integer} Receives the initialization vector. The initialization vector is OEAP-encrypted with the RSA public key found in the certificate. Set to <b>NULL</b> to receive the required buffer size in pcbInitializationVector.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderadvanced6-setprotectstreamsamples
     */
    SetProtectStreamSamples(pbCertificate, cbCertificate, dwCertificateType, dwFlags, pcbInitializationVector) {
        pbCertificateMarshal := pbCertificate is VarRef ? "char*" : "ptr"
        pcbInitializationVectorMarshal := pcbInitializationVector is VarRef ? "uint*" : "ptr"

        result := ComCall(50, this, pbCertificateMarshal, pbCertificate, "uint", cbCertificate, "uint", dwCertificateType, "uint", dwFlags, "char*", &pbInitializationVector := 0, pcbInitializationVectorMarshal, pcbInitializationVector, "HRESULT")
        return pbInitializationVector
    }
}
