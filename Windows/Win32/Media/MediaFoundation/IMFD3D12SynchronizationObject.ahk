#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/mfd3d12/nn-mfd3d12-imfd3d12synchronizationobject
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFD3D12SynchronizationObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFD3D12SynchronizationObject
     * @type {Guid}
     */
    static IID => Guid("{802302b0-82de-45e1-b421-f19ee5bdaf23}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SignalEventOnFinalResourceRelease", "Reset"]

    /**
     * 
     * @param {HANDLE} hEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfd3d12/nf-mfd3d12-imfd3d12synchronizationobject-signaleventonfinalresourcerelease
     */
    SignalEventOnFinalResourceRelease(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(3, this, "ptr", hEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfd3d12/nf-mfd3d12-imfd3d12synchronizationobject-reset
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
