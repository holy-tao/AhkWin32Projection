#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MediaFrameFormat.ahk
#Include .\DepthMediaFrameFormat.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class IVideoMediaFrameFormat extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoMediaFrameFormat
     * @type {Guid}
     */
    static IID => Guid("{46027fc0-d71b-45c7-8f14-6d9a0ae604e4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MediaFrameFormat", "get_DepthFormat", "get_Width", "get_Height"]

    /**
     * @type {MediaFrameFormat} 
     */
    MediaFrameFormat {
        get => this.get_MediaFrameFormat()
    }

    /**
     * @type {DepthMediaFrameFormat} 
     */
    DepthFormat {
        get => this.get_DepthFormat()
    }

    /**
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
    }

    /**
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * 
     * @returns {MediaFrameFormat} 
     */
    get_MediaFrameFormat() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaFrameFormat(value)
    }

    /**
     * 
     * @returns {DepthMediaFrameFormat} 
     */
    get_DepthFormat() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DepthMediaFrameFormat(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Height() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
