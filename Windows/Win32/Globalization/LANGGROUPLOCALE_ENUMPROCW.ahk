#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * An application-defined callback function that processes enumerated language group locale information provided by the EnumLanguageGroupLocales function. (Unicode)
 * @remarks
 * An <b>EnumLanguageGroupLocalesProc</b> function can carry out any desired task. The application registers this function by passing its address to the <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-enumlanguagegrouplocalesa">EnumLanguageGroupLocales</a> function.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winnls.h header defines LANGGROUPLOCALE_ENUMPROC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api//content/winnls/nc-winnls-langgrouplocale_enumprocw
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 * @charset Unicode
 */
class LANGGROUPLOCALE_ENUMPROCW extends IUnknown {

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
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {PWSTR} param2 
     * @param {Pointer} param3 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2, param3) {
        param2 := param2 is String ? StrPtr(param2) : param2

        result := ComCall(3, this, "uint", param0, "uint", param1, "ptr", param2, "ptr", param3, "int")
        return result
    }
}
