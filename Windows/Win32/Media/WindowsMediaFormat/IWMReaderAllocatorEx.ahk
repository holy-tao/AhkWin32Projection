#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INSSBuffer.ahk" { INSSBuffer }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMReaderAllocatorEx interface provides expanded alternatives to the AllocateForOutput and AllocateForStream methods of the IWMReaderCallbackAdvanced interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmreaderallocatorex
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMReaderAllocatorEx extends IUnknown {
    /**
     * The interface identifier for IWMReaderAllocatorEx
     * @type {Guid}
     */
    static IID := Guid("{9f762fa7-a22e-428d-93c9-ac82f3aafe5a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMReaderAllocatorEx interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AllocateForStreamEx : IntPtr
        AllocateForOutputEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMReaderAllocatorEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The AllocateForStreamEx method allocates a user-created buffer for samples delivered to the IWMReaderCallbackAdvanced::OnStreamSample method.
     * @remarks
     * This method differs from <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreadercallbackadvanced-allocateforstream">IWMReaderCallbackAdvanced::AllocateForStream</a> in that sample time and duration values can be passed.
     * 
     * When you allocate a sample in your implementation of this method, you should call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsbuffer/nf-wmsbuffer-inssbuffer-setlength">INSSBuffer::SetLength</a> to set the length of the buffer to the length passed by the reader in the <i>cbBuffer</i> parameter. If you do not set the current length on the buffer, the reader may encounter an error.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number.
     * @param {Integer} cbBuffer Size of <i>ppBuffer</i>, in bytes.
     * @param {Integer} dwFlags <b>DWORD</b> containing the relevant flags.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WM_SFEX_NOTASYNCPOINT</td>
     * <td>This flag is the opposite of the WM_SF_CLEANPOINT flag used in other methods of this SDK. It indicates that the point is not a <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">key frame</a>, or is not a good point to go to during a seek. This inverse definition is used for compatibility with Direct Show.</td>
     * </tr>
     * <tr>
     * <td>WM_SFEX_DATALOSS</td>
     * <td>Some data has been lost between the previous sample and the sample with the flag set.</td>
     * </tr>
     * </table>
     * @param {Integer} cnsSampleTime Specifies the sample time, in 100-nanosecond units.
     * @param {Integer} cnsSampleDuration Specifies the sample duration, in 100-nanosecond units.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application. This pointer is the context pointer given to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreader-start">IWMReader::Start</a> method.
     * @returns {INSSBuffer} Pointer to a pointer to an <b>INSSBuffer</b> object.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderallocatorex-allocateforstreamex
     */
    AllocateForStreamEx(wStreamNum, cbBuffer, dwFlags, cnsSampleTime, cnsSampleDuration, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ushort", wStreamNum, "uint", cbBuffer, "ptr*", &ppBuffer := 0, "uint", dwFlags, "uint", cnsSampleTime, "uint", cnsSampleDuration, pvContextMarshal, pvContext, "HRESULT")
        return INSSBuffer(ppBuffer)
    }

    /**
     * The AllocateForOutputEx method allocates a user-created buffer for samples delivered to the IWMReaderCallback::OnSample method.
     * @remarks
     * This method differs from <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreadercallbackadvanced-allocateforoutput">IWMReaderCallbackAdvanced::AllocateForOutput</a> in that sample time and duration values can be passed.
     * 
     * When you allocate a sample in your implementation of this method, you should call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsbuffer/nf-wmsbuffer-inssbuffer-setlength">INSSBuffer::SetLength</a> to set the length of the buffer to the length passed by the reader in the <i>cbBuffer</i> parameter. If you do not set the current length on the buffer, the reader may encounter an error.
     * @param {Integer} dwOutputNum <b>DWORD</b> containing the output number.
     * @param {Integer} cbBuffer Size of <i>ppBuffer</i>, in bytes.
     * @param {Integer} dwFlags <b>DWORD</b> containing the relevant flags.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WM_SFEX_NOTASYNCPOINT</td>
     * <td>This flag is the opposite of the WM_SF_CLEANPOINT flag used in other methods of this SDK. It indicates that the point is not a <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">key frame</a>, or is not a good point to go to during a seek. This inverse definition is used for compatibility with DirectShow.</td>
     * </tr>
     * <tr>
     * <td>WM_SFEX_DATALOSS</td>
     * <td>Some data has been lost between the previous sample and the sample with the flag set.</td>
     * </tr>
     * </table>
     * @param {Integer} cnsSampleTime Specifies the sample time, in 100-nanosecond units.
     * @param {Integer} cnsSampleDuration Specifies the sample duration, in 100-nanosecond units.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application. This pointer is the context pointer given to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreader-start">IWMReader::Start</a> method.
     * @returns {INSSBuffer} Pointer to a pointer to an <b>INSSBuffer</b> object.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderallocatorex-allocateforoutputex
     */
    AllocateForOutputEx(dwOutputNum, cbBuffer, dwFlags, cnsSampleTime, cnsSampleDuration, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "uint", dwOutputNum, "uint", cbBuffer, "ptr*", &ppBuffer := 0, "uint", dwFlags, "uint", cnsSampleTime, "uint", cnsSampleDuration, pvContextMarshal, pvContext, "HRESULT")
        return INSSBuffer(ppBuffer)
    }

    Query(iid) {
        if (IWMReaderAllocatorEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AllocateForStreamEx := CallbackCreate(GetMethod(implObj, "AllocateForStreamEx"), flags, 8)
        this.vtbl.AllocateForOutputEx := CallbackCreate(GetMethod(implObj, "AllocateForOutputEx"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AllocateForStreamEx)
        CallbackFree(this.vtbl.AllocateForOutputEx)
    }
}
