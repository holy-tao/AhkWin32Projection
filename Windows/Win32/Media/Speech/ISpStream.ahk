#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpStreamFormat.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpStream extends ISpStreamFormat{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpStream
     * @type {Guid}
     */
    static IID => Guid("{12e3cca9-7518-44c5-a5e7-ba5a79cb929e}")

    /**
     * The class identifier for SpStream
     * @type {Guid}
     */
    static CLSID => Guid("{715d9c59-4442-11d2-9605-00c04f8ee628}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetBaseStream", "GetBaseStream", "BindToFile", "Close"]

    /**
     * 
     * @param {IStream} pStream 
     * @param {Pointer<Guid>} rguidFormat 
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatEx 
     * @returns {HRESULT} 
     */
    SetBaseStream(pStream, rguidFormat, pWaveFormatEx) {
        result := ComCall(15, this, "ptr", pStream, "ptr", rguidFormat, "ptr", pWaveFormatEx, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} ppStream 
     * @returns {HRESULT} 
     */
    GetBaseStream(ppStream) {
        result := ComCall(16, this, "ptr*", ppStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszFileName 
     * @param {Integer} eMode 
     * @param {Pointer<Guid>} pFormatId 
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatEx 
     * @param {Integer} ullEventInterest 
     * @returns {HRESULT} 
     */
    BindToFile(pszFileName, eMode, pFormatId, pWaveFormatEx, ullEventInterest) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := ComCall(17, this, "ptr", pszFileName, "int", eMode, "ptr", pFormatId, "ptr", pWaveFormatEx, "uint", ullEventInterest, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(18, this, "HRESULT")
        return result
    }
}
