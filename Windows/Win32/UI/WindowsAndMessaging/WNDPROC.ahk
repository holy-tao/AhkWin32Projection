#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\LRESULT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A callback function, which you define in your application, that processes messages sent to a window.
 * @remarks
 * If your application runs on a 32-bit version of Windows operating system, uncaught exceptions from the callback will be passed onto higher-level exception handlers of your application when available. The system then calls the unhandled exception filter to handle the exception prior to terminating the process. If the PCA is enabled, it will offer to fix the problem the next time you run the application.
 * 
 * However, if your application runs on a 64-bit version of Windows operating system or WOW64, you should be aware that a 64-bit operating system handles uncaught exceptions differently based on its 64-bit processor architecture, exception architecture, and calling convention. The following table summarizes all possible ways that a 64-bit Windows operating system or WOW64 handles uncaught exceptions.
 * 
 * |Behavior type|How the system handles uncaught exceptions|
 * |-|-|
 * |1|The system suppresses any uncaught exceptions.|
 * |2|The system first terminates the process, and then the Program Compatibility Assistant (PCA) offers to fix it the next time you run the application. You can disable the PCA mitigation by adding a Compatibility section to the [application manifest](/windows/win32/win7appqual/compatibility---application-manifest).|
 * |3|The system calls the exception filters but suppresses any uncaught exceptions when it leaves the callback scope, without invoking the associated handlers.|
 * 
 * The following table shows how a 64-bit version of the Windows operating system, and WOW64, handles uncaught exceptions. Notice that behavior type 2 applies only to the 64-bit version of the Windows 7 operating system and later.
 * 
 * |Operating system|WOW64|64-bit Windows|
 * |-|-|-|
 * |Windows XP|3|1|
 * |Windows Server 2003|3|1|
 * |Windows Vista|3|1|
 * |Windows Vista SP1|1|1|
 * |Windows 7 and later|1|2|
 * 
 * > [!NOTE]
 * > On Windows 7 with SP1 (32-bit, 64-bit, or WOW64), the system calls the unhandled exception filter to handle the exception prior to terminating the process. If the Program Compatibility Assistant (PCA) is enabled, then it will offer to fix the problem the next time you run the application.
 * 
 * If you need to handle exceptions in your application, you can use structured exception handling to do so. For more information on how to use structured exception handling, see [Structured exception handling](/windows/win32/debug/structured-exception-handling).
 * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nc-winuser-wndproc
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class WNDPROC extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HWND} param0 
     * @param {Integer} param1 
     * @param {WPARAM} param2 
     * @param {LPARAM} param3 
     * @returns {LRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2, param3) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0
        param2 := param2 is Win32Handle ? NumGet(param2, "ptr") : param2
        param3 := param3 is Win32Handle ? NumGet(param3, "ptr") : param3

        result := ComCall(3, this, "ptr", param0, "uint", param1, "ptr", param2, "ptr", param3, "ptr")
        resultHandle := LRESULT({Value: result}, True)
        return resultHandle
    }
}
