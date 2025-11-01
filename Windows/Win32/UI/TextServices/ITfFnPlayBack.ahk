#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfFunction.ahk

/**
 * The ITfFnPlayBack interface is implemented by the Speech API (SAPI) text service. This interface is used by the TSF manager or a client (application or other text service) to control the audio data for speech input text.
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itffnplayback
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFnPlayBack extends ITfFunction{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfFnPlayBack
     * @type {Guid}
     */
    static IID => Guid("{a3a416a4-0f64-11d3-b5b7-00c04fc324a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryRange", "Play"]

    /**
     * 
     * @param {ITfRange} pRange 
     * @param {Pointer<ITfRange>} ppNewRange 
     * @param {Pointer<BOOL>} pfPlayable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnplayback-queryrange
     */
    QueryRange(pRange, ppNewRange, pfPlayable) {
        result := ComCall(4, this, "ptr", pRange, "ptr*", ppNewRange, "ptr", pfPlayable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfRange} pRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnplayback-play
     */
    Play(pRange) {
        result := ComCall(5, this, "ptr", pRange, "HRESULT")
        return result
    }
}
