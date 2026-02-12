#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IEnumUnknown.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IAccStore extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAccStore
     * @type {Guid}
     */
    static IID => Guid("{e2cd4a63-2b72-4d48-b739-95e4765195ba}")

    /**
     * The class identifier for AccStore
     * @type {Guid}
     */
    static CLSID => Guid("{5440837f-4bff-4ae5-a1b1-7722ecc6332a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Register", "Unregister", "GetDocuments", "LookupByHWND", "LookupByPoint", "OnDocumentFocus", "GetFocused"]

    /**
     * The Register export function must be implemented in all parser DLLs. The implementation of Register creates and fills-in a property database for a protocol. Network Monitor uses the database to determine which properties the protocol supports.
     * @remarks
     * Network Monitor starts calling the **Register** function as soon as a capture is loaded. Network Monitor calls the **Register** function for each protocol it can identify. The [CreateProtocol](createprotocol.md) function passes a pointer to the **Register** function.
     * 
     * The implementation of **Register** includes calls to the following functions.
     * 
     * -   A call to the [CreatePropertyDatabase](createpropertydatabase.md) and [AddProperty](/previous-versions/bb251873(v=msdn.10)) functions to create a database of all the properties that the protocol supports.
     * -   A call to the [CreateHandoffTable](createhandofftable.md) function is required if the protocol uses a [*handoff set*](h.md).
     * 
     * If the parser DLL contains multiple parsers, and the parser can detect more than one protocol, you must implement a **Register** function for each protocol.
     * 
     * 
     * 
     * | For Information on                                        | See                                                    |
     * |-----------------------------------------------------------|--------------------------------------------------------|
     * | What parsers are, and how they work with Network Monitor. | [Parsers](parsers.md)                                 |
     * | Which entry points are included in the parser DLL.        | [Parser DLL Architecture](parser-dll-architecture.md) |
     * | How to implement **Register**  includes an example.       | [Implementing Register](implementing-register.md)     |
     * @param {Pointer<Guid>} riid 
     * @param {IUnknown} punk 
     * @returns {HRESULT} None.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/register-parser
     */
    Register(riid, punk) {
        result := ComCall(3, this, "ptr", riid, "ptr", punk, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes the active instance of an application from the recovery list.
     * @remarks
     * You do not need to call this function before exiting. You need to remove the registration only if you choose to not recover data.
     * @param {IUnknown} punk 
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internal error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-unregisterapplicationrecoverycallback
     */
    Unregister(punk) {
        result := ComCall(4, this, "ptr", punk, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IEnumUnknown} 
     */
    GetDocuments() {
        result := ComCall(5, this, "ptr*", &enumUnknown := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumUnknown(enumUnknown)
    }

    /**
     * 
     * @param {HWND} hWnd_ 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<IUnknown>} 
     */
    LookupByHWND(hWnd_, riid) {
        hWnd_ := hWnd_ is Win32Handle ? NumGet(hWnd_, "ptr") : hWnd_

        result := ComCall(6, this, "ptr", hWnd_, "ptr", riid, "ptr*", &ppunk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppunk
    }

    /**
     * 
     * @param {POINT} pt 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<IUnknown>} 
     */
    LookupByPoint(pt, riid) {
        result := ComCall(7, this, "ptr", pt, "ptr", riid, "ptr*", &ppunk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppunk
    }

    /**
     * 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     */
    OnDocumentFocus(punk) {
        result := ComCall(8, this, "ptr", punk, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<IUnknown>} 
     */
    GetFocused(riid) {
        result := ComCall(9, this, "ptr", riid, "ptr*", &ppunk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppunk
    }
}
