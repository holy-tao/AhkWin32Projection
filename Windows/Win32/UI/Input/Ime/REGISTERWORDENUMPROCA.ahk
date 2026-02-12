#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * REGISTERWORDENUMPROCA (ANSI) (imm.h) is an application-defined callback function used with the ImmEnumRegisterWord function.
 * @remarks
 * An application must register this function by passing its address to the <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immenumregisterworda">ImmEnumRegisterWord</a> function.
 * 
 * > [!NOTE]
 * > The imm.h header defines REGISTERWORDENUMPROC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api//content/imm/nc-imm-registerwordenumproca
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 * @charset ANSI
 */
class REGISTERWORDENUMPROCA extends IUnknown {

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
     * @param {PSTR} lpszReading 
     * @param {Integer} param1 
     * @param {PSTR} lpszString 
     * @param {Pointer<Void>} param3 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lpszReading, param1, lpszString, param3) {
        lpszReading := lpszReading is String ? StrPtr(lpszReading) : lpszReading
        lpszString := lpszString is String ? StrPtr(lpszString) : lpszString

        param3Marshal := param3 is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", lpszReading, "uint", param1, "ptr", lpszString, param3Marshal, param3, "int")
        return result
    }
}
