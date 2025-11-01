#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {INSSBuffer} pHeader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwritersink-onheader
     */
    OnHeader(pHeader) {
        result := ComCall(3, this, "ptr", pHeader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfRealTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwritersink-isrealtime
     */
    IsRealTime(pfRealTime) {
        result := ComCall(4, this, "ptr", pfRealTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbDataUnit 
     * @param {Pointer<INSSBuffer>} ppDataUnit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwritersink-allocatedataunit
     */
    AllocateDataUnit(cbDataUnit, ppDataUnit) {
        result := ComCall(5, this, "uint", cbDataUnit, "ptr*", ppDataUnit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {INSSBuffer} pDataUnit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwritersink-ondataunit
     */
    OnDataUnit(pDataUnit) {
        result := ComCall(6, this, "ptr", pDataUnit, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwritersink-onendwriting
     */
    OnEndWriting() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
