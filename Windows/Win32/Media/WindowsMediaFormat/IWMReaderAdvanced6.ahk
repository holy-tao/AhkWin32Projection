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
     * 
     * @param {Pointer<Byte>} pbCertificate 
     * @param {Integer} cbCertificate 
     * @param {Integer} dwCertificateType 
     * @param {Integer} dwFlags 
     * @param {Pointer<Byte>} pbInitializationVector 
     * @param {Pointer<UInt32>} pcbInitializationVector 
     * @returns {HRESULT} 
     */
    SetProtectStreamSamples(pbCertificate, cbCertificate, dwCertificateType, dwFlags, pbInitializationVector, pcbInitializationVector) {
        result := ComCall(50, this, "char*", pbCertificate, "uint", cbCertificate, "uint", dwCertificateType, "uint", dwFlags, "char*", pbInitializationVector, "uint*", pcbInitializationVector, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
