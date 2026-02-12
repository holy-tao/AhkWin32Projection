#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class IConversationalAgentSession2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConversationalAgentSession2
     * @type {Guid}
     */
    static IID => Guid("{a7a9fbf9-ac78-57ff-9596-acc7a1c9a607}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestActivationAsync", "RequestActivation", "SetSupportLockScreenActivationAsync", "SetSupportLockScreenActivation", "GetMissingPrerequisites", "GetMissingPrerequisitesAsync"]

    /**
     * 
     * @param {Integer} activationKind_ 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestActivationAsync(activationKind_) {
        result := ComCall(6, this, "int", activationKind_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {Integer} activationKind_ 
     * @returns {Integer} 
     */
    RequestActivation(activationKind_) {
        result := ComCall(7, this, "int", activationKind_, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Boolean} lockScreenActivationSupported 
     * @returns {IAsyncAction} 
     */
    SetSupportLockScreenActivationAsync(lockScreenActivationSupported) {
        result := ComCall(8, this, "int", lockScreenActivationSupported, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {Boolean} lockScreenActivationSupported 
     * @returns {HRESULT} 
     */
    SetSupportLockScreenActivation(lockScreenActivationSupported) {
        result := ComCall(9, this, "int", lockScreenActivationSupported, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    GetMissingPrerequisites() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<Integer>>} 
     */
    GetMissingPrerequisitesAsync() {
        result := ComCall(11, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, (ptr) => IPropertyValue(ptr).GetInt32()), operation)
    }
}
