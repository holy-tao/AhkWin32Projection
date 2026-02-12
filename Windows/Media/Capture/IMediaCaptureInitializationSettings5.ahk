#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include Frames\MediaFrameSourceGroup.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IMediaCaptureInitializationSettings5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaCaptureInitializationSettings5
     * @type {Guid}
     */
    static IID => Guid("{d5a2e3b8-2626-4e94-b7b3-5308a0f64b1a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourceGroup", "put_SourceGroup", "get_SharingMode", "put_SharingMode", "get_MemoryPreference", "put_MemoryPreference"]

    /**
     * @type {MediaFrameSourceGroup} 
     */
    SourceGroup {
        get => this.get_SourceGroup()
        set => this.put_SourceGroup(value)
    }

    /**
     * @type {Integer} 
     */
    SharingMode {
        get => this.get_SharingMode()
        set => this.put_SharingMode(value)
    }

    /**
     * @type {Integer} 
     */
    MemoryPreference {
        get => this.get_MemoryPreference()
        set => this.put_MemoryPreference(value)
    }

    /**
     * 
     * @returns {MediaFrameSourceGroup} 
     */
    get_SourceGroup() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaFrameSourceGroup(value)
    }

    /**
     * 
     * @param {MediaFrameSourceGroup} value 
     * @returns {HRESULT} 
     */
    put_SourceGroup(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SharingMode() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SharingMode(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MemoryPreference() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MemoryPreference(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
