#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\MediaProperties\MediaRatio.ahk
#Include .\FrameControlCapabilities.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include .\FrameController.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class IVariablePhotoSequenceController extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVariablePhotoSequenceController
     * @type {Guid}
     */
    static IID => Guid("{7fbff880-ed8c-43fd-a7c3-b35809e4229a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Supported", "get_MaxPhotosPerSecond", "get_PhotosPerSecondLimit", "put_PhotosPerSecondLimit", "GetHighestConcurrentFrameRate", "GetCurrentFrameRate", "get_FrameCapabilities", "get_DesiredFrameControllers"]

    /**
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * @type {Float} 
     */
    MaxPhotosPerSecond {
        get => this.get_MaxPhotosPerSecond()
    }

    /**
     * @type {Float} 
     */
    PhotosPerSecondLimit {
        get => this.get_PhotosPerSecondLimit()
        set => this.put_PhotosPerSecondLimit(value)
    }

    /**
     * @type {FrameControlCapabilities} 
     */
    FrameCapabilities {
        get => this.get_FrameCapabilities()
    }

    /**
     * @type {IVector<FrameController>} 
     */
    DesiredFrameControllers {
        get => this.get_DesiredFrameControllers()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Supported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxPhotosPerSecond() {
        result := ComCall(7, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PhotosPerSecondLimit() {
        result := ComCall(8, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_PhotosPerSecondLimit(value) {
        result := ComCall(9, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IMediaEncodingProperties} captureProperties 
     * @returns {MediaRatio} 
     */
    GetHighestConcurrentFrameRate(captureProperties) {
        result := ComCall(10, this, "ptr", captureProperties, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaRatio(value)
    }

    /**
     * 
     * @returns {MediaRatio} 
     */
    GetCurrentFrameRate() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaRatio(value)
    }

    /**
     * 
     * @returns {FrameControlCapabilities} 
     */
    get_FrameCapabilities() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FrameControlCapabilities(value)
    }

    /**
     * 
     * @returns {IVector<FrameController>} 
     */
    get_DesiredFrameControllers() {
        result := ComCall(13, this, "ptr*", &items := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(FrameController, items)
    }
}
