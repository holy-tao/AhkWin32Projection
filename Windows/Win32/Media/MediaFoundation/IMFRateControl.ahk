#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Gets or sets the playback rate.
 * @remarks
 * 
  * Objects can expose this interface as a service. To obtain a pointer to the interface, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfgetservice-getservice">IMFGetService::GetService</a> with the service identifier MF_RATE_CONTROL_SERVICE. The Media Session supports this interface. Media sources and transforms support this interface if they support rate changes. Media sinks do not need to support this interface. Media sinks are notified of rate changes through the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfclockstatesink-onclocksetrate">IMFClockStateSink::OnClockSetRate</a> method.
  * 
  * For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/about-rate-control">About Rate Control</a>.
  * 
  * To discover the playback rates that an object supports, use the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfratesupport">IMFRateSupport</a> interface
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfratecontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFRateControl extends IUnknown{
    /**
     * The interface identifier for IMFRateControl
     * @type {Guid}
     */
    static IID => Guid("{88ddcd21-03c3-4275-91ed-55ee3929328f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BOOL} fThin 
     * @param {Float} flRate 
     * @returns {HRESULT} 
     */
    SetRate(fThin, flRate) {
        result := ComCall(3, this, "int", fThin, "float", flRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfThin 
     * @param {Pointer<Single>} pflRate 
     * @returns {HRESULT} 
     */
    GetRate(pfThin, pflRate) {
        result := ComCall(4, this, "ptr", pfThin, "float*", pflRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
