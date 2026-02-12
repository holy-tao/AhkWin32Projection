#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DDEnumCallback function is an application-defined callback function for the DirectDrawEnumerate function. (ANSI)
 * @remarks
 * You can use the LPDDENUMCALLBACK data type to declare a variable that can contain a pointer to this callback function.
 * 
 * If UNICODE is defined, the string values are returned as type LPWSTR, rather than LPSTR.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ddraw.h header defines LPDDENUMCALLBACK as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nc-ddraw-lpddenumcallbacka
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 * @charset ANSI
 */
class LPDDENUMCALLBACKA extends IUnknown {

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
     * @param {Pointer<Guid>} param0 
     * @param {PSTR} param1 
     * @param {PSTR} param2 
     * @param {Pointer<Void>} param3 
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
        param1 := param1 is String ? StrPtr(param1) : param1
        param2 := param2 is String ? StrPtr(param2) : param2

        param3Marshal := param3 is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", param0, "ptr", param1, "ptr", param2, param3Marshal, param3, "int")
        return result
    }
}
