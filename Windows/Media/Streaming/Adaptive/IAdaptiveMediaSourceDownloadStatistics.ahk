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
class IAdaptiveMediaSourceDownloadStatistics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdaptiveMediaSourceDownloadStatistics
     * @type {Guid}
     */
    static IID => Guid("{a306cefb-e96a-4dff-a9b8-1ae08c01ae98}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContentBytesReceivedCount", "get_TimeToHeadersReceived", "get_TimeToFirstByteReceived", "get_TimeToLastByteReceived"]

    /**
     * @type {Integer} 
     */
    ContentBytesReceivedCount {
        get => this.get_ContentBytesReceivedCount()
    }

    /**
     * @type {IReference<TimeSpan>} 
     */
    TimeToHeadersReceived {
        get => this.get_TimeToHeadersReceived()
    }

    /**
     * @type {IReference<TimeSpan>} 
     */
    TimeToFirstByteReceived {
        get => this.get_TimeToFirstByteReceived()
    }

    /**
     * @type {IReference<TimeSpan>} 
     */
    TimeToLastByteReceived {
        get => this.get_TimeToLastByteReceived()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ContentBytesReceivedCount() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_TimeToHeadersReceived() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_TimeToFirstByteReceived() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_TimeToLastByteReceived() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }
}
