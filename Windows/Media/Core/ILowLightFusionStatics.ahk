#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\LowLightFusionResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class ILowLightFusionStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILowLightFusionStatics
     * @type {Guid}
     */
    static IID => Guid("{5305016d-c29e-40e2-87a9-9e1fd2f192f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SupportedBitmapPixelFormats", "get_MaxSupportedFrameCount", "FuseAsync"]

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedBitmapPixelFormats {
        get => this.get_SupportedBitmapPixelFormats()
    }

    /**
     * @type {Integer} 
     */
    MaxSupportedFrameCount {
        get => this.get_MaxSupportedFrameCount()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedBitmapPixelFormats() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxSupportedFrameCount() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {IIterable<SoftwareBitmap>} frameSet 
     * @returns {IAsyncOperationWithProgress<LowLightFusionResult, Float>} 
     */
    FuseAsync(frameSet) {
        result := ComCall(8, this, "ptr", frameSet, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(LowLightFusionResult, (ptr) => IPropertyValue(ptr).GetDouble(), result_)
    }
}
