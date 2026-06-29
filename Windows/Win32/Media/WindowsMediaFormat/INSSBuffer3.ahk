#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\INSSBuffer2.ahk" { INSSBuffer2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The INSSBuffer3 interface enhances the INSSBuffer interface by adding the ability to set and retrieve single properties for a sample.
 * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nn-wmsbuffer-inssbuffer3
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct INSSBuffer3 extends INSSBuffer2 {
    /**
     * The interface identifier for INSSBuffer3
     * @type {Guid}
     */
    static IID := Guid("{c87ceaaf-75be-4bc4-84eb-ac2798507672}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INSSBuffer3 interfaces
    */
    struct Vtbl extends INSSBuffer2.Vtbl {
        SetProperty : IntPtr
        GetProperty : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INSSBuffer3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetProperty method is used to specify a property for the sample in the buffer. Buffer properties are used to pass information along with the sample to the writer object when writing ASF files. Sample properties are GUID values.
     * @remarks
     * If you set a buffer property with a size larger than that specified in your call to <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstreamconfig2-adddataunitextension">IWMStreamConfig2::AddDataUnitExtension</a>, you will not get an error from <b>SetProperty</b>. However, when the writer writes the sample, NS_E_DATA_UNIT_EXTENSION_TOO_LARGE will be returned.
     * @param {Guid} guidBufferProperty <b>GUID</b> value identifying the property you want to set. The predefined buffer properties are described in the <a href="https://docs.microsoft.com/windows/desktop/wmformat/sample-extension-types">Sample Extension Types</a> section of this documentation. You can also define your own sample extension schemes using your own GUID values.
     * @param {Pointer<Void>} pvBufferProperty Pointer to a buffer containing the property value.
     * @param {Integer} dwBufferPropertySize <b>DWORD</b> value containing the size of the buffer pointed to by <i>pvBufferProperty</i>.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was unable to allocate memory for the new property.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nf-wmsbuffer-inssbuffer3-setproperty
     */
    SetProperty(guidBufferProperty, pvBufferProperty, dwBufferPropertySize) {
        pvBufferPropertyMarshal := pvBufferProperty is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, Guid, guidBufferProperty, pvBufferPropertyMarshal, pvBufferProperty, "uint", dwBufferPropertySize, "HRESULT")
        return result
    }

    /**
     * The GetProperty method is used to retrieve a property of the sample in the buffer. Buffer properties are used to pass information along with the sample to the writer object when writing ASF files. Sample properties are GUID values.
     * @param {Guid} guidBufferProperty <b>GUID</b> value identifying the property to retrieve. The predefined buffer properties are described in the <a href="https://docs.microsoft.com/windows/desktop/wmformat/sample-extension-types">Sample Extension Types</a> section of this documentation. You can also define your own sample extension schemes using your own GUID values.
     * @param {Pointer<Integer>} pdwBufferPropertySize Pointer to a <b>DWORD</b> value containing the size of the buffer pointed to by <i>pvBufferProperty</i>. If you pass <b>NULL</b> for <i>pvBufferProperty</i>, the method sets the value pointed to by this parameter to the size required to hold the property value. If you pass a non-<b>NULL</b> value for <i>pvBufferProperty</i>, the value pointed to by this parameter must equal the size of the buffer pointed to by <i>pvBufferProperty</i>.
     * @returns {Void} Pointer to a buffer that will receive the value of the property specified by <i>guidBufferProperty</i>.
     * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nf-wmsbuffer-inssbuffer3-getproperty
     */
    GetProperty(guidBufferProperty, pdwBufferPropertySize) {
        pdwBufferPropertySizeMarshal := pdwBufferPropertySize is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, Guid, guidBufferProperty, "ptr", &pvBufferProperty := 0, pdwBufferPropertySizeMarshal, pdwBufferPropertySize, "HRESULT")
        return pvBufferProperty
    }

    Query(iid) {
        if (INSSBuffer3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetProperty := CallbackCreate(GetMethod(implObj, "SetProperty"), flags, 4)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetProperty)
        CallbackFree(this.vtbl.GetProperty)
    }
}
