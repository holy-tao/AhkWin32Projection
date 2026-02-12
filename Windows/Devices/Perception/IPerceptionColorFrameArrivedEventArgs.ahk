#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include .\PerceptionColorFrame.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class IPerceptionColorFrameArrivedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionColorFrameArrivedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{8fad02d5-86f7-4d8d-b966-5a3761ba9f59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RelativeTime", "TryOpenFrame"]

    /**
     * @type {TimeSpan} 
     */
    RelativeTime {
        get => this.get_RelativeTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_RelativeTime() {
        value := TimeSpan()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {PerceptionColorFrame} 
     */
    TryOpenFrame() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PerceptionColorFrame(result_)
    }
}
