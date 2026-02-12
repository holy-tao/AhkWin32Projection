#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostContextAlternator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostContextAlternator
     * @type {Guid}
     */
    static IID => Guid("{6301eee8-85e3-4058-a7c0-d37e0ea65f75}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SwitchTo", "SwitchBack"]

    /**
     * Schedules a fiber. The function must be called on a fiber.
     * @remarks
     * You create fibers with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createfiber">CreateFiber</a> function. Before you can schedule fibers associated with a thread, you must call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-convertthreadtofiber">ConvertThreadToFiber</a> to set up an area in which to save the fiber state information. The thread is now the currently executing fiber.
     * 
     * The 
     * <b>SwitchToFiber</b> function saves the state information of the current fiber and restores the state of the specified fiber. You can call 
     * <b>SwitchToFiber</b> with the address of a fiber created by a different thread. To do this, you must have the address returned to the other thread when it called 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createfiber">CreateFiber</a> and you must use proper synchronization.
     * 
     * Avoid making the following call:
     * 
     * 
     * ``` syntax
     * SwitchToFiber( GetCurrentFiber() );
     * ```
     * 
     * This call can cause unpredictable problems.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0400 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {Integer} fullSwitch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-switchtofiber
     */
    SwitchTo(fullSwitch) {
        result := ComCall(3, this, "char", fullSwitch, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SwitchBack() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
