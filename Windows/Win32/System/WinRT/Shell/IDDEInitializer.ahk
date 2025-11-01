#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Shell
 * @version v4.0.30319
 */
class IDDEInitializer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDDEInitializer
     * @type {Guid}
     */
    static IID => Guid("{30dc931f-33fc-4ffd-a168-942258cf3ca4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {PWSTR} fileExtensionOrProtocol 
     * @param {Integer} method 
     * @param {PWSTR} currentDirectory 
     * @param {IShellItem} execTarget 
     * @param {IUnknown} site 
     * @param {PWSTR} application 
     * @param {PWSTR} targetFile 
     * @param {PWSTR} arguments 
     * @param {PWSTR} verb 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(fileExtensionOrProtocol, method, currentDirectory, execTarget, site, application, targetFile, arguments, verb) {
        fileExtensionOrProtocol := fileExtensionOrProtocol is String ? StrPtr(fileExtensionOrProtocol) : fileExtensionOrProtocol
        currentDirectory := currentDirectory is String ? StrPtr(currentDirectory) : currentDirectory
        application := application is String ? StrPtr(application) : application
        targetFile := targetFile is String ? StrPtr(targetFile) : targetFile
        arguments := arguments is String ? StrPtr(arguments) : arguments
        verb := verb is String ? StrPtr(verb) : verb

        result := ComCall(3, this, "ptr", fileExtensionOrProtocol, "int", method, "ptr", currentDirectory, "ptr", execTarget, "ptr", site, "ptr", application, "ptr", targetFile, "ptr", arguments, "ptr", verb, "HRESULT")
        return result
    }
}
