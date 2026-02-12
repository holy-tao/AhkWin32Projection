#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class IPerceptionVideoProfile extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionVideoProfile
     * @type {Guid}
     */
    static IID => Guid("{75763ea3-011a-470e-8225-6f05ade25648}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BitmapPixelFormat", "get_BitmapAlphaMode", "get_Width", "get_Height", "get_FrameDuration", "IsEqual"]

    /**
     * @type {Integer} 
     */
    BitmapPixelFormat {
        get => this.get_BitmapPixelFormat()
    }

    /**
     * @type {Integer} 
     */
    BitmapAlphaMode {
        get => this.get_BitmapAlphaMode()
    }

    /**
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
    }

    /**
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * @type {TimeSpan} 
     */
    FrameDuration {
        get => this.get_FrameDuration()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BitmapPixelFormat() {
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
    get_BitmapAlphaMode() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Height() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_FrameDuration() {
        value := TimeSpan()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Evaluates to a Boolean value that indicates whether two CLSIDs are equal.
     * @param {PerceptionVideoProfile} other 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/guiddef/nf-guiddef-isequalclsid
     */
    IsEqual(other) {
        result := ComCall(11, this, "ptr", other, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
