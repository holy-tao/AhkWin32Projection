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
     * 
     * @param {Pointer<Guid>} pguidStreamType 
     * @returns {HRESULT} 
     */
    GetStreamType(pguidStreamType) {
        result := ComCall(3, this, "ptr", pguidStreamType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwStreamNum 
     * @returns {HRESULT} 
     */
    GetStreamNumber(pwStreamNum) {
        result := ComCall(4, this, "ushort*", pwStreamNum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @returns {HRESULT} 
     */
    SetStreamNumber(wStreamNum) {
        result := ComCall(5, this, "ushort", wStreamNum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszStreamName 
     * @param {Pointer<UInt16>} pcchStreamName 
     * @returns {HRESULT} 
     */
    GetStreamName(pwszStreamName, pcchStreamName) {
        pwszStreamName := pwszStreamName is String ? StrPtr(pwszStreamName) : pwszStreamName

        result := ComCall(6, this, "ptr", pwszStreamName, "ushort*", pcchStreamName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszStreamName 
     * @returns {HRESULT} 
     */
    SetStreamName(pwszStreamName) {
        pwszStreamName := pwszStreamName is String ? StrPtr(pwszStreamName) : pwszStreamName

        result := ComCall(7, this, "ptr", pwszStreamName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszInputName 
     * @param {Pointer<UInt16>} pcchInputName 
     * @returns {HRESULT} 
     */
    GetConnectionName(pwszInputName, pcchInputName) {
        pwszInputName := pwszInputName is String ? StrPtr(pwszInputName) : pwszInputName

        result := ComCall(8, this, "ptr", pwszInputName, "ushort*", pcchInputName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszInputName 
     * @returns {HRESULT} 
     */
    SetConnectionName(pwszInputName) {
        pwszInputName := pwszInputName is String ? StrPtr(pwszInputName) : pwszInputName

        result := ComCall(9, this, "ptr", pwszInputName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwBitrate 
     * @returns {HRESULT} 
     */
    GetBitrate(pdwBitrate) {
        result := ComCall(10, this, "uint*", pdwBitrate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pdwBitrate 
     * @returns {HRESULT} 
     */
    SetBitrate(pdwBitrate) {
        result := ComCall(11, this, "uint", pdwBitrate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pmsBufferWindow 
     * @returns {HRESULT} 
     */
    GetBufferWindow(pmsBufferWindow) {
        result := ComCall(12, this, "uint*", pmsBufferWindow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} msBufferWindow 
     * @returns {HRESULT} 
     */
    SetBufferWindow(msBufferWindow) {
        result := ComCall(13, this, "uint", msBufferWindow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
