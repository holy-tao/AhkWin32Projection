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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCodecInfoCount", "GetCodecFormatCount", "GetCodecFormat"]

    /**
     * 
     * @param {Pointer<Guid>} guidType 
     * @param {Pointer<Integer>} pcCodecs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmcodecinfo-getcodecinfocount
     */
    GetCodecInfoCount(guidType, pcCodecs) {
        result := ComCall(3, this, "ptr", guidType, "uint*", pcCodecs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidType 
     * @param {Integer} dwCodecIndex 
     * @param {Pointer<Integer>} pcFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmcodecinfo-getcodecformatcount
     */
    GetCodecFormatCount(guidType, dwCodecIndex, pcFormat) {
        result := ComCall(4, this, "ptr", guidType, "uint", dwCodecIndex, "uint*", pcFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidType 
     * @param {Integer} dwCodecIndex 
     * @param {Integer} dwFormatIndex 
     * @param {Pointer<IWMStreamConfig>} ppIStreamConfig 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmcodecinfo-getcodecformat
     */
    GetCodecFormat(guidType, dwCodecIndex, dwFormatIndex, ppIStreamConfig) {
        result := ComCall(5, this, "ptr", guidType, "uint", dwCodecIndex, "uint", dwFormatIndex, "ptr*", ppIStreamConfig, "HRESULT")
        return result
    }
}
