#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The INSTALLUI_HANDLER function prototype defines a callback function that the installer calls for progress notification and error messages. (Unicode)
 * @remarks
 * For more information on returning values from an external user interface handler, see the 
 * <a href="https://docs.microsoft.com/windows/desktop/Msi/returning-values-from-an-external-user-interface-handler">Returning Values from an External User Interface Handler</a> topic.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The msi.h header defines INSTALLUI_HANDLER as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api//content/msi/nc-msi-installui_handlerw
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 * @charset Unicode
 */
class INSTALLUI_HANDLERW extends IUnknown {

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
     * @param {Pointer<Void>} pvContext 
     * @param {Integer} iMessageType 
     * @param {PWSTR} szMessage 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pvContext, iMessageType, szMessage) {
        szMessage := szMessage is String ? StrPtr(szMessage) : szMessage

        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pvContextMarshal, pvContext, "uint", iMessageType, "ptr", szMessage, "int")
        return result
    }
}
