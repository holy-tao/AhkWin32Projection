#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Core\IMediaSource.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IMediaCaptureInitializationSettings3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaCaptureInitializationSettings3
     * @type {Guid}
     */
    static IID => Guid("{4160519d-be48-4730-8104-0cf6e9e97948}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_AudioSource", "get_AudioSource", "put_VideoSource", "get_VideoSource"]

    /**
     * @type {IMediaSource} 
     */
    AudioSource {
        get => this.get_AudioSource()
        set => this.put_AudioSource(value)
    }

    /**
     * @type {IMediaSource} 
     */
    VideoSource {
        get => this.get_VideoSource()
        set => this.put_VideoSource(value)
    }

    /**
     * 
     * @param {IMediaSource} value 
     * @returns {HRESULT} 
     */
    put_AudioSource(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IMediaSource} 
     */
    get_AudioSource() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMediaSource(value)
    }

    /**
     * 
     * @param {IMediaSource} value 
     * @returns {HRESULT} 
     */
    put_VideoSource(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IMediaSource} 
     */
    get_VideoSource() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMediaSource(value)
    }
}
