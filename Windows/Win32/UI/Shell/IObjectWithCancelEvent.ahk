#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Not supported.Supplies a caller with an event that will be signaled by the called object to denote cancellation of a task.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iobjectwithcancelevent
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IObjectWithCancelEvent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectWithCancelEvent
     * @type {Guid}
     */
    static IID => Guid("{f279b885-0ae9-4b85-ac06-ddecf9408941}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCancelEvent"]

    /**
     * 
     * @param {Pointer<HANDLE>} phEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iobjectwithcancelevent-getcancelevent
     */
    GetCancelEvent(phEvent) {
        result := ComCall(3, this, "ptr", phEvent, "HRESULT")
        return result
    }
}
