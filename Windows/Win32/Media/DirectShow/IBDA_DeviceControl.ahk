#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IBDA_DeviceControl interface is implemented on all BDA device filters.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_DeviceControl)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_devicecontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_DeviceControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_DeviceControl
     * @type {Guid}
     */
    static IID => Guid("{fd0a5af3-b41d-11d2-9c95-00c04f7971e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartChanges", "CheckChanges", "CommitChanges", "GetChangeState"]

    /**
     * The StartChanges method is called by a Network Provider before it begins to modify a set of properties on a BDA device filter.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_devicecontrol-startchanges
     */
    StartChanges() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The CheckChanges method queries the device filter as to whether the changes that are pending would succeed if they were committed.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_devicecontrol-checkchanges
     */
    CheckChanges() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The CommitChanges method instructs the device to perform the changes specified in the previous call to StartChanges.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_devicecontrol-commitchanges
     */
    CommitChanges() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The GetChangeState method returns a value indicating whether any uncommitted changes are currently pending in the filter.
     * @param {Pointer<Integer>} pState Receives the current state of the filter. See BDA_CHANGE_STATE in the Windows DDK for possible values.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_devicecontrol-getchangestate
     */
    GetChangeState(pState) {
        pStateMarshal := pState is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pStateMarshal, pState, "HRESULT")
        return result
    }
}
