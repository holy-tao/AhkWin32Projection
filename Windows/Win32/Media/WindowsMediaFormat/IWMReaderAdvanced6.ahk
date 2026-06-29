#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWMReaderAdvanced5.ahk" { IWMReaderAdvanced5 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IWMReaderAdvanced6 interface enables sample protection.An IWMReaderAdvanced6 interface exists for every reader object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmreaderadvanced6
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMReaderAdvanced6 extends IWMReaderAdvanced5 {
    /**
     * The interface identifier for IWMReaderAdvanced6
     * @type {Guid}
     */
    static IID := Guid("{18a2e7f8-428f-4acd-8a00-e64639bc93de}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMReaderAdvanced6 interfaces
    */
    struct Vtbl extends IWMReaderAdvanced5.Vtbl {
        SetProtectStreamSamples : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMReaderAdvanced6.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetProtectStreamSamples method configures sample protection.
     * @remarks
     * The constants used for <i>dwCertificateType</i> and <i>dwFlags</i> are defined in wmdrmsdk.h.
     * @param {Pointer<Integer>} pbCertificate Buffer containing the certificate to use for protection.
     * @param {Integer} cbCertificate Size of the certificate in bytes.
     * @param {Integer} dwCertificateType Type of certificate passed in <i>pbCertificate</i>. The only supported type is WMDRM_CERTIFICATE_TYPE_XML.
     * @param {Integer} dwFlags The type of session protection to use for re-encoding. The only supported type is WMDRM_PROTECTION_TYPE_RC4.
     * @param {Pointer<Integer>} pcbInitializationVector On input, the size of the buffer passed as <i>pbInitializationVector</i>. On output, the size of the used portion of the buffer. If you pass <b>NULL</b> for <i>pbInitializationVector</i>, this value is set to the required buffer size on output.
     * @returns {Integer} Receives the initialization vector. The initialization vector is OEAP-encrypted with the RSA public key found in the certificate. Set to <b>NULL</b> to receive the required buffer size in pcbInitializationVector.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced6-setprotectstreamsamples
     */
    SetProtectStreamSamples(pbCertificate, cbCertificate, dwCertificateType, dwFlags, pcbInitializationVector) {
        pbCertificateMarshal := pbCertificate is VarRef ? "char*" : "ptr"
        pcbInitializationVectorMarshal := pcbInitializationVector is VarRef ? "uint*" : "ptr"

        result := ComCall(50, this, pbCertificateMarshal, pbCertificate, "uint", cbCertificate, "uint", dwCertificateType, "uint", dwFlags, "char*", &pbInitializationVector := 0, pcbInitializationVectorMarshal, pcbInitializationVector, "HRESULT")
        return pbInitializationVector
    }

    Query(iid) {
        if (IWMReaderAdvanced6.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetProtectStreamSamples := CallbackCreate(GetMethod(implObj, "SetProtectStreamSamples"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetProtectStreamSamples)
    }
}
