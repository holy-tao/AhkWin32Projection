#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Uri.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\AdaptiveMediaSourceDownloadResult.ahk
#Include .\AdaptiveMediaSourceDownloadRequestedDeferral.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class IAdaptiveMediaSourceDownloadRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdaptiveMediaSourceDownloadRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{c83fdffd-44a9-47a2-bf96-03398b4bfaaf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ResourceType", "get_ResourceUri", "get_ResourceByteRangeOffset", "get_ResourceByteRangeLength", "get_Result", "GetDeferral"]

    /**
     * @type {Integer} 
     */
    ResourceType {
        get => this.get_ResourceType()
    }

    /**
     * @type {Uri} 
     */
    ResourceUri {
        get => this.get_ResourceUri()
    }

    /**
     * @type {IReference<Integer>} 
     */
    ResourceByteRangeOffset {
        get => this.get_ResourceByteRangeOffset()
    }

    /**
     * @type {IReference<Integer>} 
     */
    ResourceByteRangeLength {
        get => this.get_ResourceByteRangeLength()
    }

    /**
     * @type {AdaptiveMediaSourceDownloadResult} 
     */
    Result {
        get => this.get_Result()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResourceType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ResourceUri() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ResourceByteRangeOffset() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt64(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ResourceByteRangeLength() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt64(), value)
    }

    /**
     * 
     * @returns {AdaptiveMediaSourceDownloadResult} 
     */
    get_Result() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AdaptiveMediaSourceDownloadResult(value)
    }

    /**
     * 
     * @returns {AdaptiveMediaSourceDownloadRequestedDeferral} 
     */
    GetDeferral() {
        result := ComCall(11, this, "ptr*", &deferral_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AdaptiveMediaSourceDownloadRequestedDeferral(deferral_)
    }
}
