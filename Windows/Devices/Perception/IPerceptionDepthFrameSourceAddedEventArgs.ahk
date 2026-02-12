#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PerceptionDepthFrameSource.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class IPerceptionDepthFrameSourceAddedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionDepthFrameSourceAddedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{93a48168-8bf8-45d2-a2f8-4ac0931cc7a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FrameSource"]

    /**
     * @type {PerceptionDepthFrameSource} 
     */
    FrameSource {
        get => this.get_FrameSource()
    }

    /**
     * 
     * @returns {PerceptionDepthFrameSource} 
     */
    get_FrameSource() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PerceptionDepthFrameSource(value)
    }
}
