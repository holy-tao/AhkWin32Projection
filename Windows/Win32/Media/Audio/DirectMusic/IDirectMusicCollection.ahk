#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class IDirectMusicCollection extends IUnknown{
    /**
     * The interface identifier for IDirectMusicCollection
     * @type {Guid}
     */
    static IID => Guid("{d2ac287c-b39b-11d1-8704-00600893b1bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwPatch 
     * @param {Pointer<IDirectMusicInstrument>} ppInstrument 
     * @returns {HRESULT} 
     */
    GetInstrument(dwPatch, ppInstrument) {
        result := ComCall(3, this, "uint", dwPatch, "ptr", ppInstrument, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<UInt32>} pdwPatch 
     * @param {PWSTR} pwszName 
     * @param {Integer} dwNameLen 
     * @returns {HRESULT} 
     */
    EnumInstrument(dwIndex, pdwPatch, pwszName, dwNameLen) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(4, this, "uint", dwIndex, "uint*", pdwPatch, "ptr", pwszName, "uint", dwNameLen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
