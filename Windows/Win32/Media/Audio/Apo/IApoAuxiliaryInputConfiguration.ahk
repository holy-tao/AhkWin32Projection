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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddAuxiliaryInput", "RemoveAuxiliaryInput", "IsInputFormatSupported"]

    /**
     * 
     * @param {Integer} dwInputId 
     * @param {Integer} cbDataSize 
     * @param {Pointer<Integer>} pbyData 
     * @param {Pointer<APO_CONNECTION_DESCRIPTOR>} pInputConnection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/nf-audioenginebaseapo-iapoauxiliaryinputconfiguration-addauxiliaryinput
     */
    AddAuxiliaryInput(dwInputId, cbDataSize, pbyData, pInputConnection) {
        pbyDataMarshal := pbyData is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", dwInputId, "uint", cbDataSize, pbyDataMarshal, pbyData, "ptr", pInputConnection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/nf-audioenginebaseapo-iapoauxiliaryinputconfiguration-removeauxiliaryinput
     */
    RemoveAuxiliaryInput(dwInputId) {
        result := ComCall(4, this, "uint", dwInputId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAudioMediaType} pRequestedInputFormat 
     * @param {Pointer<IAudioMediaType>} ppSupportedInputFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/nf-audioenginebaseapo-iapoauxiliaryinputconfiguration-isinputformatsupported
     */
    IsInputFormatSupported(pRequestedInputFormat, ppSupportedInputFormat) {
        result := ComCall(5, this, "ptr", pRequestedInputFormat, "ptr*", ppSupportedInputFormat, "HRESULT")
        return result
    }
}
