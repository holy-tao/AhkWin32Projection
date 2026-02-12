#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BitmapPropertiesView.ahk
#Include .\BitmapCodecInformation.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ImageStream.ahk
#Include .\BitmapFrame.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class IBitmapDecoder extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBitmapDecoder
     * @type {Guid}
     */
    static IID => Guid("{acef22ba-1d74-4c91-9dfc-9620745233e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BitmapContainerProperties", "get_DecoderInformation", "get_FrameCount", "GetPreviewAsync", "GetFrameAsync"]

    /**
     * @type {BitmapPropertiesView} 
     */
    BitmapContainerProperties {
        get => this.get_BitmapContainerProperties()
    }

    /**
     * @type {BitmapCodecInformation} 
     */
    DecoderInformation {
        get => this.get_DecoderInformation()
    }

    /**
     * @type {Integer} 
     */
    FrameCount {
        get => this.get_FrameCount()
    }

    /**
     * 
     * @returns {BitmapPropertiesView} 
     */
    get_BitmapContainerProperties() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BitmapPropertiesView(value)
    }

    /**
     * 
     * @returns {BitmapCodecInformation} 
     */
    get_DecoderInformation() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BitmapCodecInformation(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FrameCount() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<ImageStream>} 
     */
    GetPreviewAsync() {
        result := ComCall(9, this, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ImageStream, asyncInfo)
    }

    /**
     * 
     * @param {Integer} frameIndex 
     * @returns {IAsyncOperation<BitmapFrame>} 
     */
    GetFrameAsync(frameIndex) {
        result := ComCall(10, this, "uint", frameIndex, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(BitmapFrame, asyncInfo)
    }
}
