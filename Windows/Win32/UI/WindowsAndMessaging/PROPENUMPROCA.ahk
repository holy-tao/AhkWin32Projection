#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * An application-defined callback function used with the EnumProps function. (ANSI)
 * @remarks
 * The following restrictions apply to this callback function: 
 * 
 * <ul>
 * <li>The callback function can call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-removepropa">RemoveProp</a> function. However, <b>RemoveProp</b> can remove only the property passed to the callback function through the callback function's parameters. </li>
 * <li>The callback function should not attempt to add properties. </li>
 * </ul>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winuser.h header defines PROPENUMPROC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nc-winuser-propenumproca
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 * @charset ANSI
 */
class PROPENUMPROCA extends IUnknown {

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
     * @param {PSTR} param1 
     * @param {HANDLE} param2 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0
        param1 := param1 is String ? StrPtr(param1) : param1
        param2 := param2 is Win32Handle ? NumGet(param2, "ptr") : param2

        result := ComCall(3, this, "ptr", param0, "ptr", param1, "ptr", param2, "int")
        return result
    }
}
