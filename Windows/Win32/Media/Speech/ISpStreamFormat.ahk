#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpStreamFormat extends IStream{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpStreamFormat
     * @type {Guid}
     */
    static IID => Guid("{bed530be-2606-4f4d-a1c0-54c5cda5566f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFormat"]

    /**
     * 
     * @param {Pointer<Guid>} pguidFormatId 
     * @param {Pointer<Pointer<WAVEFORMATEX>>} ppCoMemWaveFormatEx 
     * @returns {HRESULT} 
     */
    GetFormat(pguidFormatId, ppCoMemWaveFormatEx) {
        result := ComCall(14, this, "ptr", pguidFormatId, "ptr*", ppCoMemWaveFormatEx, "HRESULT")
        return result
    }
}
