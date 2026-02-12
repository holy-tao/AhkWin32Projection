#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncActionWithProgress.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Transcoding
 * @version WindowsRuntime 1.4
 */
class IPrepareTranscodeResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrepareTranscodeResult
     * @type {Guid}
     */
    static IID => Guid("{05f25dce-994f-4a34-9d68-97ccce1730d6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanTranscode", "get_FailureReason", "TranscodeAsync"]

    /**
     * @type {Boolean} 
     */
    CanTranscode {
        get => this.get_CanTranscode()
    }

    /**
     * @type {Integer} 
     */
    FailureReason {
        get => this.get_FailureReason()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanTranscode() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FailureReason() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncActionWithProgress<Float>} 
     */
    TranscodeAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncActionWithProgress((ptr) => IPropertyValue(ptr).GetDouble(), operation)
    }
}
