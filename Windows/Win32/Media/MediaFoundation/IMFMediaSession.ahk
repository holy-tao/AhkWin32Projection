#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFClock.ahk
#Include .\IMFTopology.ahk
#Include .\IMFMediaEventGenerator.ahk

/**
 * Provides playback controls for protected and unprotected content.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfmediasession
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaSession extends IMFMediaEventGenerator{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTopology", "ClearTopologies", "Start", "Pause", "Stop", "Close", "Shutdown", "GetClock", "GetSessionCapabilities", "GetFullTopology"]

    /**
     * 
     * @param {Integer} dwSetTopologyFlags 
     * @param {IMFTopology} pTopology 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasession-settopology
     */
    SetTopology(dwSetTopologyFlags, pTopology) {
        result := ComCall(7, this, "uint", dwSetTopologyFlags, "ptr", pTopology, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasession-cleartopologies
     */
    ClearTopologies() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidTimeFormat 
     * @param {Pointer<PROPVARIANT>} pvarStartPosition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasession-start
     */
    Start(pguidTimeFormat, pvarStartPosition) {
        result := ComCall(9, this, "ptr", pguidTimeFormat, "ptr", pvarStartPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasession-pause
     */
    Pause() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasession-stop
     */
    Stop() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasession-close
     */
    Close() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasession-shutdown
     */
    Shutdown() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMFClock} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasession-getclock
     */
    GetClock() {
        result := ComCall(14, this, "ptr*", &ppClock := 0, "HRESULT")
        return IMFClock(ppClock)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasession-getsessioncapabilities
     */
    GetSessionCapabilities() {
        result := ComCall(15, this, "uint*", &pdwCaps := 0, "HRESULT")
        return pdwCaps
    }

    /**
     * 
     * @param {Integer} dwGetFullTopologyFlags 
     * @param {Integer} TopoId 
     * @returns {IMFTopology} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasession-getfulltopology
     */
    GetFullTopology(dwGetFullTopologyFlags, TopoId) {
        result := ComCall(16, this, "uint", dwGetFullTopologyFlags, "uint", TopoId, "ptr*", &ppFullTopology := 0, "HRESULT")
        return IMFTopology(ppFullTopology)
    }
}
