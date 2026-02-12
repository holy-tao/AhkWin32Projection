#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * An application-defined callback function used with the EnumPageFiles function. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The psapi.h header defines PENUM_PAGE_FILE_CALLBACK as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api//content/psapi/nc-psapi-penum_page_file_callbacka
 * @namespace Windows.Win32.System.ProcessStatus
 * @version v4.0.30319
 * @charset ANSI
 */
class PENUM_PAGE_FILE_CALLBACKA extends IUnknown {

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
     * @param {Pointer<Void>} pContext 
     * @param {Pointer<ENUM_PAGE_FILE_INFORMATION>} pPageFileInfo 
     * @param {PSTR} lpFilename 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pContext, pPageFileInfo, lpFilename) {
        lpFilename := lpFilename is String ? StrPtr(lpFilename) : lpFilename

        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pContextMarshal, pContext, "ptr", pPageFileInfo, "ptr", lpFilename, "int")
        return result
    }
}
