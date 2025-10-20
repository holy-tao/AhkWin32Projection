#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMCodecInfo.ahk

/**
 * The IWMCodecInfo2 interface manages the retrieval of information about codecs. To access it, call QueryInterface on a profile manager object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmcodecinfo2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMCodecInfo2 extends IWMCodecInfo{
    /**
     * The interface identifier for IWMCodecInfo2
     * @type {Guid}
     */
    static IID => Guid("{aa65e273-b686-4056-91ec-dd768d4df710}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * 
     * @param {Pointer<Guid>} guidType 
     * @param {Integer} dwCodecIndex 
     * @param {PWSTR} wszName 
     * @param {Pointer<UInt32>} pcchName 
     * @returns {HRESULT} 
     */
    GetCodecName(guidType, dwCodecIndex, wszName, pcchName) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(6, this, "ptr", guidType, "uint", dwCodecIndex, "ptr", wszName, "uint*", pcchName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidType 
     * @param {Integer} dwCodecIndex 
     * @param {Integer} dwFormatIndex 
     * @param {Pointer<IWMStreamConfig>} ppIStreamConfig 
     * @param {PWSTR} wszDesc 
     * @param {Pointer<UInt32>} pcchDesc 
     * @returns {HRESULT} 
     */
    GetCodecFormatDesc(guidType, dwCodecIndex, dwFormatIndex, ppIStreamConfig, wszDesc, pcchDesc) {
        wszDesc := wszDesc is String ? StrPtr(wszDesc) : wszDesc

        result := ComCall(7, this, "ptr", guidType, "uint", dwCodecIndex, "uint", dwFormatIndex, "ptr", ppIStreamConfig, "ptr", wszDesc, "uint*", pcchDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
