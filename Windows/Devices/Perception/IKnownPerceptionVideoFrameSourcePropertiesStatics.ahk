#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class IKnownPerceptionVideoFrameSourcePropertiesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownPerceptionVideoFrameSourcePropertiesStatics
     * @type {Guid}
     */
    static IID => Guid("{5df1cca2-01f8-4a87-b859-d5e5b7e1de48}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_VideoProfile", "get_SupportedVideoProfiles", "get_AvailableVideoProfiles", "get_IsMirrored", "get_CameraIntrinsics"]

    /**
     * @type {HSTRING} 
     */
    VideoProfile {
        get => this.get_VideoProfile()
    }

    /**
     * @type {HSTRING} 
     */
    SupportedVideoProfiles {
        get => this.get_SupportedVideoProfiles()
    }

    /**
     * @type {HSTRING} 
     */
    AvailableVideoProfiles {
        get => this.get_AvailableVideoProfiles()
    }

    /**
     * @type {HSTRING} 
     */
    IsMirrored {
        get => this.get_IsMirrored()
    }

    /**
     * @type {HSTRING} 
     */
    CameraIntrinsics {
        get => this.get_CameraIntrinsics()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_VideoProfile() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SupportedVideoProfiles() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AvailableVideoProfiles() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IsMirrored() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CameraIntrinsics() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
