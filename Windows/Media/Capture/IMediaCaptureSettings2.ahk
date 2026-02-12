#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IMediaCaptureSettings2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaCaptureSettings2
     * @type {Guid}
     */
    static IID => Guid("{6f9e7cfb-fa9f-4b13-9cbe-5ab94f1f3493}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ConcurrentRecordAndPhotoSupported", "get_ConcurrentRecordAndPhotoSequenceSupported", "get_CameraSoundRequiredForRegion", "get_Horizontal35mmEquivalentFocalLength", "get_PitchOffsetDegrees", "get_Vertical35mmEquivalentFocalLength", "get_MediaCategory", "get_AudioProcessing"]

    /**
     * @type {Boolean} 
     */
    ConcurrentRecordAndPhotoSupported {
        get => this.get_ConcurrentRecordAndPhotoSupported()
    }

    /**
     * @type {Boolean} 
     */
    ConcurrentRecordAndPhotoSequenceSupported {
        get => this.get_ConcurrentRecordAndPhotoSequenceSupported()
    }

    /**
     * @type {Boolean} 
     */
    CameraSoundRequiredForRegion {
        get => this.get_CameraSoundRequiredForRegion()
    }

    /**
     * @type {IReference<Integer>} 
     */
    Horizontal35mmEquivalentFocalLength {
        get => this.get_Horizontal35mmEquivalentFocalLength()
    }

    /**
     * @type {IReference<Integer>} 
     */
    PitchOffsetDegrees {
        get => this.get_PitchOffsetDegrees()
    }

    /**
     * @type {IReference<Integer>} 
     */
    Vertical35mmEquivalentFocalLength {
        get => this.get_Vertical35mmEquivalentFocalLength()
    }

    /**
     * @type {Integer} 
     */
    MediaCategory {
        get => this.get_MediaCategory()
    }

    /**
     * @type {Integer} 
     */
    AudioProcessing {
        get => this.get_AudioProcessing()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ConcurrentRecordAndPhotoSupported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ConcurrentRecordAndPhotoSequenceSupported() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CameraSoundRequiredForRegion() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Horizontal35mmEquivalentFocalLength() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PitchOffsetDegrees() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Vertical35mmEquivalentFocalLength() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MediaCategory() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioProcessing() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
