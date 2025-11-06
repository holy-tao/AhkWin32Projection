#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\IEnumMoniker.ahk

/**
 * Manages access to the running object table (ROT), a globally accessible look-up table on each workstation.
 * @remarks
 * 
  * The ROT contains entries of the following form: (<i>pmkObjectName</i>, <i>pUnkObject</i>).
  * 
  * The <i>pmkObjectName</i> element is a pointer to the moniker that identifies the running object. The <i>pUnkObject</i> element is a pointer to the running object itself. During the binding process, monikers consult the <i>pmkObjectName</i> entries in the ROT to see whether an object is already running.
  * 
  * Objects that can be named by monikers must be registered with the ROT when they are loaded and their registration must be revoked when they are no longer running.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-irunningobjecttable
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IRunningObjectTable extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRunningObjectTable
     * @type {Guid}
     */
    static IID => Guid("{00000010-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Register", "Revoke", "IsRunning", "GetObject", "NoteChangeTime", "GetTimeOfLastChange", "EnumRunning"]

    /**
     * 
     * @param {Integer} grfFlags 
     * @param {IUnknown} punkObject 
     * @param {IMoniker} pmkObjectName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-irunningobjecttable-register
     */
    Register(grfFlags, punkObject, pmkObjectName) {
        result := ComCall(3, this, "uint", grfFlags, "ptr", punkObject, "ptr", pmkObjectName, "uint*", &pdwRegister := 0, "HRESULT")
        return pdwRegister
    }

    /**
     * 
     * @param {Integer} dwRegister 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-irunningobjecttable-revoke
     */
    Revoke(dwRegister) {
        result := ComCall(4, this, "uint", dwRegister, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMoniker} pmkObjectName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-irunningobjecttable-isrunning
     */
    IsRunning(pmkObjectName) {
        result := ComCall(5, this, "ptr", pmkObjectName, "HRESULT")
        return result
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {IMoniker} pmkObjectName 
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(pmkObjectName) {
        result := ComCall(6, this, "ptr", pmkObjectName, "ptr*", &ppunkObject := 0, "HRESULT")
        return IUnknown(ppunkObject)
    }

    /**
     * 
     * @param {Integer} dwRegister 
     * @param {Pointer<FILETIME>} pfiletime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-irunningobjecttable-notechangetime
     */
    NoteChangeTime(dwRegister, pfiletime) {
        result := ComCall(7, this, "uint", dwRegister, "ptr", pfiletime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMoniker} pmkObjectName 
     * @returns {FILETIME} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-irunningobjecttable-gettimeoflastchange
     */
    GetTimeOfLastChange(pmkObjectName) {
        pfiletime := FILETIME()
        result := ComCall(8, this, "ptr", pmkObjectName, "ptr", pfiletime, "HRESULT")
        return pfiletime
    }

    /**
     * 
     * @returns {IEnumMoniker} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-irunningobjecttable-enumrunning
     */
    EnumRunning() {
        result := ComCall(9, this, "ptr*", &ppenumMoniker := 0, "HRESULT")
        return IEnumMoniker(ppenumMoniker)
    }
}
