#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IEnumDebugApplicationNodes.ahk
#Include .\IDebugApplicationNode.ahk
#Include .\IDebugDocumentProvider.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugApplicationNode extends IDebugDocumentProvider{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugApplicationNode
     * @type {Guid}
     */
    static IID => Guid("{51973c34-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumChildren", "GetParent", "SetDocumentProvider", "Close", "Attach", "Detach"]

    /**
     * 
     * @returns {IEnumDebugApplicationNodes} 
     */
    EnumChildren() {
        result := ComCall(6, this, "ptr*", &pperddp := 0, "HRESULT")
        return IEnumDebugApplicationNodes(pperddp)
    }

    /**
     * Retrieves a handle to the specified window's parent or owner.
     * @remarks
     * To obtain a window's owner window, instead of using <b>GetParent</b>, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getwindow">GetWindow</a> with the <b>GW_OWNER</b> flag. To obtain the parent window and not the owner, instead of using <b>GetParent</b>, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getancestor">GetAncestor</a> with the <b>GA_PARENT</b> flag.
     * @returns {IDebugApplicationNode} 
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getparent
     */
    GetParent() {
        result := ComCall(7, this, "ptr*", &pprddp := 0, "HRESULT")
        return IDebugApplicationNode(pprddp)
    }

    /**
     * 
     * @param {IDebugDocumentProvider} pddp 
     * @returns {HRESULT} 
     */
    SetDocumentProvider(pddp) {
        result := ComCall(8, this, "ptr", pddp, "HRESULT")
        return result
    }

    /**
     * Use the Close-Session packet to tell the BITS server that file upload is complete and to end the session.
     * @remarks
     * The BITS server releases all resources and deletes all temporary files when it receives this packet.
     * 
     * For upload-reply jobs, you must download the reply before sending **Close-Session**. Otherwise, the reply is lost.
     * 
     * If you send this packet before uploading all fragments, the upload file is deleted; you cannot upload a partial file.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Bits/close-session
     */
    Close() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * See reference information about the AttachConsole function, which attaches the calling process to the console of the specified process.
     * @remarks
     * A process can be attached to at most one console. If the calling process is already attached to a console, the error code returned is **ERROR\_ACCESS\_DENIED**. If the specified process does not have a console, the error code returned is **ERROR\_INVALID\_HANDLE**. If the specified process does not exist, the error code returned is **ERROR\_INVALID\_PARAMETER**.
     * 
     * A process can use the [**FreeConsole**](freeconsole.md) function to detach itself from its console. If other processes share the console, the console is not destroyed, but the process that called **FreeConsole** cannot refer to it. A console is closed when the last process attached to it terminates or calls **FreeConsole**. After a process calls **FreeConsole**, it can call the [**AllocConsole**](allocconsole.md) function to create a new console or **AttachConsole** to attach to another console.
     * 
     * This function is primarily useful to applications that were linked with [*SUBSYSTEM:WINDOWS**](/cpp/build/reference/subsystem-specify-subsystem), which implies to the operating system that a console is not needed before entering the program's main method. In that instance, the standard handles retrieved with [**GetStdHandle**](getstdhandle.md) will likely be invalid on startup until **AttachConsole** is called. The exception to this is if the application is launched with handle inheritance by its parent process.
     * 
     * To compile an application that uses this function, define **\_WIN32\_WINNT** as `0x0501` or later. For more information, see [Using the Windows Headers](/windows/win32/winprog/using-the-windows-headers).
     * @param {IDebugApplicationNode} pdanParent 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/attachconsole
     */
    Attach(pdanParent) {
        result := ComCall(10, this, "ptr", pdanParent, "HRESULT")
        return result
    }

    /**
     * Learn more about: DetachDatabaseGrbit enumeration
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/detachdatabasegrbit-enumeration
     */
    Detach() {
        result := ComCall(11, this, "HRESULT")
        return result
    }
}
