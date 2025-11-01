#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMStreamConfig interface is the primary interface of a stream configuration object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmstreamconfig
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMStreamConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMStreamConfig
     * @type {Guid}
     */
    static IID => Guid("{96406bdc-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamType", "GetStreamNumber", "SetStreamNumber", "GetStreamName", "SetStreamName", "GetConnectionName", "SetConnectionName", "GetBitrate", "SetBitrate", "GetBufferWindow", "SetBufferWindow"]

    /**
     * 
     * @param {Pointer<Guid>} pguidStreamType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmstreamconfig-getstreamtype
     */
    GetStreamType(pguidStreamType) {
        result := ComCall(3, this, "ptr", pguidStreamType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwStreamNum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmstreamconfig-getstreamnumber
     */
    GetStreamNumber(pwStreamNum) {
        pwStreamNumMarshal := pwStreamNum is VarRef ? "ushort*" : "ptr"

        result := ComCall(4, this, pwStreamNumMarshal, pwStreamNum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmstreamconfig-setstreamnumber
     */
    SetStreamNumber(wStreamNum) {
        result := ComCall(5, this, "ushort", wStreamNum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszStreamName 
     * @param {Pointer<Integer>} pcchStreamName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmstreamconfig-getstreamname
     */
    GetStreamName(pwszStreamName, pcchStreamName) {
        pwszStreamName := pwszStreamName is String ? StrPtr(pwszStreamName) : pwszStreamName

        pcchStreamNameMarshal := pcchStreamName is VarRef ? "ushort*" : "ptr"

        result := ComCall(6, this, "ptr", pwszStreamName, pcchStreamNameMarshal, pcchStreamName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszStreamName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmstreamconfig-setstreamname
     */
    SetStreamName(pwszStreamName) {
        pwszStreamName := pwszStreamName is String ? StrPtr(pwszStreamName) : pwszStreamName

        result := ComCall(7, this, "ptr", pwszStreamName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszInputName 
     * @param {Pointer<Integer>} pcchInputName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmstreamconfig-getconnectionname
     */
    GetConnectionName(pwszInputName, pcchInputName) {
        pwszInputName := pwszInputName is String ? StrPtr(pwszInputName) : pwszInputName

        pcchInputNameMarshal := pcchInputName is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, "ptr", pwszInputName, pcchInputNameMarshal, pcchInputName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszInputName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmstreamconfig-setconnectionname
     */
    SetConnectionName(pwszInputName) {
        pwszInputName := pwszInputName is String ? StrPtr(pwszInputName) : pwszInputName

        result := ComCall(9, this, "ptr", pwszInputName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwBitrate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmstreamconfig-getbitrate
     */
    GetBitrate(pdwBitrate) {
        pdwBitrateMarshal := pdwBitrate is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pdwBitrateMarshal, pdwBitrate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pdwBitrate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmstreamconfig-setbitrate
     */
    SetBitrate(pdwBitrate) {
        result := ComCall(11, this, "uint", pdwBitrate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pmsBufferWindow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmstreamconfig-getbufferwindow
     */
    GetBufferWindow(pmsBufferWindow) {
        pmsBufferWindowMarshal := pmsBufferWindow is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pmsBufferWindowMarshal, pmsBufferWindow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} msBufferWindow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmstreamconfig-setbufferwindow
     */
    SetBufferWindow(msBufferWindow) {
        result := ComCall(13, this, "uint", msBufferWindow, "HRESULT")
        return result
    }
}
