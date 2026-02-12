#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AdaptiveMediaSource.ahk
#Include ..\..\..\Web\Http\HttpResponseMessage.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class IAdaptiveMediaSourceCreationResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdaptiveMediaSourceCreationResult
     * @type {Guid}
     */
    static IID => Guid("{4686b6b2-800f-4e31-9093-76d4782013e7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_MediaSource", "get_HttpResponseMessage"]

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {AdaptiveMediaSource} 
     */
    MediaSource {
        get => this.get_MediaSource()
    }

    /**
     * @type {HttpResponseMessage} 
     */
    HttpResponseMessage {
        get => this.get_HttpResponseMessage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {AdaptiveMediaSource} 
     */
    get_MediaSource() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AdaptiveMediaSource(value)
    }

    /**
     * 
     * @returns {HttpResponseMessage} 
     */
    get_HttpResponseMessage() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpResponseMessage(value)
    }
}
