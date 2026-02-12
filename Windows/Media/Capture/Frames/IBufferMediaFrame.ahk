#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MediaFrameReference.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class IBufferMediaFrame extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBufferMediaFrame
     * @type {Guid}
     */
    static IID => Guid("{b5b153c7-9b84-4062-b79c-a365b2596854}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FrameReference", "get_Buffer"]

    /**
     * @type {MediaFrameReference} 
     */
    FrameReference {
        get => this.get_FrameReference()
    }

    /**
     * @type {IBuffer} 
     */
    Buffer {
        get => this.get_Buffer()
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
     * @returns {IBuffer} 
     */
    get_Buffer() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }
}
