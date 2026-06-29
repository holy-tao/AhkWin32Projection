#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWMDRMWriter.ahk" { IWMDRMWriter }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The IWMDRMWriter2 interface provides a method that enables you to write content encrypted with Windows Media DRM 10 for Network Devices.An IWMDRMWriter2 interface exists for every writer object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmdrmwriter2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMDRMWriter2 extends IWMDRMWriter {
    /**
     * The interface identifier for IWMDRMWriter2
     * @type {Guid}
     */
    static IID := Guid("{38ee7a94-40e2-4e10-aa3f-33fd3210ed5b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMDRMWriter2 interfaces
    */
    struct Vtbl extends IWMDRMWriter.Vtbl {
        SetWMDRMNetEncryption : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMDRMWriter2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmwriter2-setwmdrmnetencryption
     */
    SetWMDRMNetEncryption(fSamplesEncrypted, pbKeyID, cbKeyID) {
        pbKeyIDMarshal := pbKeyID is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, BOOL, fSamplesEncrypted, pbKeyIDMarshal, pbKeyID, "uint", cbKeyID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMDRMWriter2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetWMDRMNetEncryption := CallbackCreate(GetMethod(implObj, "SetWMDRMNetEncryption"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetWMDRMNetEncryption)
    }
}
