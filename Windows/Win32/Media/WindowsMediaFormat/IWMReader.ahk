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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Close", "GetOutputCount", "GetOutputProps", "SetOutputProps", "GetOutputFormatCount", "GetOutputFormat", "Start", "Stop", "Pause", "Resume"]

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {IWMReaderCallback} pCallback 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreader-open
     */
    Open(pwszURL, pCallback, pvContext) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(3, this, "ptr", pwszURL, "ptr", pCallback, "ptr", pvContext, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreader-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcOutputs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreader-getoutputcount
     */
    GetOutputCount(pcOutputs) {
        result := ComCall(5, this, "uint*", pcOutputs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Pointer<IWMOutputMediaProps>} ppOutput 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreader-getoutputprops
     */
    GetOutputProps(dwOutputNum, ppOutput) {
        result := ComCall(6, this, "uint", dwOutputNum, "ptr*", ppOutput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {IWMOutputMediaProps} pOutput 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreader-setoutputprops
     */
    SetOutputProps(dwOutputNum, pOutput) {
        result := ComCall(7, this, "uint", dwOutputNum, "ptr", pOutput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNumber 
     * @param {Pointer<Integer>} pcFormats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreader-getoutputformatcount
     */
    GetOutputFormatCount(dwOutputNumber, pcFormats) {
        result := ComCall(8, this, "uint", dwOutputNumber, "uint*", pcFormats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNumber 
     * @param {Integer} dwFormatNumber 
     * @param {Pointer<IWMOutputMediaProps>} ppProps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreader-getoutputformat
     */
    GetOutputFormat(dwOutputNumber, dwFormatNumber, ppProps) {
        result := ComCall(9, this, "uint", dwOutputNumber, "uint", dwFormatNumber, "ptr*", ppProps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cnsStart 
     * @param {Integer} cnsDuration 
     * @param {Float} fRate 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreader-start
     */
    Start(cnsStart, cnsDuration, fRate, pvContext) {
        result := ComCall(10, this, "uint", cnsStart, "uint", cnsDuration, "float", fRate, "ptr", pvContext, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreader-stop
     */
    Stop() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreader-pause
     */
    Pause() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreader-resume
     */
    Resume() {
        result := ComCall(13, this, "HRESULT")
        return result
    }
}
