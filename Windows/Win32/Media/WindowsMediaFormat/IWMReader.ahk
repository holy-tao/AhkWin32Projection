#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMReader interface is used to open, close, start, pause, resume, and unlock the WMReader object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmreader
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReader extends IUnknown{
    /**
     * The interface identifier for IWMReader
     * @type {Guid}
     */
    static IID => Guid("{96406bd6-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {Pointer<IWMReaderCallback>} pCallback 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     */
    Open(pwszURL, pCallback, pvContext) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(3, this, "ptr", pwszURL, "ptr", pCallback, "ptr", pvContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcOutputs 
     * @returns {HRESULT} 
     */
    GetOutputCount(pcOutputs) {
        result := ComCall(5, this, "uint*", pcOutputs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Pointer<IWMOutputMediaProps>} ppOutput 
     * @returns {HRESULT} 
     */
    GetOutputProps(dwOutputNum, ppOutput) {
        result := ComCall(6, this, "uint", dwOutputNum, "ptr", ppOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Pointer<IWMOutputMediaProps>} pOutput 
     * @returns {HRESULT} 
     */
    SetOutputProps(dwOutputNum, pOutput) {
        result := ComCall(7, this, "uint", dwOutputNum, "ptr", pOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNumber 
     * @param {Pointer<UInt32>} pcFormats 
     * @returns {HRESULT} 
     */
    GetOutputFormatCount(dwOutputNumber, pcFormats) {
        result := ComCall(8, this, "uint", dwOutputNumber, "uint*", pcFormats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNumber 
     * @param {Integer} dwFormatNumber 
     * @param {Pointer<IWMOutputMediaProps>} ppProps 
     * @returns {HRESULT} 
     */
    GetOutputFormat(dwOutputNumber, dwFormatNumber, ppProps) {
        result := ComCall(9, this, "uint", dwOutputNumber, "uint", dwFormatNumber, "ptr", ppProps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cnsStart 
     * @param {Integer} cnsDuration 
     * @param {Float} fRate 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     */
    Start(cnsStart, cnsDuration, fRate, pvContext) {
        result := ComCall(10, this, "uint", cnsStart, "uint", cnsDuration, "float", fRate, "ptr", pvContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Resume() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
