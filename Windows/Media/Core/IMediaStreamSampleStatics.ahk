#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaStreamSample.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMediaStreamSampleStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaStreamSampleStatics
     * @type {Guid}
     */
    static IID => Guid("{dfdf218f-a6cf-4579-be41-73dd941ad972}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromBuffer", "CreateFromStreamAsync"]

    /**
     * 
     * @param {IBuffer} buffer_ 
     * @param {TimeSpan} timestamp_ 
     * @returns {MediaStreamSample} 
     */
    CreateFromBuffer(buffer_, timestamp_) {
        result := ComCall(6, this, "ptr", buffer_, "ptr", timestamp_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaStreamSample(value)
    }

    /**
     * 
     * @param {IInputStream} stream 
     * @param {Integer} count 
     * @param {TimeSpan} timestamp_ 
     * @returns {IAsyncOperation<MediaStreamSample>} 
     */
    CreateFromStreamAsync(stream, count, timestamp_) {
        result := ComCall(7, this, "ptr", stream, "uint", count, "ptr", timestamp_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MediaStreamSample, value)
    }
}
