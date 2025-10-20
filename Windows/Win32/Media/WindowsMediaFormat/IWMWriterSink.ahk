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
     * 
     * @param {Pointer<INSSBuffer>} pHeader 
     * @returns {HRESULT} 
     */
    OnHeader(pHeader) {
        result := ComCall(3, this, "ptr", pHeader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfRealTime 
     * @returns {HRESULT} 
     */
    IsRealTime(pfRealTime) {
        result := ComCall(4, this, "ptr", pfRealTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbDataUnit 
     * @param {Pointer<INSSBuffer>} ppDataUnit 
     * @returns {HRESULT} 
     */
    AllocateDataUnit(cbDataUnit, ppDataUnit) {
        result := ComCall(5, this, "uint", cbDataUnit, "ptr", ppDataUnit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INSSBuffer>} pDataUnit 
     * @returns {HRESULT} 
     */
    OnDataUnit(pDataUnit) {
        result := ComCall(6, this, "ptr", pDataUnit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnEndWriting() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
