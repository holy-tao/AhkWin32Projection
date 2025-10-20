#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by the Sequencer Source.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsequencersource
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSequencerSource extends IUnknown{
    /**
     * The interface identifier for IMFSequencerSource
     * @type {Guid}
     */
    static IID => Guid("{197cd219-19cb-4de1-a64c-acf2edcbe59e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMFTopology>} pTopology 
     * @param {Integer} dwFlags 
     * @param {Pointer<UInt32>} pdwId 
     * @returns {HRESULT} 
     */
    AppendTopology(pTopology, dwFlags, pdwId) {
        result := ComCall(3, this, "ptr", pTopology, "uint", dwFlags, "uint*", pdwId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwId 
     * @returns {HRESULT} 
     */
    DeleteTopology(dwId) {
        result := ComCall(4, this, "uint", dwId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFPresentationDescriptor>} pPD 
     * @param {Pointer<UInt32>} pId 
     * @param {Pointer<IMFTopology>} ppTopology 
     * @returns {HRESULT} 
     */
    GetPresentationContext(pPD, pId, ppTopology) {
        result := ComCall(5, this, "ptr", pPD, "uint*", pId, "ptr", ppTopology, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwId 
     * @param {Pointer<IMFTopology>} pTopology 
     * @returns {HRESULT} 
     */
    UpdateTopology(dwId, pTopology) {
        result := ComCall(6, this, "uint", dwId, "ptr", pTopology, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwId 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    UpdateTopologyFlags(dwId, dwFlags) {
        result := ComCall(7, this, "uint", dwId, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
