#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugCodeContext.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include .\IDebugApplicationThread.ahk
#Include ..\IDebugProperty.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugStackFrame extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugStackFrame
     * @type {Guid}
     */
    static IID => Guid("{51973c17-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCodeContext", "GetDescriptionString", "GetLanguageString", "GetThread", "GetDebugProperty"]

    /**
     * 
     * @returns {IDebugCodeContext} 
     */
    GetCodeContext() {
        result := ComCall(3, this, "ptr*", &ppcc := 0, "HRESULT")
        return IDebugCodeContext(ppcc)
    }

    /**
     * 
     * @param {BOOL} fLong 
     * @returns {BSTR} 
     */
    GetDescriptionString(fLong) {
        pbstrDescription := BSTR()
        result := ComCall(4, this, "int", fLong, "ptr", pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    /**
     * 
     * @param {BOOL} fLong 
     * @returns {BSTR} 
     */
    GetLanguageString(fLong) {
        pbstrLanguage := BSTR()
        result := ComCall(5, this, "int", fLong, "ptr", pbstrLanguage, "HRESULT")
        return pbstrLanguage
    }

    /**
     * Retrieves the context of the specified thread.
     * @remarks
     * This function is used to retrieve the thread context of the specified thread. The function retrieves a selective context based on the value of the **ContextFlags** member of the context structure. The thread identified by the *hThread* parameter is typically being debugged, but the function can also operate when the thread is not being debugged.
     * 
     * You cannot get a valid context for a running thread. Use the [SuspendThread](/windows/desktop/api/processthreadsapi/nf-processthreadsapi-suspendthread) function to suspend the thread before calling **GetThreadContext**.
     * 
     * If you call **GetThreadContext** for the current thread, the function returns successfully; however, the context returned is not valid.
     * @returns {IDebugApplicationThread} 
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getthreadcontext
     */
    GetThread() {
        result := ComCall(6, this, "ptr*", &ppat := 0, "HRESULT")
        return IDebugApplicationThread(ppat)
    }

    /**
     * 
     * @returns {IDebugProperty} 
     */
    GetDebugProperty() {
        result := ComCall(7, this, "ptr*", &ppDebugProp := 0, "HRESULT")
        return IDebugProperty(ppDebugProp)
    }
}
