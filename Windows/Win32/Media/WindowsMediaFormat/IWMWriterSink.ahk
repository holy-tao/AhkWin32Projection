#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INSSBuffer.ahk" { INSSBuffer }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMWriterSink interface is the basic interface of all writer sinks, including the file, network, and push sinks defined in the Windows Media Format SDK, and custom sinks.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmwritersink
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMWriterSink extends IUnknown {
    /**
     * The interface identifier for IWMWriterSink
     * @type {Guid}
     */
    static IID := Guid("{96406be4-2b2b-11d3-b36b-00c04f6108ff}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMWriterSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnHeader         : IntPtr
        IsRealTime       : IntPtr
        AllocateDataUnit : IntPtr
        OnDataUnit       : IntPtr
        OnEndWriting     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMWriterSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The OnHeader method is called by the writer when the ASF header is ready for the sink.
     * @remarks
     * The ASF header will always be sent before any data units, as the header is required for reading the content. The writer may send the header more than once for a given file. If possible, your sink should write any headers received.
     * @param {INSSBuffer} pHeader Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface on an object containing the ASF header.
     * @returns {HRESULT} This method is implemented by the application. It should always return S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwritersink-onheader
     */
    OnHeader(pHeader) {
        result := ComCall(3, this, "ptr", pHeader, "HRESULT")
        return result
    }

    /**
     * The IsRealTime is called by the writer to determine whether the sink needs data units to be delivered in real time. It is up to you to decide whether your custom sink requires real-time delivery.
     * @returns {BOOL} Pointer to a Boolean value that is True if the sink requires real time data unit delivery.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwritersink-isrealtime
     */
    IsRealTime() {
        result := ComCall(4, this, BOOL.Ptr, &pfRealTime := 0, "HRESULT")
        return pfRealTime
    }

    /**
     * The AllocateDataUnit method is called by the writer object when it needs a buffer to deliver a data unit.
     * @param {Integer} cbDataUnit Size of the data unit that the writer needs to deliver, in bytes. The buffer you assign to <i>ppDataUnit</i> must be this size or bigger.
     * @returns {INSSBuffer} On return, set to a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface of a buffer object.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwritersink-allocatedataunit
     */
    AllocateDataUnit(cbDataUnit) {
        result := ComCall(5, this, "uint", cbDataUnit, "ptr*", &ppDataUnit := 0, "HRESULT")
        return INSSBuffer(ppDataUnit)
    }

    /**
     * The OnDataUnit method is called by the writer when a data unit is ready for the sink. How your application handles the data unit depends upon the destination of the content.
     * @param {INSSBuffer} pDataUnit Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface on an object containing the data unit.
     * @returns {HRESULT} This method is implemented by the application. It should always return S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwritersink-ondataunit
     */
    OnDataUnit(pDataUnit) {
        result := ComCall(6, this, "ptr", pDataUnit, "HRESULT")
        return result
    }

    /**
     * The OnEndWriting method is called by the writer when writing is complete. This method should conclude operations for your sink. For example, the writer file sink closes and indexes the file.
     * @returns {HRESULT} This method is implemented by the application. It should always return S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwritersink-onendwriting
     */
    OnEndWriting() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMWriterSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnHeader := CallbackCreate(GetMethod(implObj, "OnHeader"), flags, 2)
        this.vtbl.IsRealTime := CallbackCreate(GetMethod(implObj, "IsRealTime"), flags, 2)
        this.vtbl.AllocateDataUnit := CallbackCreate(GetMethod(implObj, "AllocateDataUnit"), flags, 3)
        this.vtbl.OnDataUnit := CallbackCreate(GetMethod(implObj, "OnDataUnit"), flags, 2)
        this.vtbl.OnEndWriting := CallbackCreate(GetMethod(implObj, "OnEndWriting"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnHeader)
        CallbackFree(this.vtbl.IsRealTime)
        CallbackFree(this.vtbl.AllocateDataUnit)
        CallbackFree(this.vtbl.OnDataUnit)
        CallbackFree(this.vtbl.OnEndWriting)
    }
}
