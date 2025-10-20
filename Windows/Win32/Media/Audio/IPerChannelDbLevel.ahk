#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPerChannelDbLevel interface represents a generic subunit control interface that provides per-channel control over the volume level, in decibels, of an audio stream or of a frequency band in an audio stream.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-iperchanneldblevel
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IPerChannelDbLevel extends IUnknown{
    /**
     * The interface identifier for IPerChannelDbLevel
     * @type {Guid}
     */
    static IID => Guid("{c2f8e001-f205-4bc9-99bc-c13b1e048ccb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pcChannels 
     * @returns {HRESULT} 
     */
    GetChannelCount(pcChannels) {
        result := ComCall(3, this, "uint*", pcChannels, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nChannel 
     * @param {Pointer<Single>} pfMinLevelDB 
     * @param {Pointer<Single>} pfMaxLevelDB 
     * @param {Pointer<Single>} pfStepping 
     * @returns {HRESULT} 
     */
    GetLevelRange(nChannel, pfMinLevelDB, pfMaxLevelDB, pfStepping) {
        result := ComCall(4, this, "uint", nChannel, "float*", pfMinLevelDB, "float*", pfMaxLevelDB, "float*", pfStepping, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nChannel 
     * @param {Pointer<Single>} pfLevelDB 
     * @returns {HRESULT} 
     */
    GetLevel(nChannel, pfLevelDB) {
        result := ComCall(5, this, "uint", nChannel, "float*", pfLevelDB, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nChannel 
     * @param {Float} fLevelDB 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     */
    SetLevel(nChannel, fLevelDB, pguidEventContext) {
        result := ComCall(6, this, "uint", nChannel, "float", fLevelDB, "ptr", pguidEventContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} fLevelDB 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     */
    SetLevelUniform(fLevelDB, pguidEventContext) {
        result := ComCall(7, this, "float", fLevelDB, "ptr", pguidEventContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} aLevelsDB 
     * @param {Integer} cChannels 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     */
    SetLevelAllChannels(aLevelsDB, cChannels, pguidEventContext) {
        result := ComCall(8, this, "float*", aLevelsDB, "uint", cChannels, "ptr", pguidEventContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
