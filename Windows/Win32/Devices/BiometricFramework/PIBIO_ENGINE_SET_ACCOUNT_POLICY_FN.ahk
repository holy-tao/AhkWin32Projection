#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Sets the extended default and per-user antispoofing policies used by the engine adapter.
 * @remarks
 * This method is called each time the biometric unit is activated.
 * 
 * This method executes in the context of the same thread that activated the biometric unit and that processed all other requests for the unit.
 * 
 * The Identity.Type field of the first element in the <i>PolicyItemArray</i> will always be <b>WINBIO_ID_TYPE_WILDCARD</b>. This indicates that the policy item contains a default AntiSpoofBehavior value which should be applied to any user account that isn’t explicitly listed in the rest of the array.
 * 
 * If the <i>PolicyItemArray</i> contains more than one element, the Identity.Type field of the remaining items will be <b>WINBIO_ID_TYPE_WILDCARD</b>, and the Identity.Value.AccountSid.Data field will contain the SID of a user account that requires the antispoof policy behavior specified in the AntiSpoofBehavior field of the array element.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_engine_set_account_policy_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_ENGINE_SET_ACCOUNT_POLICY_FN extends IUnknown {

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
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline 
     * @param {Pointer<WINBIO_ACCOUNT_POLICY>} PolicyItemArray 
     * @param {Pointer} PolicyItemCount 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, PolicyItemArray, PolicyItemCount) {
        result := ComCall(3, this, "ptr", Pipeline, "ptr", PolicyItemArray, "ptr", PolicyItemCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
