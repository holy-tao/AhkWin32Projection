#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMemoryData.ahk

/**
 * Note  This interface is deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//austream/nn-austream-iaudiodata
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAudioData extends IMemoryData{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioData
     * @type {Guid}
     */
    static IID => Guid("{54c719c0-af60-11d0-8212-00c04fc32c45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFormat", "SetFormat"]

    /**
     * 
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatCurrent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/austream/nf-austream-iaudiodata-getformat
     */
    GetFormat(pWaveFormatCurrent) {
        result := ComCall(6, this, "ptr", pWaveFormatCurrent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WAVEFORMATEX>} lpWaveFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/austream/nf-austream-iaudiodata-setformat
     */
    SetFormat(lpWaveFormat) {
        result := ComCall(7, this, "ptr", lpWaveFormat, "HRESULT")
        return result
    }
}
