#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method through which a delegate folder is given the IMalloc interface required to allocate and free item IDs.
 * @remarks
 * 
  * The IDs allocated by the delegate folder are in the form of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-delegateitemid">DELEGATEITEMID</a> structures. It is the delegate's job to pack its data into the pointer to an item identifier list (PIDL) in the <b>DELEGATEITEMID</b> format.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-idelegatefolder
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDelegateFolder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDelegateFolder
     * @type {Guid}
     */
    static IID => Guid("{add8ba80-002b-11d0-8f0f-00c04fd7d062}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetItemAlloc"]

    /**
     * 
     * @param {IMalloc} pmalloc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idelegatefolder-setitemalloc
     */
    SetItemAlloc(pmalloc) {
        result := ComCall(3, this, "ptr", pmalloc, "HRESULT")
        return result
    }
}
