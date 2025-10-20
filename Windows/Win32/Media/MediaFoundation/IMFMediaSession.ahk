#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaEventGenerator.ahk

/**
 * Provides playback controls for protected and unprotected content.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfmediasession
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaSession extends IMFMediaEventGenerator{
    /**
     * The interface identifier for IMFMediaSession
     * @type {Guid}
     */
    static IID => Guid("{90377834-21d0-4dee-8214-ba2e3e6c1127}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Integer} dwSetTopologyFlags 
     * @param {Pointer<IMFTopology>} pTopology 
     * @returns {HRESULT} 
     */
    SetTopology(dwSetTopologyFlags, pTopology) {
        result := ComCall(7, this, "uint", dwSetTopologyFlags, "ptr", pTopology, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearTopologies() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidTimeFormat 
     * @param {Pointer<PROPVARIANT>} pvarStartPosition 
     * @returns {HRESULT} 
     */
    Start(pguidTimeFormat, pvarStartPosition) {
        result := ComCall(9, this, "ptr", pguidTimeFormat, "ptr", pvarStartPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Shutdown() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFClock>} ppClock 
     * @returns {HRESULT} 
     */
    GetClock(ppClock) {
        result := ComCall(14, this, "ptr", ppClock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwCaps 
     * @returns {HRESULT} 
     */
    GetSessionCapabilities(pdwCaps) {
        result := ComCall(15, this, "uint*", pdwCaps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwGetFullTopologyFlags 
     * @param {Integer} TopoId 
     * @param {Pointer<IMFTopology>} ppFullTopology 
     * @returns {HRESULT} 
     */
    GetFullTopology(dwGetFullTopologyFlags, TopoId, ppFullTopology) {
        result := ComCall(16, this, "uint", dwGetFullTopologyFlags, "uint", TopoId, "ptr", ppFullTopology, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
