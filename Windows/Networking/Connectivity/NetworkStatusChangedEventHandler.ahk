#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that handles network status change notifications. This method is called when any properties exposed by the [NetworkInformation](networkinformation.md) object changes while the app is active.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkstatuschangedeventhandler
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class NetworkStatusChangedEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for NetworkStatusChangedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{71ba143f-598e-49d0-84eb-8febaedcc195}")

    /**
     * The class identifier for NetworkStatusChangedEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{71ba143f-598e-49d0-84eb-8febaedcc195}")

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
     * @param {IInspectable} sender 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sender) {
        result := ComCall(3, this, "ptr", sender, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
