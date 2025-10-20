#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMCodecInfo interface retrieves the number and types of codecs available.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmcodecinfo
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMCodecInfo extends IUnknown{
    /**
     * The interface identifier for IWMCodecInfo
     * @type {Guid}
     */
    static IID => Guid("{a970f41e-34de-4a98-b3ba-e4b3ca7528f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} guidType 
     * @param {Pointer<UInt32>} pcCodecs 
     * @returns {HRESULT} 
     */
    GetCodecInfoCount(guidType, pcCodecs) {
        result := ComCall(3, this, "ptr", guidType, "uint*", pcCodecs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidType 
     * @param {Integer} dwCodecIndex 
     * @param {Pointer<UInt32>} pcFormat 
     * @returns {HRESULT} 
     */
    GetCodecFormatCount(guidType, dwCodecIndex, pcFormat) {
        result := ComCall(4, this, "ptr", guidType, "uint", dwCodecIndex, "uint*", pcFormat, "int")
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
     * @returns {HRESULT} 
     */
    GetCodecFormat(guidType, dwCodecIndex, dwFormatIndex, ppIStreamConfig) {
        result := ComCall(5, this, "ptr", guidType, "uint", dwCodecIndex, "uint", dwFormatIndex, "ptr", ppIStreamConfig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
