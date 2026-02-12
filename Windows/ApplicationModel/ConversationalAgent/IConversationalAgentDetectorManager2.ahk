#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ActivationSignalDetector.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class IConversationalAgentDetectorManager2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConversationalAgentDetectorManager2
     * @type {Guid}
     */
    static IID => Guid("{84610f31-d7f3-52fe-9311-c9eb4e3eb30a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetActivationSignalDetectorFromId", "GetActivationSignalDetectorFromIdAsync"]

    /**
     * 
     * @param {HSTRING} detectorId 
     * @returns {ActivationSignalDetector} 
     */
    GetActivationSignalDetectorFromId(detectorId) {
        if(detectorId is String) {
            pin := HSTRING.Create(detectorId)
            detectorId := pin.Value
        }
        detectorId := detectorId is Win32Handle ? NumGet(detectorId, "ptr") : detectorId

        result := ComCall(6, this, "ptr", detectorId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ActivationSignalDetector(result_)
    }

    /**
     * 
     * @param {HSTRING} detectorId 
     * @returns {IAsyncOperation<ActivationSignalDetector>} 
     */
    GetActivationSignalDetectorFromIdAsync(detectorId) {
        if(detectorId is String) {
            pin := HSTRING.Create(detectorId)
            detectorId := pin.Value
        }
        detectorId := detectorId is Win32Handle ? NumGet(detectorId, "ptr") : detectorId

        result := ComCall(7, this, "ptr", detectorId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ActivationSignalDetector, operation)
    }
}
