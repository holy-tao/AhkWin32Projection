#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Deprecated. Exposes methods to identify, invoke, and update an individual item in the browser's travel history.
 * @remarks
 * 
  * Travel entries represented by <b>ITravelEntry</b> are created and maintained internally by the travel log (<a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-itravellog">ITravelLog</a>). Calling applications rarely use <b>ITravelEntry</b> directly.
  * 
  * <div class="alert"><b>Note</b>  <b>ITravelEntry</b> may not be supported in versions of Windows later than Windows XP.</div>
  * <div> </div>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nn-shdeprecated-itravelentry
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ITravelEntry extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITravelEntry
     * @type {Guid}
     */
    static IID => Guid("{f46edb3b-bc2f-11d0-9412-00aa00a3ebd3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke", "Update", "GetPidl"]

    /**
     * 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravelentry-invoke
     */
    Invoke(punk) {
        result := ComCall(3, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punk 
     * @param {BOOL} fIsLocalAnchor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravelentry-update
     */
    Update(punk, fIsLocalAnchor) {
        result := ComCall(4, this, "ptr", punk, "int", fIsLocalAnchor, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<ITEMIDLIST>} 
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itravelentry-getpidl
     */
    GetPidl() {
        result := ComCall(5, this, "ptr*", &ppidl := 0, "HRESULT")
        return ppidl
    }
}
