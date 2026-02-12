#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MediaFrameReference.ahk
#Include .\VideoMediaFrame.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class IInfraredMediaFrame extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInfraredMediaFrame
     * @type {Guid}
     */
    static IID => Guid("{3fd13503-004b-4f0e-91ac-465299b41658}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FrameReference", "get_VideoMediaFrame", "get_IsIlluminated"]

    /**
     * @type {MediaFrameReference} 
     */
    FrameReference {
        get => this.get_FrameReference()
    }

    /**
     * @type {VideoMediaFrame} 
     */
    VideoMediaFrame {
        get => this.get_VideoMediaFrame()
    }

    /**
     * @type {Boolean} 
     */
    IsIlluminated {
        get => this.get_IsIlluminated()
    }

    /**
     * 
     * @returns {MediaFrameReference} 
     */
    get_FrameReference() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaFrameReference(value)
    }

    /**
     * 
     * @returns {VideoMediaFrame} 
     */
    get_VideoMediaFrame() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoMediaFrame(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIlluminated() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
