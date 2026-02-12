#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AudioMediaFrame.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class IMediaFrameReference2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaFrameReference2
     * @type {Guid}
     */
    static IID => Guid("{ddbc3ecc-d5b2-49ef-836a-947d989b80c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AudioMediaFrame"]

    /**
     * @type {AudioMediaFrame} 
     */
    AudioMediaFrame {
        get => this.get_AudioMediaFrame()
    }

    /**
     * 
     * @returns {AudioMediaFrame} 
     */
    get_AudioMediaFrame() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioMediaFrame(value)
    }
}
