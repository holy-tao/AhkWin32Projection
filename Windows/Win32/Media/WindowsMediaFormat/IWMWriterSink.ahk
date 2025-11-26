#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INSSBuffer.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMWriterSink interface is the basic interface of all writer sinks, including the file, network, and push sinks defined in the Windows Media Format SDK, and custom sinks.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmwritersink
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMWriterSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMWriterSink
     * @type {Guid}
     */
    static IID => Guid("{96406be4-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnHeader", "IsRealTime", "AllocateDataUnit", "OnDataUnit", "OnEndWriting"]

    /**
     * The OnHeader method is called by the writer when the ASF header is ready for the sink.
     * @param {INSSBuffer} pHeader Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface on an object containing the ASF header.
     * @returns {HRESULT} This method is implemented by the application. It should always return S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwritersink-onheader
     */
    OnHeader(pHeader) {
        result := ComCall(3, this, "ptr", pHeader, "HRESULT")
        return result
    }

    /**
     * The IsRealTime is called by the writer to determine whether the sink needs data units to be delivered in real time. It is up to you to decide whether your custom sink requires real-time delivery.
     * @returns {BOOL} Pointer to a Boolean value that is True if the sink requires real time data unit delivery.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwritersink-isrealtime
     */
    IsRealTime() {
        result := ComCall(4, this, "int*", &pfRealTime := 0, "HRESULT")
        return pfRealTime
    }

    /**
     * The AllocateDataUnit method is called by the writer object when it needs a buffer to deliver a data unit.
     * @param {Integer} cbDataUnit Size of the data unit that the writer needs to deliver, in bytes. The buffer you assign to <i>ppDataUnit</i> must be this size or bigger.
     * @returns {INSSBuffer} On return, set to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface of a buffer object.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwritersink-allocatedataunit
     */
    AllocateDataUnit(cbDataUnit) {
        result := ComCall(5, this, "uint", cbDataUnit, "ptr*", &ppDataUnit := 0, "HRESULT")
        return INSSBuffer(ppDataUnit)
    }

    /**
     * The OnDataUnit method is called by the writer when a data unit is ready for the sink. How your application handles the data unit depends upon the destination of the content.
     * @param {INSSBuffer} pDataUnit Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface on an object containing the data unit.
     * @returns {HRESULT} This method is implemented by the application. It should always return S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwritersink-ondataunit
     */
    OnDataUnit(pDataUnit) {
        result := ComCall(6, this, "ptr", pDataUnit, "HRESULT")
        return result
    }

    /**
     * The OnEndWriting method is called by the writer when writing is complete. This method should conclude operations for your sink. For example, the writer file sink closes and indexes the file.
     * @returns {HRESULT} This method is implemented by the application. It should always return S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwritersink-onendwriting
     */
    OnEndWriting() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
