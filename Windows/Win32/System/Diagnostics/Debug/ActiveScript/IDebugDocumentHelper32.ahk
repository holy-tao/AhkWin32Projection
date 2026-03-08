#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugApplicationNode.ahk
#Include .\IDebugDocumentContext.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugDocumentHelper32 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugDocumentHelper32
     * @type {Guid}
     */
    static IID => Guid("{51973c26-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "Attach", "Detach", "AddUnicodeText", "AddDBCSText", "SetDebugDocumentHost", "AddDeferredText", "DefineScriptBlock", "SetDefaultTextAttr", "SetTextAttributes", "SetLongName", "SetShortName", "SetDocumentAttr", "GetDebugApplicationNode", "GetScriptBlockInfo", "CreateDebugDocumentContext", "BringDocumentToTop", "BringDocumentContextToTop"]

    /**
     * Initializes the trace.
     * @remarks
     * Exstrace.dll is an optional component that installs with the Simple Mail Transfer Protocol (SMTP) and the Network News Transfer Protocol (NNTP).
     * 
     * This function has no associated import library or header file; you must call it using the [**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya) and [**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress) functions.
     * @param {IDebugApplication32} pda 
     * @param {PWSTR} pszShortName 
     * @param {PWSTR} pszLongName 
     * @param {Integer} docAttr 
     * @returns {HRESULT} This function has no parameters.
     * 
     * 
     * This function returns **TRUE** if the function succeeds; otherwise, it returns **FALSE**.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/-initasynctrace
     */
    Init(pda, pszShortName, pszLongName, docAttr) {
        pszShortName := pszShortName is String ? StrPtr(pszShortName) : pszShortName
        pszLongName := pszLongName is String ? StrPtr(pszLongName) : pszLongName

        result := ComCall(3, this, "ptr", pda, "ptr", pszShortName, "ptr", pszLongName, "uint", docAttr, "HRESULT")
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
     * @param {IDebugDocumentHelper32} pddhParent 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/attachconsole
     */
    Attach(pddhParent) {
        result := ComCall(4, this, "ptr", pddhParent, "HRESULT")
        return result
    }

    /**
     * Learn more about: DetachDatabaseGrbit enumeration
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/detachdatabasegrbit-enumeration
     */
    Detach() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszText 
     * @returns {HRESULT} 
     */
    AddUnicodeText(pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(6, this, "ptr", pszText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} pszText 
     * @returns {HRESULT} 
     */
    AddDBCSText(pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(7, this, "ptr", pszText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugDocumentHost} pddh 
     * @returns {HRESULT} 
     */
    SetDebugDocumentHost(pddh) {
        result := ComCall(8, this, "ptr", pddh, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cChars 
     * @param {Integer} dwTextStartCookie 
     * @returns {HRESULT} 
     */
    AddDeferredText(cChars, dwTextStartCookie) {
        result := ComCall(9, this, "uint", cChars, "uint", dwTextStartCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCharOffset 
     * @param {Integer} cChars 
     * @param {IActiveScript} pas 
     * @param {BOOL} fScriptlet 
     * @returns {Integer} 
     */
    DefineScriptBlock(ulCharOffset, cChars, pas, fScriptlet) {
        result := ComCall(10, this, "uint", ulCharOffset, "uint", cChars, "ptr", pas, "int", fScriptlet, "uint*", &pdwSourceContext := 0, "HRESULT")
        return pdwSourceContext
    }

    /**
     * 
     * @param {Integer} staTextAttr 
     * @returns {HRESULT} 
     */
    SetDefaultTextAttr(staTextAttr) {
        result := ComCall(11, this, "ushort", staTextAttr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCharOffset 
     * @param {Integer} cChars 
     * @param {Pointer<Integer>} pstaTextAttr 
     * @returns {HRESULT} 
     */
    SetTextAttributes(ulCharOffset, cChars, pstaTextAttr) {
        pstaTextAttrMarshal := pstaTextAttr is VarRef ? "ushort*" : "ptr"

        result := ComCall(12, this, "uint", ulCharOffset, "uint", cChars, pstaTextAttrMarshal, pstaTextAttr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszLongName 
     * @returns {HRESULT} 
     */
    SetLongName(pszLongName) {
        pszLongName := pszLongName is String ? StrPtr(pszLongName) : pszLongName

        result := ComCall(13, this, "ptr", pszLongName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszShortName 
     * @returns {HRESULT} 
     */
    SetShortName(pszShortName) {
        pszShortName := pszShortName is String ? StrPtr(pszShortName) : pszShortName

        result := ComCall(14, this, "ptr", pszShortName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pszAttributes 
     * @returns {HRESULT} 
     */
    SetDocumentAttr(pszAttributes) {
        result := ComCall(15, this, "uint", pszAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDebugApplicationNode} 
     */
    GetDebugApplicationNode() {
        result := ComCall(16, this, "ptr*", &ppdan := 0, "HRESULT")
        return IDebugApplicationNode(ppdan)
    }

    /**
     * 
     * @param {Integer} dwSourceContext 
     * @param {Pointer<IActiveScript>} ppasd 
     * @param {Pointer<Integer>} piCharPos 
     * @param {Pointer<Integer>} pcChars 
     * @returns {HRESULT} 
     */
    GetScriptBlockInfo(dwSourceContext, ppasd, piCharPos, pcChars) {
        piCharPosMarshal := piCharPos is VarRef ? "uint*" : "ptr"
        pcCharsMarshal := pcChars is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, "uint", dwSourceContext, "ptr*", ppasd, piCharPosMarshal, piCharPos, pcCharsMarshal, pcChars, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iCharPos 
     * @param {Integer} cChars 
     * @returns {IDebugDocumentContext} 
     */
    CreateDebugDocumentContext(iCharPos, cChars) {
        result := ComCall(18, this, "uint", iCharPos, "uint", cChars, "ptr*", &ppddc := 0, "HRESULT")
        return IDebugDocumentContext(ppddc)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BringDocumentToTop() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugDocumentContext} pddc 
     * @returns {HRESULT} 
     */
    BringDocumentContextToTop(pddc) {
        result := ComCall(20, this, "ptr", pddc, "HRESULT")
        return result
    }
}
