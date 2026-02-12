#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\AudioFrame.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class IProcessAudioFrameContext extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProcessAudioFrameContext
     * @type {Guid}
     */
    static IID => Guid("{4cd92946-1222-4a27-a586-fb3e20273255}")

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
     * @type {AudioFrame} 
     */
    InputFrame {
        get => this.get_InputFrame()
    }

    /**
     * @type {AudioFrame} 
     */
    OutputFrame {
        get => this.get_OutputFrame()
    }

    /**
     * 
     * @returns {AudioFrame} 
     */
    get_InputFrame() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioFrame(value)
    }

    /**
     * 
     * @returns {AudioFrame} 
     */
    get_OutputFrame() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioFrame(value)
    }
}
