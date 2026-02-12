#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MiracastReceiverVideoStreamSettings.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class IMiracastReceiverStreamControl extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMiracastReceiverStreamControl
     * @type {Guid}
     */
    static IID => Guid("{38ea2d8b-2769-5ad7-8a8a-254b9df7ba82}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVideoStreamSettings", "GetVideoStreamSettingsAsync", "SuggestVideoStreamSettings", "SuggestVideoStreamSettingsAsync", "get_MuteAudio", "put_MuteAudio"]

    /**
     * @type {Boolean} 
     */
    MuteAudio {
        get => this.get_MuteAudio()
        set => this.put_MuteAudio(value)
    }

    /**
     * 
     * @returns {MiracastReceiverVideoStreamSettings} 
     */
    GetVideoStreamSettings() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MiracastReceiverVideoStreamSettings(result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<MiracastReceiverVideoStreamSettings>} 
     */
    GetVideoStreamSettingsAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MiracastReceiverVideoStreamSettings, operation)
    }

    /**
     * 
     * @param {MiracastReceiverVideoStreamSettings} settings 
     * @returns {HRESULT} 
     */
    SuggestVideoStreamSettings(settings) {
        result := ComCall(8, this, "ptr", settings, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {MiracastReceiverVideoStreamSettings} settings 
     * @returns {IAsyncAction} 
     */
    SuggestVideoStreamSettingsAsync(settings) {
        result := ComCall(9, this, "ptr", settings, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_MuteAudio() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_MuteAudio(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
