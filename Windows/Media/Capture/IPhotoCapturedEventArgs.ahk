#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CapturedFrame.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IPhotoCapturedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoCapturedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{373bfbc1-984e-4ff0-bf85-1c00aabc5a45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Frame", "get_Thumbnail", "get_CaptureTimeOffset"]

    /**
     * @type {CapturedFrame} 
     */
    Frame {
        get => this.get_Frame()
    }

    /**
     * @type {CapturedFrame} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
    }

    /**
     * @type {TimeSpan} 
     */
    CaptureTimeOffset {
        get => this.get_CaptureTimeOffset()
    }

    /**
     * 
     * @returns {CapturedFrame} 
     */
    get_Frame() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CapturedFrame(value)
    }

    /**
     * 
     * @returns {CapturedFrame} 
     */
    get_Thumbnail() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CapturedFrame(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_CaptureTimeOffset() {
        value := TimeSpan()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
