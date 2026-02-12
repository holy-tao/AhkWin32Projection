#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Streaming\Adaptive\AdaptiveMediaSource.ahk
#Include .\MediaStreamSource.ahk
#Include .\MseStreamSource.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMediaSource4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaSource4
     * @type {Guid}
     */
    static IID => Guid("{bdafad57-8eff-4c63-85a6-84de0ae3e4f2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AdaptiveMediaSource", "get_MediaStreamSource", "get_MseStreamSource", "get_Uri", "OpenAsync"]

    /**
     * @type {AdaptiveMediaSource} 
     */
    AdaptiveMediaSource {
        get => this.get_AdaptiveMediaSource()
    }

    /**
     * @type {MediaStreamSource} 
     */
    MediaStreamSource {
        get => this.get_MediaStreamSource()
    }

    /**
     * @type {MseStreamSource} 
     */
    MseStreamSource {
        get => this.get_MseStreamSource()
    }

    /**
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * 
     * @returns {AdaptiveMediaSource} 
     */
    get_AdaptiveMediaSource() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AdaptiveMediaSource(value)
    }

    /**
     * 
     * @returns {MediaStreamSource} 
     */
    get_MediaStreamSource() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaStreamSource(value)
    }

    /**
     * 
     * @returns {MseStreamSource} 
     */
    get_MseStreamSource() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MseStreamSource(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    OpenAsync() {
        result := ComCall(10, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
