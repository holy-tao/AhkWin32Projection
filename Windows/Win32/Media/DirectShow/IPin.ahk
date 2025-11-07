#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPin.ahk
#Include ..\MediaFoundation\AM_MEDIA_TYPE.ahk
#Include .\PIN_INFO.ahk
#Include .\IEnumMediaTypes.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is exposed by all input and output pins.The filter graph manager uses this interface to connect pins and perform flushing operations.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ipin
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IPin extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Connect", "ReceiveConnection", "Disconnect", "ConnectedTo", "ConnectionMediaType", "QueryPinInfo", "QueryDirection", "QueryId", "QueryAccept", "EnumMediaTypes", "QueryInternalConnections", "EndOfStream", "BeginFlush", "EndFlush", "NewSegment"]

    /**
     * 
     * @param {IPin} pReceivePin 
     * @param {Pointer<AM_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipin-connect
     */
    Connect(pReceivePin, pmt) {
        result := ComCall(3, this, "ptr", pReceivePin, "ptr", pmt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPin} pConnector 
     * @param {Pointer<AM_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipin-receiveconnection
     */
    ReceiveConnection(pConnector, pmt) {
        result := ComCall(4, this, "ptr", pConnector, "ptr", pmt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipin-disconnect
     */
    Disconnect() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IPin} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipin-connectedto
     */
    ConnectedTo() {
        result := ComCall(6, this, "ptr*", &pPin := 0, "HRESULT")
        return IPin(pPin)
    }

    /**
     * 
     * @returns {AM_MEDIA_TYPE} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipin-connectionmediatype
     */
    ConnectionMediaType() {
        pmt := AM_MEDIA_TYPE()
        result := ComCall(7, this, "ptr", pmt, "HRESULT")
        return pmt
    }

    /**
     * 
     * @returns {PIN_INFO} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipin-querypininfo
     */
    QueryPinInfo() {
        pInfo := PIN_INFO()
        result := ComCall(8, this, "ptr", pInfo, "HRESULT")
        return pInfo
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipin-querydirection
     */
    QueryDirection() {
        result := ComCall(9, this, "int*", &pPinDir := 0, "HRESULT")
        return pPinDir
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipin-queryid
     */
    QueryId() {
        result := ComCall(10, this, "ptr*", &Id := 0, "HRESULT")
        return Id
    }

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipin-queryaccept
     */
    QueryAccept(pmt) {
        result := ComCall(11, this, "ptr", pmt, "int")
        return result
    }

    /**
     * 
     * @returns {IEnumMediaTypes} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipin-enummediatypes
     */
    EnumMediaTypes() {
        result := ComCall(12, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumMediaTypes(ppEnum)
    }

    /**
     * 
     * @param {Pointer<Integer>} nPin 
     * @returns {IPin} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipin-queryinternalconnections
     */
    QueryInternalConnections(nPin) {
        nPinMarshal := nPin is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr*", &apPin := 0, nPinMarshal, nPin, "HRESULT")
        return IPin(apPin)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipin-endofstream
     */
    EndOfStream() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipin-beginflush
     */
    BeginFlush() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipin-endflush
     */
    EndFlush() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tStart 
     * @param {Integer} tStop 
     * @param {Float} dRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipin-newsegment
     */
    NewSegment(tStart, tStop, dRate) {
        result := ComCall(17, this, "int64", tStart, "int64", tStop, "double", dRate, "HRESULT")
        return result
    }
}
