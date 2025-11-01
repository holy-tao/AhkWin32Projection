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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetChannelCount", "GetLevelRange", "GetLevel", "SetLevel", "SetLevelUniform", "SetLevelAllChannels"]

    /**
     * 
     * @param {Pointer<Integer>} pcChannels 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iperchanneldblevel-getchannelcount
     */
    GetChannelCount(pcChannels) {
        pcChannelsMarshal := pcChannels is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcChannelsMarshal, pcChannels, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nChannel 
     * @param {Pointer<Float>} pfMinLevelDB 
     * @param {Pointer<Float>} pfMaxLevelDB 
     * @param {Pointer<Float>} pfStepping 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iperchanneldblevel-getlevelrange
     */
    GetLevelRange(nChannel, pfMinLevelDB, pfMaxLevelDB, pfStepping) {
        pfMinLevelDBMarshal := pfMinLevelDB is VarRef ? "float*" : "ptr"
        pfMaxLevelDBMarshal := pfMaxLevelDB is VarRef ? "float*" : "ptr"
        pfSteppingMarshal := pfStepping is VarRef ? "float*" : "ptr"

        result := ComCall(4, this, "uint", nChannel, pfMinLevelDBMarshal, pfMinLevelDB, pfMaxLevelDBMarshal, pfMaxLevelDB, pfSteppingMarshal, pfStepping, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nChannel 
     * @param {Pointer<Float>} pfLevelDB 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iperchanneldblevel-getlevel
     */
    GetLevel(nChannel, pfLevelDB) {
        pfLevelDBMarshal := pfLevelDB is VarRef ? "float*" : "ptr"

        result := ComCall(5, this, "uint", nChannel, pfLevelDBMarshal, pfLevelDB, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nChannel 
     * @param {Float} fLevelDB 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iperchanneldblevel-setlevel
     */
    SetLevel(nChannel, fLevelDB, pguidEventContext) {
        result := ComCall(6, this, "uint", nChannel, "float", fLevelDB, "ptr", pguidEventContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} fLevelDB 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iperchanneldblevel-setleveluniform
     */
    SetLevelUniform(fLevelDB, pguidEventContext) {
        result := ComCall(7, this, "float", fLevelDB, "ptr", pguidEventContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} aLevelsDB 
     * @param {Integer} cChannels 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iperchanneldblevel-setlevelallchannels
     */
    SetLevelAllChannels(aLevelsDB, cChannels, pguidEventContext) {
        aLevelsDBMarshal := aLevelsDB is VarRef ? "float*" : "ptr"

        result := ComCall(8, this, aLevelsDBMarshal, aLevelsDB, "uint", cChannels, "ptr", pguidEventContext, "HRESULT")
        return result
    }
}
