#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AppBroadcastStreamAudioHeader.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppBroadcastStreamAudioFrame extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBroadcastStreamAudioFrame
     * @type {Guid}
     */
    static IID => Guid("{efab4ac8-21ba-453f-8bb7-5e938a2e9a74}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AudioHeader", "get_AudioBuffer"]

    /**
     * @type {AppBroadcastStreamAudioHeader} 
     */
    AudioHeader {
        get => this.get_AudioHeader()
    }

    /**
     * @type {IBuffer} 
     */
    AudioBuffer {
        get => this.get_AudioBuffer()
    }

    /**
     * 
     * @returns {AppBroadcastStreamAudioHeader} 
     */
    get_AudioHeader() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppBroadcastStreamAudioHeader(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_AudioBuffer() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }
}
