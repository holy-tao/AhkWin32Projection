#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMOutputMediaProps.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMSyncReader interface provides the ability to read ASF files using synchronous calls.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmsyncreader
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMSyncReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMSyncReader
     * @type {Guid}
     */
    static IID => Guid("{9397f121-7705-4dc9-b049-98b698188414}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Close", "SetRange", "SetRangeByFrame", "GetNextSample", "SetStreamsSelected", "GetStreamSelected", "SetReadStreamSamples", "GetReadStreamSamples", "GetOutputSetting", "SetOutputSetting", "GetOutputCount", "GetOutputProps", "SetOutputProps", "GetOutputFormatCount", "GetOutputFormat", "GetOutputNumberForStream", "GetStreamNumberForOutput", "GetMaxOutputSampleSize", "GetMaxStreamSampleSize", "OpenStream"]

    /**
     * 
     * @param {PWSTR} pwszFilename 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader-open
     */
    Open(pwszFilename) {
        pwszFilename := pwszFilename is String ? StrPtr(pwszFilename) : pwszFilename

        result := ComCall(3, this, "ptr", pwszFilename, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cnsStartTime 
     * @param {Integer} cnsDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader-setrange
     */
    SetRange(cnsStartTime, cnsDuration) {
        result := ComCall(5, this, "uint", cnsStartTime, "int64", cnsDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Integer} qwFrameNumber 
     * @param {Integer} cFramesToRead 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader-setrangebyframe
     */
    SetRangeByFrame(wStreamNum, qwFrameNumber, cFramesToRead) {
        result := ComCall(6, this, "ushort", wStreamNum, "uint", qwFrameNumber, "int64", cFramesToRead, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<INSSBuffer>} ppSample 
     * @param {Pointer<Integer>} pcnsSampleTime 
     * @param {Pointer<Integer>} pcnsDuration 
     * @param {Pointer<Integer>} pdwFlags 
     * @param {Pointer<Integer>} pdwOutputNum 
     * @param {Pointer<Integer>} pwStreamNum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader-getnextsample
     */
    GetNextSample(wStreamNum, ppSample, pcnsSampleTime, pcnsDuration, pdwFlags, pdwOutputNum, pwStreamNum) {
        pcnsSampleTimeMarshal := pcnsSampleTime is VarRef ? "uint*" : "ptr"
        pcnsDurationMarshal := pcnsDuration is VarRef ? "uint*" : "ptr"
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"
        pdwOutputNumMarshal := pdwOutputNum is VarRef ? "uint*" : "ptr"
        pwStreamNumMarshal := pwStreamNum is VarRef ? "ushort*" : "ptr"

        result := ComCall(7, this, "ushort", wStreamNum, "ptr*", ppSample, pcnsSampleTimeMarshal, pcnsSampleTime, pcnsDurationMarshal, pcnsDuration, pdwFlagsMarshal, pdwFlags, pdwOutputNumMarshal, pdwOutputNum, pwStreamNumMarshal, pwStreamNum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cStreamCount 
     * @param {Pointer<Integer>} pwStreamNumbers 
     * @param {Pointer<Integer>} pSelections 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader-setstreamsselected
     */
    SetStreamsSelected(cStreamCount, pwStreamNumbers, pSelections) {
        pwStreamNumbersMarshal := pwStreamNumbers is VarRef ? "ushort*" : "ptr"
        pSelectionsMarshal := pSelections is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, "ushort", cStreamCount, pwStreamNumbersMarshal, pwStreamNumbers, pSelectionsMarshal, pSelections, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader-getstreamselected
     */
    GetStreamSelected(wStreamNum) {
        result := ComCall(9, this, "ushort", wStreamNum, "int*", &pSelection := 0, "HRESULT")
        return pSelection
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {BOOL} fCompressed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader-setreadstreamsamples
     */
    SetReadStreamSamples(wStreamNum, fCompressed) {
        result := ComCall(10, this, "ushort", wStreamNum, "int", fCompressed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader-getreadstreamsamples
     */
    GetReadStreamSamples(wStreamNum) {
        result := ComCall(11, this, "ushort", wStreamNum, "int*", &pfCompressed := 0, "HRESULT")
        return pfCompressed
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {PWSTR} pszName 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pcbLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader-getoutputsetting
     */
    GetOutputSetting(dwOutputNum, pszName, pType, pValue, pcbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pcbLengthMarshal := pcbLength is VarRef ? "ushort*" : "ptr"

        result := ComCall(12, this, "uint", dwOutputNum, "ptr", pszName, pTypeMarshal, pType, pValueMarshal, pValue, pcbLengthMarshal, pcbLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {PWSTR} pszName 
     * @param {Integer} Type 
     * @param {Pointer<Integer>} pValue 
     * @param {Integer} cbLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader-setoutputsetting
     */
    SetOutputSetting(dwOutputNum, pszName, Type, pValue, cbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(13, this, "uint", dwOutputNum, "ptr", pszName, "int", Type, pValueMarshal, pValue, "ushort", cbLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader-getoutputcount
     */
    GetOutputCount() {
        result := ComCall(14, this, "uint*", &pcOutputs := 0, "HRESULT")
        return pcOutputs
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @returns {IWMOutputMediaProps} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader-getoutputprops
     */
    GetOutputProps(dwOutputNum) {
        result := ComCall(15, this, "uint", dwOutputNum, "ptr*", &ppOutput := 0, "HRESULT")
        return IWMOutputMediaProps(ppOutput)
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {IWMOutputMediaProps} pOutput 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader-setoutputprops
     */
    SetOutputProps(dwOutputNum, pOutput) {
        result := ComCall(16, this, "uint", dwOutputNum, "ptr", pOutput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader-getoutputformatcount
     */
    GetOutputFormatCount(dwOutputNum) {
        result := ComCall(17, this, "uint", dwOutputNum, "uint*", &pcFormats := 0, "HRESULT")
        return pcFormats
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Integer} dwFormatNum 
     * @returns {IWMOutputMediaProps} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader-getoutputformat
     */
    GetOutputFormat(dwOutputNum, dwFormatNum) {
        result := ComCall(18, this, "uint", dwOutputNum, "uint", dwFormatNum, "ptr*", &ppProps := 0, "HRESULT")
        return IWMOutputMediaProps(ppProps)
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader-getoutputnumberforstream
     */
    GetOutputNumberForStream(wStreamNum) {
        result := ComCall(19, this, "ushort", wStreamNum, "uint*", &pdwOutputNum := 0, "HRESULT")
        return pdwOutputNum
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader-getstreamnumberforoutput
     */
    GetStreamNumberForOutput(dwOutputNum) {
        result := ComCall(20, this, "uint", dwOutputNum, "ushort*", &pwStreamNum := 0, "HRESULT")
        return pwStreamNum
    }

    /**
     * 
     * @param {Integer} dwOutput 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader-getmaxoutputsamplesize
     */
    GetMaxOutputSampleSize(dwOutput) {
        result := ComCall(21, this, "uint", dwOutput, "uint*", &pcbMax := 0, "HRESULT")
        return pcbMax
    }

    /**
     * 
     * @param {Integer} wStream 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader-getmaxstreamsamplesize
     */
    GetMaxStreamSampleSize(wStream) {
        result := ComCall(22, this, "ushort", wStream, "uint*", &pcbMax := 0, "HRESULT")
        return pcbMax
    }

    /**
     * 
     * @param {IStream} pStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader-openstream
     */
    OpenStream(pStream) {
        result := ComCall(23, this, "ptr", pStream, "HRESULT")
        return result
    }
}
