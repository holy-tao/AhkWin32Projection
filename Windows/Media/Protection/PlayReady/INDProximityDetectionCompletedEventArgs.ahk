#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides arguments for the PlayReady-ND [ProximityDetectionCompleted](ndclient_proximitydetectioncompleted.md) event. Apps fire this event after they complete the proximity detection process.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indproximitydetectioncompletedeventargs
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class INDProximityDetectionCompletedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INDProximityDetectionCompletedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{2a706328-da25-4f8c-9eb7-5d0fc3658bca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProximityDetectionRetryCount"]

    /**
     * Gets the number of retries that occurred during a proximity detection operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indproximitydetectioncompletedeventargs.proximitydetectionretrycount
     * @type {Integer} 
     */
    ProximityDetectionRetryCount {
        get => this.get_ProximityDetectionRetryCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProximityDetectionRetryCount() {
        result := ComCall(6, this, "uint*", &retryCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retryCount
    }
}
