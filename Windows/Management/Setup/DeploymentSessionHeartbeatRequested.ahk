#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Management.Setup
 * @version WindowsRuntime 1.4
 */
class DeploymentSessionHeartbeatRequested extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DeploymentSessionHeartbeatRequested
     * @type {Guid}
     */
    static IID => Guid("{c94a770b-5b05-4595-9e69-79070484377e}")

    /**
     * The class identifier for DeploymentSessionHeartbeatRequested
     * @type {Guid}
     */
    static CLSID => Guid("{c94a770b-5b05-4595-9e69-79070484377e}")

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
     * @param {DeploymentSessionHeartbeatRequestedEventArgs} eventArgs 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(eventArgs) {
        result := ComCall(3, this, "ptr", eventArgs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
