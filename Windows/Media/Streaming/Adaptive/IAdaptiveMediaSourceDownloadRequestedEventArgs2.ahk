#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class IAdaptiveMediaSourceDownloadRequestedEventArgs2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdaptiveMediaSourceDownloadRequestedEventArgs2
     * @type {Guid}
     */
    static IID => Guid("{b37d8bfe-aa44-4d82-825b-611de3bcfecb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RequestId", "get_Position"]

    /**
     * @type {Integer} 
     */
    RequestId {
        get => this.get_RequestId()
    }

    /**
     * @type {IReference<TimeSpan>} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequestId() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Position() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }
}
