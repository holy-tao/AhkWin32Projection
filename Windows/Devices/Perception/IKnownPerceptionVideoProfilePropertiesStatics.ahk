#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class IKnownPerceptionVideoProfilePropertiesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownPerceptionVideoProfilePropertiesStatics
     * @type {Guid}
     */
    static IID => Guid("{8f08e2e7-5a76-43e3-a13a-da3d91a9ef98}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BitmapPixelFormat", "get_BitmapAlphaMode", "get_Width", "get_Height", "get_FrameDuration"]

    /**
     * @type {HSTRING} 
     */
    BitmapPixelFormat {
        get => this.get_BitmapPixelFormat()
    }

    /**
     * @type {HSTRING} 
     */
    BitmapAlphaMode {
        get => this.get_BitmapAlphaMode()
    }

    /**
     * @type {HSTRING} 
     */
    Width {
        get => this.get_Width()
    }

    /**
     * @type {HSTRING} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * @type {HSTRING} 
     */
    FrameDuration {
        get => this.get_FrameDuration()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_BitmapPixelFormat() {
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
    get_BitmapAlphaMode() {
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
    get_Width() {
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
    get_Height() {
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
    get_FrameDuration() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
