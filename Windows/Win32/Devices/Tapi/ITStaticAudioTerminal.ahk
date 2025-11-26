#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITStaticAudioTerminal interface is an interface that TAPI 3.1 MSPs must expose on all static audio terminals. The interface defines methods on static audio terminal objects that are needed to support phone devices.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itstaticaudioterminal
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITStaticAudioTerminal extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITStaticAudioTerminal
     * @type {Guid}
     */
    static IID => Guid("{a86b7871-d14c-48e6-922e-a8d15f984800}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WaveId"]

    /**
     * @type {Integer} 
     */
    WaveId {
        get => this.get_WaveId()
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itstaticaudioterminal-get_waveid
     */
    get_WaveId() {
        result := ComCall(7, this, "int*", &plWaveId := 0, "HRESULT")
        return plWaveId
    }
}
