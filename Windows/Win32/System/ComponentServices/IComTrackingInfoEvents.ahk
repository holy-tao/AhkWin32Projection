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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnNewTrackingInfo"]

    /**
     * Generated when the tracking information for a collection changes.
     * @param {IUnknown} pToplevelCollection A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the collection for which the tracking information has changed.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomtrackinginfoevents-onnewtrackinginfo
     */
    OnNewTrackingInfo(pToplevelCollection) {
        result := ComCall(3, this, "ptr", pToplevelCollection, "HRESULT")
        return result
    }
}
