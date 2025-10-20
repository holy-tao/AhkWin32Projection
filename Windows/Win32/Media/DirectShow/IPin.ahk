#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is exposed by all input and output pins.The filter graph manager uses this interface to connect pins and perform flushing operations.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ipin
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IPin extends IUnknown{
    /**
     * The interface identifier for IPin
     * @type {Guid}
     */
    static IID => Guid("{56a86891-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IPin>} pReceivePin 
     * @param {Pointer<AM_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     */
    Connect(pReceivePin, pmt) {
        result := ComCall(3, this, "ptr", pReceivePin, "ptr", pmt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPin>} pConnector 
     * @param {Pointer<AM_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     */
    ReceiveConnection(pConnector, pmt) {
        result := ComCall(4, this, "ptr", pConnector, "ptr", pmt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Disconnect() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPin>} pPin 
     * @returns {HRESULT} 
     */
    ConnectedTo(pPin) {
        result := ComCall(6, this, "ptr", pPin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     */
    ConnectionMediaType(pmt) {
        result := ComCall(7, this, "ptr", pmt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PIN_INFO>} pInfo 
     * @returns {HRESULT} 
     */
    QueryPinInfo(pInfo) {
        result := ComCall(8, this, "ptr", pInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pPinDir 
     * @returns {HRESULT} 
     */
    QueryDirection(pPinDir) {
        result := ComCall(9, this, "int*", pPinDir, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} Id 
     * @returns {HRESULT} 
     */
    QueryId(Id) {
        result := ComCall(10, this, "ptr", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     */
    QueryAccept(pmt) {
        result := ComCall(11, this, "ptr", pmt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumMediaTypes>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumMediaTypes(ppEnum) {
        result := ComCall(12, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPin>} apPin 
     * @param {Pointer<UInt32>} nPin 
     * @returns {HRESULT} 
     */
    QueryInternalConnections(apPin, nPin) {
        result := ComCall(13, this, "ptr", apPin, "uint*", nPin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndOfStream() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BeginFlush() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndFlush() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tStart 
     * @param {Integer} tStop 
     * @param {Float} dRate 
     * @returns {HRESULT} 
     */
    NewSegment(tStart, tStop, dRate) {
        result := ComCall(17, this, "int64", tStart, "int64", tStop, "double", dRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
