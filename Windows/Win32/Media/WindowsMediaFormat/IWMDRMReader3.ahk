#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMDRMReader2.ahk" { IWMDRMReader2 }

/**
 * The IWMDRMReader3 interface enables content transcription by providing a method to get protection systems approved by a license.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmdrmreader3
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMDRMReader3 extends IWMDRMReader2 {
    /**
     * The interface identifier for IWMDRMReader3
     * @type {Guid}
     */
    static IID := Guid("{e08672de-f1e7-4ff4-a0a3-fc4b08e4caf8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMDRMReader3 interfaces
    */
    struct Vtbl extends IWMDRMReader2.Vtbl {
        GetInclusionList : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMDRMReader3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetInclusionList method retrieves a list of identifiers specifying approved protection systems.
     * @remarks
     * The license issuer can specify other protection systems to which the encrypted content may be converted. The list of GUIDs retrieved by this method identifies the allowed protection systems. When you enter into a license agreement with Microsoft to get the stub library, you will receive a list of currently supported protection systems and the GUIDs used to identify them.
     * @param {Pointer<Pointer<Guid>>} ppGuids Address of a variable that receives a pointer to an array of identifiers. The array is allocated by using <b>CoTaskMemAlloc</b>. When finished with the list, release the memory by calling <b>CoTaskMemFree</b>.
     * @param {Pointer<Integer>} pcGuids Number of elements in the array received by the <i>ppGuids</i> parameter.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmreader3-getinclusionlist
     */
    GetInclusionList(ppGuids, pcGuids) {
        ppGuidsMarshal := ppGuids is VarRef ? "ptr*" : "ptr"
        pcGuidsMarshal := pcGuids is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, ppGuidsMarshal, ppGuids, pcGuidsMarshal, pcGuids, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMDRMReader3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInclusionList := CallbackCreate(GetMethod(implObj, "GetInclusionList"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInclusionList)
    }
}
