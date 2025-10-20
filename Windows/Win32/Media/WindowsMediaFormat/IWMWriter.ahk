#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMWriter interface is used to write ASF files.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmwriter
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMWriter extends IUnknown{
    /**
     * The interface identifier for IWMWriter
     * @type {Guid}
     */
    static IID => Guid("{96406bd4-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} guidProfile 
     * @returns {HRESULT} 
     */
    SetProfileByID(guidProfile) {
        result := ComCall(3, this, "ptr", guidProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMProfile>} pProfile 
     * @returns {HRESULT} 
     */
    SetProfile(pProfile) {
        result := ComCall(4, this, "ptr", pProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszFilename 
     * @returns {HRESULT} 
     */
    SetOutputFilename(pwszFilename) {
        pwszFilename := pwszFilename is String ? StrPtr(pwszFilename) : pwszFilename

        result := ComCall(5, this, "ptr", pwszFilename, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcInputs 
     * @returns {HRESULT} 
     */
    GetInputCount(pcInputs) {
        result := ComCall(6, this, "uint*", pcInputs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputNum 
     * @param {Pointer<IWMInputMediaProps>} ppInput 
     * @returns {HRESULT} 
     */
    GetInputProps(dwInputNum, ppInput) {
        result := ComCall(7, this, "uint", dwInputNum, "ptr", ppInput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputNum 
     * @param {Pointer<IWMInputMediaProps>} pInput 
     * @returns {HRESULT} 
     */
    SetInputProps(dwInputNum, pInput) {
        result := ComCall(8, this, "uint", dwInputNum, "ptr", pInput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputNumber 
     * @param {Pointer<UInt32>} pcFormats 
     * @returns {HRESULT} 
     */
    GetInputFormatCount(dwInputNumber, pcFormats) {
        result := ComCall(9, this, "uint", dwInputNumber, "uint*", pcFormats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputNumber 
     * @param {Integer} dwFormatNumber 
     * @param {Pointer<IWMInputMediaProps>} pProps 
     * @returns {HRESULT} 
     */
    GetInputFormat(dwInputNumber, dwFormatNumber, pProps) {
        result := ComCall(10, this, "uint", dwInputNumber, "uint", dwFormatNumber, "ptr", pProps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BeginWriting() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndWriting() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSampleSize 
     * @param {Pointer<INSSBuffer>} ppSample 
     * @returns {HRESULT} 
     */
    AllocateSample(dwSampleSize, ppSample) {
        result := ComCall(13, this, "uint", dwSampleSize, "ptr", ppSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputNum 
     * @param {Integer} cnsSampleTime 
     * @param {Integer} dwFlags 
     * @param {Pointer<INSSBuffer>} pSample 
     * @returns {HRESULT} 
     */
    WriteSample(dwInputNum, cnsSampleTime, dwFlags, pSample) {
        result := ComCall(14, this, "uint", dwInputNum, "uint", cnsSampleTime, "uint", dwFlags, "ptr", pSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Flush() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
