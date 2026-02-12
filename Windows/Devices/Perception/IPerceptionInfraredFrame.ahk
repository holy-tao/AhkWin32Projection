#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Media\VideoFrame.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class IPerceptionInfraredFrame extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionInfraredFrame
     * @type {Guid}
     */
    static IID => Guid("{b0886276-849e-4c7a-8ae6-b56064532153}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_VideoFrame"]

    /**
     * @type {VideoFrame} 
     */
    VideoFrame {
        get => this.get_VideoFrame()
    }

    /**
     * 
     * @returns {VideoFrame} 
     */
    get_VideoFrame() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoFrame(value)
    }
}
