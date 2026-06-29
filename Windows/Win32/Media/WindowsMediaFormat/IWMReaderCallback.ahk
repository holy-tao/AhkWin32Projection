#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INSSBuffer.ahk" { INSSBuffer }
#Import ".\IWMStatusCallback.ahk" { IWMStatusCallback }

/**
 * The IWMReaderCallback is implemented by the application to handle data being read from a file. A pointer to the interface is passed to IWMReader::Open.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmreadercallback
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMReaderCallback extends IWMStatusCallback {
    /**
     * The interface identifier for IWMReaderCallback
     * @type {Guid}
     */
    static IID := Guid("{96406bd8-2b2b-11d3-b36b-00c04f6108ff}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMReaderCallback interfaces
    */
    struct Vtbl extends IWMStatusCallback.Vtbl {
        OnSample : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMReaderCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The OnSample method is called during the reading of a file (due to a Start call) indicating that new data is available.
     * @remarks
     * This method is for receipt of uncompressed samples by output number only. If you need to receive samples for multiple streams in a single output (as in the case of mutually exclusive streams), you must use <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreadercallbackadvanced-onstreamsample">IWMReaderCallbackAdvanced::OnStreamSample</a>. In this case, you will receive compressed samples. There is no way to use the reader to receive uncompressed samples by stream number.
     * @param {Integer} dwOutputNum <b>DWORD</b> containing the number of the output to which the sample belongs.
     * @param {Integer} cnsSampleTime <b>QWORD</b> containing the sample time, in 100-nanosecond units.
     * @param {Integer} cnsSampleDuration <b>QWORD</b> containing the sample duration, in 100-nanosecond units. For video streams, if the SampleDuration data unit extension was set on this sample when the file was created, then this parameter will contain that value. For more information on SampleDuration , see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsbuffer/nf-wmsbuffer-inssbuffer3-getproperty">INSSBuffer3::GetProperty</a>.
     * @param {Integer} dwFlags The flags that can be specified in <i>dwFlags</i> have the following uses.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>No flag set</td>
     * <td>None of the conditions for the other flags applies. For example, a <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">delta frame</a> in most cases would not have any flags set for it.</td>
     * </tr>
     * <tr>
     * <td>WM_SF_CLEANPOINT</td>
     * <td>This is the same as a <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">key frame</a>. It indicates a good point to go to during a seek, for example.</td>
     * </tr>
     * <tr>
     * <td>WM_SF_DISCONTINUITY</td>
     * <td>The data stream has a gap in it, which could be due to a seek, a network loss, or other reason. This can be useful extra information for an application such as a codec or renderer. The flag is set on the first piece of data following the gap.</td>
     * </tr>
     * <tr>
     * <td>WM_SF_DATALOSS</td>
     * <td>Some data has been lost between the previous sample and the sample with this flag set.</td>
     * </tr>
     * </table>
     * @param {INSSBuffer} pSample Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface of an object containing the sample. The reader calls <b>SAFE_RELEASE</b> on this pointer after your <b>OnSample</b> method returns. You can call <b>AddRef</b> on this pointer if you need to keep a reference count on the buffer. Do not call <b>Release</b> on this pointer unless you have called <b>AddRef</b>.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application. This pointer is the context pointer given to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreader-start">IWMReader::Start</a> method.
     * @returns {HRESULT} To use this method, you must implement it in your application. The method should always return S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadercallback-onsample
     */
    OnSample(dwOutputNum, cnsSampleTime, cnsSampleDuration, dwFlags, pSample, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "uint", dwOutputNum, "uint", cnsSampleTime, "uint", cnsSampleDuration, "uint", dwFlags, "ptr", pSample, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMReaderCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnSample := CallbackCreate(GetMethod(implObj, "OnSample"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnSample)
    }
}
