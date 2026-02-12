#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISynchronizeHandle.ahk

/**
 * The ISynchronizeEvent (objidl.h) interface assigns an event handle to a synchronization object.
 * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nn-objidl-isynchronizeevent
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ISynchronizeEvent extends ISynchronizeHandle{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISynchronizeEvent
     * @type {Guid}
     */
    static IID => Guid("{00000032-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetEventHandle"]

    /**
     * The ISynchronizeEvent::SetEventHandle method (objidl.h) assigns an event handle to a synchronization object.
     * @remarks
     * If the method is successful,
     * the object assumes ownership of the event handle,
     * and the caller should not close the handle.
     * @param {Pointer<HANDLE>} ph A pointer to the event handle.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-isynchronizeevent-seteventhandle
     */
    SetEventHandle(ph) {
        result := ComCall(4, this, "ptr", ph, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
