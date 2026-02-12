#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that will handle the [LicenseChanged](licenseinformation_licensechanged.md) event.
 * @remarks
 * [LicenseChanged](licenseinformation_licensechanged.md) events occur when the state of an app's license changes while the app is running. You can decide how to respond to these changes. For example, you could have the app respond immediately to the change or you could ignore it until the next time the user opens the app.
 * 
 * When using this event with [CurrentAppSimulator](currentappsimulator.md), this event fires when you start up. When you run using the [CurrentApp](currentapp.md) class it will only fire when there is a change in the License information.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.licensechangedeventhandler
 * @namespace Windows.ApplicationModel.Store
 * @version WindowsRuntime 1.4
 */
class LicenseChangedEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for LicenseChangedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{d4a50255-1369-4c36-832f-6f2d88e3659b}")

    /**
     * The class identifier for LicenseChangedEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{d4a50255-1369-4c36-832f-6f2d88e3659b}")

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
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
