#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\PrepareTranscodeResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Transcoding
 * @version WindowsRuntime 1.4
 */
class IMediaTranscoder2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaTranscoder2
     * @type {Guid}
     */
    static IID => Guid("{40531d74-35e0-4f04-8574-ca8bc4e5a082}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PrepareMediaStreamSourceTranscodeAsync", "put_VideoProcessingAlgorithm", "get_VideoProcessingAlgorithm"]

    /**
     * @type {Integer} 
     */
    VideoProcessingAlgorithm {
        get => this.get_VideoProcessingAlgorithm()
        set => this.put_VideoProcessingAlgorithm(value)
    }

    /**
     * 
     * @param {IMediaSource} source 
     * @param {IRandomAccessStream} destination 
     * @param {MediaEncodingProfile} profile_ 
     * @returns {IAsyncOperation<PrepareTranscodeResult>} 
     */
    PrepareMediaStreamSourceTranscodeAsync(source, destination, profile_) {
        result := ComCall(6, this, "ptr", source, "ptr", destination, "ptr", profile_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PrepareTranscodeResult, operation)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VideoProcessingAlgorithm(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoProcessingAlgorithm() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
