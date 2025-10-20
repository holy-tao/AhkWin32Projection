#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMSyncReader interface provides the ability to read ASF files using synchronous calls.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmsyncreader
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMSyncReader extends IUnknown{
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
     * 
     * @param {PWSTR} pwszFilename 
     * @returns {HRESULT} 
     */
    Open(pwszFilename) {
        pwszFilename := pwszFilename is String ? StrPtr(pwszFilename) : pwszFilename

        result := ComCall(3, this, "ptr", pwszFilename, "int")
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
     * @param {Integer} cnsStartTime 
     * @param {Integer} cnsDuration 
     * @returns {HRESULT} 
     */
    SetRange(cnsStartTime, cnsDuration) {
        result := ComCall(5, this, "uint", cnsStartTime, "int64", cnsDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Integer} qwFrameNumber 
     * @param {Integer} cFramesToRead 
     * @returns {HRESULT} 
     */
    SetRangeByFrame(wStreamNum, qwFrameNumber, cFramesToRead) {
        result := ComCall(6, this, "ushort", wStreamNum, "uint", qwFrameNumber, "int64", cFramesToRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<INSSBuffer>} ppSample 
     * @param {Pointer<UInt64>} pcnsSampleTime 
     * @param {Pointer<UInt64>} pcnsDuration 
     * @param {Pointer<UInt32>} pdwFlags 
     * @param {Pointer<UInt32>} pdwOutputNum 
     * @param {Pointer<UInt16>} pwStreamNum 
     * @returns {HRESULT} 
     */
    GetNextSample(wStreamNum, ppSample, pcnsSampleTime, pcnsDuration, pdwFlags, pdwOutputNum, pwStreamNum) {
        result := ComCall(7, this, "ushort", wStreamNum, "ptr", ppSample, "uint*", pcnsSampleTime, "uint*", pcnsDuration, "uint*", pdwFlags, "uint*", pdwOutputNum, "ushort*", pwStreamNum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cStreamCount 
     * @param {Pointer<UInt16>} pwStreamNumbers 
     * @param {Pointer<Int32>} pSelections 
     * @returns {HRESULT} 
     */
    SetStreamsSelected(cStreamCount, pwStreamNumbers, pSelections) {
        result := ComCall(8, this, "ushort", cStreamCount, "ushort*", pwStreamNumbers, "int*", pSelections, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<Int32>} pSelection 
     * @returns {HRESULT} 
     */
    GetStreamSelected(wStreamNum, pSelection) {
        result := ComCall(9, this, "ushort", wStreamNum, "int*", pSelection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {BOOL} fCompressed 
     * @returns {HRESULT} 
     */
    SetReadStreamSamples(wStreamNum, fCompressed) {
        result := ComCall(10, this, "ushort", wStreamNum, "int", fCompressed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<BOOL>} pfCompressed 
     * @returns {HRESULT} 
     */
    GetReadStreamSamples(wStreamNum, pfCompressed) {
        result := ComCall(11, this, "ushort", wStreamNum, "ptr", pfCompressed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {PWSTR} pszName 
     * @param {Pointer<Int32>} pType 
     * @param {Pointer<Byte>} pValue 
     * @param {Pointer<UInt16>} pcbLength 
     * @returns {HRESULT} 
     */
    GetOutputSetting(dwOutputNum, pszName, pType, pValue, pcbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(12, this, "uint", dwOutputNum, "ptr", pszName, "int*", pType, "char*", pValue, "ushort*", pcbLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {PWSTR} pszName 
     * @param {Integer} Type 
     * @param {Pointer<Byte>} pValue 
     * @param {Integer} cbLength 
     * @returns {HRESULT} 
     */
    SetOutputSetting(dwOutputNum, pszName, Type, pValue, cbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(13, this, "uint", dwOutputNum, "ptr", pszName, "int", Type, "char*", pValue, "ushort", cbLength, "int")
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
        result := ComCall(14, this, "uint*", pcOutputs, "int")
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
        result := ComCall(15, this, "uint", dwOutputNum, "ptr", ppOutput, "int")
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
        result := ComCall(16, this, "uint", dwOutputNum, "ptr", pOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Pointer<UInt32>} pcFormats 
     * @returns {HRESULT} 
     */
    GetOutputFormatCount(dwOutputNum, pcFormats) {
        result := ComCall(17, this, "uint", dwOutputNum, "uint*", pcFormats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Integer} dwFormatNum 
     * @param {Pointer<IWMOutputMediaProps>} ppProps 
     * @returns {HRESULT} 
     */
    GetOutputFormat(dwOutputNum, dwFormatNum, ppProps) {
        result := ComCall(18, this, "uint", dwOutputNum, "uint", dwFormatNum, "ptr", ppProps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<UInt32>} pdwOutputNum 
     * @returns {HRESULT} 
     */
    GetOutputNumberForStream(wStreamNum, pdwOutputNum) {
        result := ComCall(19, this, "ushort", wStreamNum, "uint*", pdwOutputNum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Pointer<UInt16>} pwStreamNum 
     * @returns {HRESULT} 
     */
    GetStreamNumberForOutput(dwOutputNum, pwStreamNum) {
        result := ComCall(20, this, "uint", dwOutputNum, "ushort*", pwStreamNum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutput 
     * @param {Pointer<UInt32>} pcbMax 
     * @returns {HRESULT} 
     */
    GetMaxOutputSampleSize(dwOutput, pcbMax) {
        result := ComCall(21, this, "uint", dwOutput, "uint*", pcbMax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStream 
     * @param {Pointer<UInt32>} pcbMax 
     * @returns {HRESULT} 
     */
    GetMaxStreamSampleSize(wStream, pcbMax) {
        result := ComCall(22, this, "ushort", wStream, "uint*", pcbMax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pStream 
     * @returns {HRESULT} 
     */
    OpenStream(pStream) {
        result := ComCall(23, this, "ptr", pStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
