#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\Com\IUnknown.ahk

/**
 * Represents a method that handles the request to set the version of the application data in the application data store.
 * @remarks
 * The delegate must transform the existing application data from the app-defined schema format associated with the current version to the schema format associated with the requested version. If an unrecoverable error occurs during this operation, the delegate should throw an exception. If the delegate throws an exception, the system does not update the version number.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdatasetversionhandler
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class ApplicationDataSetVersionHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ApplicationDataSetVersionHandler
     * @type {Guid}
     */
    static IID => Guid("{a05791e6-cc9f-4687-acab-a364fd785463}")

    /**
     * The class identifier for ApplicationDataSetVersionHandler
     * @type {Guid}
     */
    static CLSID => Guid("{a05791e6-cc9f-4687-acab-a364fd785463}")

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
     * @param {SetVersionRequest} setVersionRequest_ 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(setVersionRequest_) {
        result := ComCall(3, this, "ptr", setVersionRequest_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
