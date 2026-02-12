#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IAudioTrackSupportInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioTrackSupportInfo
     * @type {Guid}
     */
    static IID => Guid("{178beff7-cc39-44a6-b951-4a5653f073fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DecoderStatus", "get_Degradation", "get_DegradationReason", "get_MediaSourceStatus"]

    /**
     * @type {Integer} 
     */
    DecoderStatus {
        get => this.get_DecoderStatus()
    }

    /**
     * @type {Integer} 
     */
    Degradation {
        get => this.get_Degradation()
    }

    /**
     * @type {Integer} 
     */
    DegradationReason {
        get => this.get_DegradationReason()
    }

    /**
     * @type {Integer} 
     */
    MediaSourceStatus {
        get => this.get_MediaSourceStatus()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DecoderStatus() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Degradation() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DegradationReason() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MediaSourceStatus() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
