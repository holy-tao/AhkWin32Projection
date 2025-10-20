#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IAudioSystemEffectsCustomFormats interface is supported in Windows Vista and later versions of Windows.
 * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nn-audioenginebaseapo-iaudiosystemeffectscustomformats
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IAudioSystemEffectsCustomFormats extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioSystemEffectsCustomFormats
     * @type {Guid}
     */
    static IID => Guid("{b1176e34-bb7f-4f05-bebd-1b18a534e097}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFormatCount", "GetFormat", "GetFormatRepresentation"]

    /**
     * 
     * @param {Pointer<Integer>} pcFormats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/nf-audioenginebaseapo-iaudiosystemeffectscustomformats-getformatcount
     */
    GetFormatCount(pcFormats) {
        result := ComCall(3, this, "uint*", pcFormats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nFormat 
     * @param {Pointer<IAudioMediaType>} ppFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/nf-audioenginebaseapo-iaudiosystemeffectscustomformats-getformat
     */
    GetFormat(nFormat, ppFormat) {
        result := ComCall(4, this, "uint", nFormat, "ptr*", ppFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nFormat 
     * @param {Pointer<PWSTR>} ppwstrFormatRep 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/nf-audioenginebaseapo-iaudiosystemeffectscustomformats-getformatrepresentation
     */
    GetFormatRepresentation(nFormat, ppwstrFormatRep) {
        result := ComCall(5, this, "uint", nFormat, "ptr", ppwstrFormatRep, "HRESULT")
        return result
    }
}
