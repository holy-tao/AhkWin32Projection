#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * An application-defined callback function that processes enumerated user interface language information provided by the EnumUILanguages function. (Unicode)
 * @remarks
 * An <b>EnumUILanguagesProc</b> function can carry out any task. The application registers this function by passing its address to the <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-enumuilanguagesa">EnumUILanguages</a> function.
 * 
 * If MUI_LANGUAGE_ID was specified in the call to <b>EnumUILanguages</b>, the language strings passed to this function will be hexadecimal language 
 * 
 * identifiers that do not include the leading 0x, and will be 4 characters in length. For example, en-US will 
 * 
 * be passed as "0409" and en as "0009".
 * 
 * <h3><a id="C__Signature"></a><a id="c__signature"></a><a id="C__SIGNATURE"></a>C# Signature</h3>
 * 
 * ```cpp
 * delegate System.Boolean EnumUILanguagesProc(
 *             System.IntPtr lpUILanguageString,
 *             System.IntPtr lParam
 *             );
 * 
 * ```
 * 
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winnls.h header defines UILANGUAGE_ENUMPROC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api//content/winnls/nc-winnls-uilanguage_enumprocw
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 * @charset Unicode
 */
class UILANGUAGE_ENUMPROCW extends IUnknown {

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
     * @param {PWSTR} param0 
     * @param {Pointer} param1 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1) {
        param0 := param0 is String ? StrPtr(param0) : param0

        result := ComCall(3, this, "ptr", param0, "ptr", param1, "int")
        return result
    }
}
