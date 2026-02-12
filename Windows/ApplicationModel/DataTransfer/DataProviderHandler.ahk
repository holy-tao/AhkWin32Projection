#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Provides data when the target app requests it, instead of including the data in the [DataPackage](datapackage_datapackage_1221375020.md) ahead of time. [ DataProviderHandler is used when the source app wants to avoid unnecessary work that is resource intensive, such as performing format conversions.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dataproviderhandler
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class DataProviderHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DataProviderHandler
     * @type {Guid}
     */
    static IID => Guid("{e7ecd720-f2f4-4a2d-920e-170a2f482a27}")

    /**
     * The class identifier for DataProviderHandler
     * @type {Guid}
     */
    static CLSID => Guid("{e7ecd720-f2f4-4a2d-920e-170a2f482a27}")

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
     * @param {DataProviderRequest} request 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(request) {
        result := ComCall(3, this, "ptr", request, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
