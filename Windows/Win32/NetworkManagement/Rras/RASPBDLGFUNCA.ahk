#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The RasPBDlgFunc function is an application-defined callback function that receives notifications of user activity while the RasPhonebookDlg dialog box is open. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The rasdlg.h header defines RASPBDLGFUNC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api//content/rasdlg/nc-rasdlg-raspbdlgfunca
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset ANSI
 */
class RASPBDLGFUNCA extends IUnknown {

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
     * @param {Pointer} param0 
     * @param {Integer} param1 
     * @param {PSTR} param2 
     * @param {Pointer<Void>} param3 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2, param3) {
        param2 := param2 is String ? StrPtr(param2) : param2

        param3Marshal := param3 is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", param0, "uint", param1, "ptr", param2, param3Marshal, param3)
    }
}
