#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PerceptionInfraredFrameSource.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class IPerceptionInfraredFrameSourceAddedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionInfraredFrameSourceAddedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{6d334120-95ce-4660-907a-d98035aa2b7c}")

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
     * @type {PerceptionInfraredFrameSource} 
     */
    FrameSource {
        get => this.get_FrameSource()
    }

    /**
     * 
     * @returns {PerceptionInfraredFrameSource} 
     */
    get_FrameSource() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PerceptionInfraredFrameSource(value)
    }
}
