#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMInputMediaProps.ahk
#Include .\INSSBuffer.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMWriter interface is used to write ASF files.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmwriter
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMWriter extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProfileByID", "SetProfile", "SetOutputFilename", "GetInputCount", "GetInputProps", "SetInputProps", "GetInputFormatCount", "GetInputFormat", "BeginWriting", "EndWriting", "AllocateSample", "WriteSample", "Flush"]

    /**
     * 
     * @param {Pointer<Guid>} guidProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriter-setprofilebyid
     */
    SetProfileByID(guidProfile) {
        result := ComCall(3, this, "ptr", guidProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMProfile} pProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriter-setprofile
     */
    SetProfile(pProfile) {
        result := ComCall(4, this, "ptr", pProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszFilename 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriter-setoutputfilename
     */
    SetOutputFilename(pwszFilename) {
        pwszFilename := pwszFilename is String ? StrPtr(pwszFilename) : pwszFilename

        result := ComCall(5, this, "ptr", pwszFilename, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriter-getinputcount
     */
    GetInputCount() {
        result := ComCall(6, this, "uint*", &pcInputs := 0, "HRESULT")
        return pcInputs
    }

    /**
     * 
     * @param {Integer} dwInputNum 
     * @returns {IWMInputMediaProps} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriter-getinputprops
     */
    GetInputProps(dwInputNum) {
        result := ComCall(7, this, "uint", dwInputNum, "ptr*", &ppInput := 0, "HRESULT")
        return IWMInputMediaProps(ppInput)
    }

    /**
     * 
     * @param {Integer} dwInputNum 
     * @param {IWMInputMediaProps} pInput 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriter-setinputprops
     */
    SetInputProps(dwInputNum, pInput) {
        result := ComCall(8, this, "uint", dwInputNum, "ptr", pInput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputNumber 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriter-getinputformatcount
     */
    GetInputFormatCount(dwInputNumber) {
        result := ComCall(9, this, "uint", dwInputNumber, "uint*", &pcFormats := 0, "HRESULT")
        return pcFormats
    }

    /**
     * 
     * @param {Integer} dwInputNumber 
     * @param {Integer} dwFormatNumber 
     * @returns {IWMInputMediaProps} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriter-getinputformat
     */
    GetInputFormat(dwInputNumber, dwFormatNumber) {
        result := ComCall(10, this, "uint", dwInputNumber, "uint", dwFormatNumber, "ptr*", &pProps := 0, "HRESULT")
        return IWMInputMediaProps(pProps)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriter-beginwriting
     */
    BeginWriting() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriter-endwriting
     */
    EndWriting() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSampleSize 
     * @returns {INSSBuffer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriter-allocatesample
     */
    AllocateSample(dwSampleSize) {
        result := ComCall(13, this, "uint", dwSampleSize, "ptr*", &ppSample := 0, "HRESULT")
        return INSSBuffer(ppSample)
    }

    /**
     * 
     * @param {Integer} dwInputNum 
     * @param {Integer} cnsSampleTime 
     * @param {Integer} dwFlags 
     * @param {INSSBuffer} pSample 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriter-writesample
     */
    WriteSample(dwInputNum, cnsSampleTime, dwFlags, pSample) {
        result := ComCall(14, this, "uint", dwInputNum, "uint", cnsSampleTime, "uint", dwFlags, "ptr", pSample, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriter-flush
     */
    Flush() {
        result := ComCall(15, this, "HRESULT")
        return result
    }
}
