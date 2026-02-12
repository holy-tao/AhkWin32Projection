#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PerceptionColorFrameSource.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class IPerceptionColorFrameSourceAddedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionColorFrameSourceAddedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{d16bf4e6-da24-442c-bbd5-55549b5b94f3}")

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
     * @type {PerceptionColorFrameSource} 
     */
    FrameSource {
        get => this.get_FrameSource()
    }

    /**
     * 
     * @returns {PerceptionColorFrameSource} 
     */
    get_FrameSource() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PerceptionColorFrameSource(value)
    }
}
