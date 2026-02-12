#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDRMWriter.ahk

/**
 * The IWMDRMWriter2 interface provides a method that enables you to write content encrypted with Windows Media DRM 10 for Network Devices.An IWMDRMWriter2 interface exists for every writer object.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nn-wmsdkidl-iwmdrmwriter2
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
     * The SetWMDRMNetEncryption method configures the writer to receive input samples encoded with Windows Media DRM 10 for Network Devices.
     * @remarks
     * You must use this method to prepare the writer if you have samples that are already encoded for delivery to a device that supports Windows Media DRM 10 for Network Devices. Call this method before calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-beginwriting">IWMWriter::BeginWriting</a>.
     * 
     * After configuring the writer to receive encrypted samples, the writer will not accept samples from calls to <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-writesample">IWMWriter::WriteSample</a>. Instead, you must use <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-writestreamsample">IWMWriterAdvanced::WriteStreamSample</a>.
     * 
     * This method is intended only to create new files from existing data that is encoded for delivery to devices that support Windows Media DRM 10 for Network Devices. To generate data for streaming to secure devices from an existing DRM-protected ASF file, use the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmdrmtranscryptor">IWMDRMTranscryptor</a> interface.
     * @param {BOOL} fSamplesEncrypted Flag that specifies whether the samples sent to the writer will be encoded for Windows Media DRM 10 for Network Devices protocol.
     * @param {Pointer<Integer>} pbKeyID Address of the key identification in memory.
     * @param {Integer} cbKeyID The size of the key identification in bytes.
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmdrmwriter2-setwmdrmnetencryption
     */
    SetWMDRMNetEncryption(fSamplesEncrypted, pbKeyID, cbKeyID) {
        pbKeyIDMarshal := pbKeyID is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "int", fSamplesEncrypted, pbKeyIDMarshal, pbKeyID, "uint", cbKeyID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
