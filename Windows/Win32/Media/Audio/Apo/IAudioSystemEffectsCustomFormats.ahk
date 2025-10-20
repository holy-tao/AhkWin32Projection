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
     * 
     * @param {Pointer<UInt32>} pcFormats 
     * @returns {HRESULT} 
     */
    GetFormatCount(pcFormats) {
        result := ComCall(3, this, "uint*", pcFormats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nFormat 
     * @param {Pointer<IAudioMediaType>} ppFormat 
     * @returns {HRESULT} 
     */
    GetFormat(nFormat, ppFormat) {
        result := ComCall(4, this, "uint", nFormat, "ptr", ppFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nFormat 
     * @param {Pointer<PWSTR>} ppwstrFormatRep 
     * @returns {HRESULT} 
     */
    GetFormatRepresentation(nFormat, ppwstrFormatRep) {
        result := ComCall(5, this, "uint", nFormat, "ptr", ppwstrFormatRep, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
