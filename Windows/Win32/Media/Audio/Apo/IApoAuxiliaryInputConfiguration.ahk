#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides methods that APOs can implement so that the audio engine can add and remove auxiliary input streams.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nn-audioenginebaseapo-iapoauxiliaryinputconfiguration
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IApoAuxiliaryInputConfiguration extends IUnknown{
    /**
     * The interface identifier for IApoAuxiliaryInputConfiguration
     * @type {Guid}
     */
    static IID => Guid("{4ceb0aab-fa19-48ed-a857-87771ae1b768}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwInputId 
     * @param {Integer} cbDataSize 
     * @param {Pointer<Byte>} pbyData 
     * @param {Pointer<APO_CONNECTION_DESCRIPTOR>} pInputConnection 
     * @returns {HRESULT} 
     */
    AddAuxiliaryInput(dwInputId, cbDataSize, pbyData, pInputConnection) {
        result := ComCall(3, this, "uint", dwInputId, "uint", cbDataSize, "char*", pbyData, "ptr", pInputConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputId 
     * @returns {HRESULT} 
     */
    RemoveAuxiliaryInput(dwInputId) {
        result := ComCall(4, this, "uint", dwInputId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAudioMediaType>} pRequestedInputFormat 
     * @param {Pointer<IAudioMediaType>} ppSupportedInputFormat 
     * @returns {HRESULT} 
     */
    IsInputFormatSupported(pRequestedInputFormat, ppSupportedInputFormat) {
        result := ComCall(5, this, "ptr", pRequestedInputFormat, "ptr", ppSupportedInputFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
