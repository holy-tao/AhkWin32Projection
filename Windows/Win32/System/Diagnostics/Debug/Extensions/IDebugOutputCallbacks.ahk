#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugOutputCallbacks extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugOutputCallbacks
     * @type {Guid}
     */
    static IID => Guid("{4bf58045-d654-4c40-b0af-683090f356dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Output"]

    /**
     * Sends a string to the debugger for display. (Unicode)
     * @remarks
     * > [!IMPORTANT]
     * > To use this function, you must include the Windows.h header in your application (not debugapi.h).
     * 
     * In the past, the operating system did not return Unicode strings through **OutputDebugStringW** (ASCII strings were returned instead). To force **OutputDebugStringW** to return Unicode strings, debuggers are required to call the [**WaitForDebugEventEx**](nf-debugapi-waitfordebugeventex.md) function to opt into the new behavior. In this way, the operating system knows that the debugger supports Unicode and is specifically opting into receiving Unicode strings.
     * 
     * If the application does not have a debugger, and the filter mask allows it, the system debugger displays the string. To display the string, this function calls the [**DbgPrint**](/windows-hardware/drivers/ddi/wdm/nf-wdm-dbgprint) function. Prior to Windows Vista, content was not filtered by the system debugger.
     * 
     * If the application does not have a debugger and the system debugger is not active, **OutputDebugString** does nothing.
     * 
     * [**OutputDebugStringW**](nf-debugapi-outputdebugstringw.md) converts the specified string based on the current system locale information and passes it to **OutputDebugStringA** to be displayed.  As a result, some Unicode characters may not be displayed correctly.
     * 
     * Applications should send very minimal debug output and provide a way for the user to enable or disable its use. See [Event Tracing](/windows/win32/etw/event-tracing-portal) to learn more about tracing details.
     * 
     * Visual Studio has changed how it handles the display of these strings throughout its revision history. Refer to the Visual Studio documentation for details of how your version deals with this.
     * 
     * The debugapi.h header defines OutputDebugString as an alias that automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that is not encoding-neutral can lead to mismatches and compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} Mask 
     * @param {PSTR} Text 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/debugapi/nf-debugapi-outputdebugstringw
     */
    Output(Mask, Text) {
        Text := Text is String ? StrPtr(Text) : Text

        result := ComCall(3, this, "uint", Mask, "ptr", Text, "HRESULT")
        return result
    }
}
