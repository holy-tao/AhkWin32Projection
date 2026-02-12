#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\TwoPanelHingedDevicePosturePreviewReading.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Preview
 * @version WindowsRuntime 1.4
 */
class ITwoPanelHingedDevicePosturePreview extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITwoPanelHingedDevicePosturePreview
     * @type {Guid}
     */
    static IID => Guid("{72245c31-4b39-42a6-8e73-7235ade16853}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentPostureAsync", "add_PostureChanged", "remove_PostureChanged"]

    /**
     * 
     * @returns {IAsyncOperation<TwoPanelHingedDevicePosturePreviewReading>} 
     */
    GetCurrentPostureAsync() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(TwoPanelHingedDevicePosturePreviewReading, value)
    }

    /**
     * 
     * @param {TypedEventHandler<TwoPanelHingedDevicePosturePreview, TwoPanelHingedDevicePosturePreviewReadingChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PostureChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(7, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PostureChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
