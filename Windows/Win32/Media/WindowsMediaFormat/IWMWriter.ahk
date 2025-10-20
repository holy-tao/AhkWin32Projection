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
     * @param {Pointer<Integer>} pcInputs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriter-getinputcount
     */
    GetInputCount(pcInputs) {
        result := ComCall(6, this, "uint*", pcInputs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputNum 
     * @param {Pointer<IWMInputMediaProps>} ppInput 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriter-getinputprops
     */
    GetInputProps(dwInputNum, ppInput) {
        result := ComCall(7, this, "uint", dwInputNum, "ptr*", ppInput, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pcFormats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriter-getinputformatcount
     */
    GetInputFormatCount(dwInputNumber, pcFormats) {
        result := ComCall(9, this, "uint", dwInputNumber, "uint*", pcFormats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputNumber 
     * @param {Integer} dwFormatNumber 
     * @param {Pointer<IWMInputMediaProps>} pProps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriter-getinputformat
     */
    GetInputFormat(dwInputNumber, dwFormatNumber, pProps) {
        result := ComCall(10, this, "uint", dwInputNumber, "uint", dwFormatNumber, "ptr*", pProps, "HRESULT")
        return result
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
     * @param {Pointer<INSSBuffer>} ppSample 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriter-allocatesample
     */
    AllocateSample(dwSampleSize, ppSample) {
        result := ComCall(13, this, "uint", dwSampleSize, "ptr*", ppSample, "HRESULT")
        return result
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
