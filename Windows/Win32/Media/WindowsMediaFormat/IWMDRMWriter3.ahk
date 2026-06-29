#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WMDRM_IMPORT_INIT_STRUCT.ahk" { WMDRM_IMPORT_INIT_STRUCT }
#Import ".\IWMDRMWriter2.ahk" { IWMDRMWriter2 }

/**
 * The IWMDRMWriter3 interface enables writing of encrypted stream samples for importing protected content.An IWMDRMWriter3 interface exists for every writer object when linking to WMStubDRM.lib.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmdrmwriter3
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMDRMWriter3 extends IWMDRMWriter2 {
    /**
     * The interface identifier for IWMDRMWriter3
     * @type {Guid}
     */
    static IID := Guid("{a7184082-a4aa-4dde-ac9c-e75dbd1117ce}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMDRMWriter3 interfaces
    */
    struct Vtbl extends IWMDRMWriter2.Vtbl {
        SetProtectStreamSamples : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMDRMWriter3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetProtectStreamSamples method configures the writer to accept encrypted stream samples. This method is used as part of the process of importing protected content from a third party content protection scheme (CPS) into Windows Media DRM.
     * @remarks
     * <b>SetProtectStreamSamples</b> is used to configure the writer object for importing protected content.
     * 
     * When importing protected content, this method must be called after configuring the writer but before calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-beginwriting">IWMWriter::BeginWriting</a>. Before you can call this method, you must validate and extract the machine Windows Media DRM public key from the machine certificate collection.
     * @param {Pointer<WMDRM_IMPORT_INIT_STRUCT>} pImportInitStruct Address of a <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wmdrm_import_init_struct">WMDRM_IMPORT_INIT_STRUCT</a> structure containing initialization information needed to import protected content.
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
     * <dt><b>NS_E_DRM_RIV_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An updated content revocation list is needed.
     * 
     * </td>
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
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmwriter3-setprotectstreamsamples
     */
    SetProtectStreamSamples(pImportInitStruct) {
        result := ComCall(8, this, WMDRM_IMPORT_INIT_STRUCT.Ptr, pImportInitStruct, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMDRMWriter3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetProtectStreamSamples := CallbackCreate(GetMethod(implObj, "SetProtectStreamSamples"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetProtectStreamSamples)
    }
}
