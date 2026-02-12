#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{23a29f6d-7dda-4a51-87a9-6fa8c5b292be}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OldValue", "get_NewValue", "get_AudioOnly"]

    /**
     * @type {Integer} 
     */
    OldValue {
        get => this.get_OldValue()
    }

    /**
     * @type {Integer} 
     */
    NewValue {
        get => this.get_NewValue()
    }

    /**
     * @type {Boolean} 
     */
    AudioOnly {
        get => this.get_AudioOnly()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OldValue() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NewValue() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AudioOnly() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
