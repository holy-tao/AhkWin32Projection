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
     * 
     * @param {Pointer<Integer>} pbCertificate 
     * @param {Integer} cbCertificate 
     * @param {Integer} dwCertificateType 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} pcbInitializationVector 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced6-setprotectstreamsamples
     */
    SetProtectStreamSamples(pbCertificate, cbCertificate, dwCertificateType, dwFlags, pcbInitializationVector) {
        pbCertificateMarshal := pbCertificate is VarRef ? "char*" : "ptr"
        pcbInitializationVectorMarshal := pcbInitializationVector is VarRef ? "uint*" : "ptr"

        result := ComCall(50, this, pbCertificateMarshal, pbCertificate, "uint", cbCertificate, "uint", dwCertificateType, "uint", dwFlags, "char*", &pbInitializationVector := 0, pcbInitializationVectorMarshal, pcbInitializationVector, "HRESULT")
        return pbInitializationVector
    }
}
