#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\ActivationSignalDetector.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class IConversationalAgentDetectorManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConversationalAgentDetectorManager
     * @type {Guid}
     */
    static IID => Guid("{de94fbb0-597a-5df8-8cfb-9dbb583ba3ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAllActivationSignalDetectors", "GetAllActivationSignalDetectorsAsync", "GetActivationSignalDetectors", "GetActivationSignalDetectorsAsync"]

    /**
     * 
     * @returns {IVectorView<ActivationSignalDetector>} 
     */
    GetAllActivationSignalDetectors() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ActivationSignalDetector, result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<ActivationSignalDetector>>} 
     */
    GetAllActivationSignalDetectorsAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, ActivationSignalDetector), operation)
    }

    /**
     * 
     * @param {Integer} kind 
     * @returns {IVectorView<ActivationSignalDetector>} 
     */
    GetActivationSignalDetectors(kind) {
        result := ComCall(8, this, "int", kind, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ActivationSignalDetector, result_)
    }

    /**
     * 
     * @param {Integer} kind 
     * @returns {IAsyncOperation<IVectorView<ActivationSignalDetector>>} 
     */
    GetActivationSignalDetectorsAsync(kind) {
        result := ComCall(9, this, "int", kind, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, ActivationSignalDetector), operation)
    }
}
