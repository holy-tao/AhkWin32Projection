#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class ISmartCardEmulatorApduReceivedEventArgsWithCryptograms extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCardEmulatorApduReceivedEventArgsWithCryptograms
     * @type {Guid}
     */
    static IID => Guid("{d550bac7-b7bf-4e29-9294-0c4ac3c941bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryRespondWithCryptogramsAsync", "TryRespondWithCryptogramsAndStateAsync"]

    /**
     * 
     * @param {IBuffer} responseTemplate 
     * @param {IIterable<SmartCardCryptogramPlacementStep>} cryptogramPlacementSteps 
     * @returns {IAsyncOperation<Integer>} 
     */
    TryRespondWithCryptogramsAsync(responseTemplate, cryptogramPlacementSteps) {
        result := ComCall(6, this, "ptr", responseTemplate, "ptr", cryptogramPlacementSteps, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @param {IBuffer} responseTemplate 
     * @param {IIterable<SmartCardCryptogramPlacementStep>} cryptogramPlacementSteps 
     * @param {IReference<Integer>} nextState 
     * @returns {IAsyncOperation<Integer>} 
     */
    TryRespondWithCryptogramsAndStateAsync(responseTemplate, cryptogramPlacementSteps, nextState) {
        result := ComCall(7, this, "ptr", responseTemplate, "ptr", cryptogramPlacementSteps, "ptr", nextState, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }
}
