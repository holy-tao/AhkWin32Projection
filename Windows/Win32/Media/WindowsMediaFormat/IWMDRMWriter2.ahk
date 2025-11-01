#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDRMWriter.ahk

/**
 * The IWMDRMWriter2 interface provides a method that enables you to write content encrypted with Windows Media DRM 10 for Network Devices.An IWMDRMWriter2 interface exists for every writer object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmdrmwriter2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMDRMWriter2 extends IWMDRMWriter{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDRMWriter2
     * @type {Guid}
     */
    static IID => Guid("{38ee7a94-40e2-4e10-aa3f-33fd3210ed5b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetWMDRMNetEncryption"]

    /**
     * 
     * @param {BOOL} fSamplesEncrypted 
     * @param {Pointer<Integer>} pbKeyID 
     * @param {Integer} cbKeyID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmwriter2-setwmdrmnetencryption
     */
    SetWMDRMNetEncryption(fSamplesEncrypted, pbKeyID, cbKeyID) {
        pbKeyIDMarshal := pbKeyID is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "int", fSamplesEncrypted, pbKeyIDMarshal, pbKeyID, "uint", cbKeyID, "HRESULT")
        return result
    }
}
