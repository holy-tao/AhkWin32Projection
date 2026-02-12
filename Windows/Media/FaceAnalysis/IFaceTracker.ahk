#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\DetectedFace.ahk
#Include ..\..\Graphics\Imaging\BitmapSize.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.FaceAnalysis
 * @version WindowsRuntime 1.4
 */
class IFaceTracker extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaceTracker
     * @type {Guid}
     */
    static IID => Guid("{6ba67d8c-a841-4420-93e6-2420a1884fcf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ProcessNextFrameAsync", "get_MinDetectableFaceSize", "put_MinDetectableFaceSize", "get_MaxDetectableFaceSize", "put_MaxDetectableFaceSize"]

    /**
     * @type {BitmapSize} 
     */
    MinDetectableFaceSize {
        get => this.get_MinDetectableFaceSize()
        set => this.put_MinDetectableFaceSize(value)
    }

    /**
     * @type {BitmapSize} 
     */
    MaxDetectableFaceSize {
        get => this.get_MaxDetectableFaceSize()
        set => this.put_MaxDetectableFaceSize(value)
    }

    /**
     * 
     * @param {VideoFrame} videoFrame_ 
     * @returns {IAsyncOperation<IVector<DetectedFace>>} 
     */
    ProcessNextFrameAsync(videoFrame_) {
        result := ComCall(6, this, "ptr", videoFrame_, "ptr*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVector.Call.Bind(IVector, DetectedFace), returnValue)
    }

    /**
     * 
     * @returns {BitmapSize} 
     */
    get_MinDetectableFaceSize() {
        returnValue := BitmapSize()
        result := ComCall(7, this, "ptr", returnValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }

    /**
     * 
     * @param {BitmapSize} value 
     * @returns {HRESULT} 
     */
    put_MinDetectableFaceSize(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BitmapSize} 
     */
    get_MaxDetectableFaceSize() {
        returnValue := BitmapSize()
        result := ComCall(9, this, "ptr", returnValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }

    /**
     * 
     * @param {BitmapSize} value 
     * @returns {HRESULT} 
     */
    put_MaxDetectableFaceSize(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
