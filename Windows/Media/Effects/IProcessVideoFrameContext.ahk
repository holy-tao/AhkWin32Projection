#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\VideoFrame.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class IProcessVideoFrameContext extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProcessVideoFrameContext
     * @type {Guid}
     */
    static IID => Guid("{276f0e2b-6461-401e-ba78-0fdad6114eec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InputFrame", "get_OutputFrame"]

    /**
     * @type {VideoFrame} 
     */
    InputFrame {
        get => this.get_InputFrame()
    }

    /**
     * @type {VideoFrame} 
     */
    OutputFrame {
        get => this.get_OutputFrame()
    }

    /**
     * 
     * @returns {VideoFrame} 
     */
    get_InputFrame() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoFrame(value)
    }

    /**
     * 
     * @returns {VideoFrame} 
     */
    get_OutputFrame() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoFrame(value)
    }
}
