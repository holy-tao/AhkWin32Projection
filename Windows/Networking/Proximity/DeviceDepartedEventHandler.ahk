#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Describes the method that handles the [DeviceDeparted](proximitydevice_devicedeparted.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.devicedepartedeventhandler
 * @namespace Windows.Networking.Proximity
 * @version WindowsRuntime 1.4
 */
class DeviceDepartedEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DeviceDepartedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{efa9da69-f6e2-49c9-a49e-8e0fc58fb911}")

    /**
     * The class identifier for DeviceDepartedEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{efa9da69-f6e2-49c9-a49e-8e0fc58fb911}")

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
     * @param {ProximityDevice} sender 
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
