#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AudioNodeListener.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * The interface implemented by audio nodes that support a spatial audio listener.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.iaudionodewithlistener
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IAudioNodeWithListener extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioNodeWithListener
     * @type {Guid}
     */
    static IID => Guid("{0e0f907c-79ff-4544-9eeb-01257b15105a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Listener", "get_Listener"]

    /**
     * Gets or sets the [AudioNodeListener](audionodelistener.md) that describes the position and other characteristics of the listener from which the node's audio is heard when spatial audio processing is used.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.iaudionodewithlistener.listener
     * @type {AudioNodeListener} 
     */
    Listener {
        get => this.get_Listener()
        set => this.put_Listener(value)
    }

    /**
     * 
     * @param {AudioNodeListener} value 
     * @returns {HRESULT} 
     */
    put_Listener(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {AudioNodeListener} 
     */
    get_Listener() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioNodeListener(value)
    }
}
