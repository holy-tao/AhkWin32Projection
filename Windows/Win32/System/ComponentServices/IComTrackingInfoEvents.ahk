#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber when the tracking information for a collection changes.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomtrackinginfoevents
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComTrackingInfoEvents extends IUnknown{
    /**
     * The interface identifier for IComTrackingInfoEvents
     * @type {Guid}
     */
    static IID => Guid("{4e6cdcc9-fb25-4fd5-9cc5-c9f4b6559cec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} pToplevelCollection 
     * @returns {HRESULT} 
     */
    OnNewTrackingInfo(pToplevelCollection) {
        result := ComCall(3, this, "ptr", pToplevelCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
