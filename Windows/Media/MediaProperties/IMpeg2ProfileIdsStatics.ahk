#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class IMpeg2ProfileIdsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMpeg2ProfileIdsStatics
     * @type {Guid}
     */
    static IID => Guid("{a461ff85-e57a-4128-9b21-d5331b04235c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Simple", "get_Main", "get_SignalNoiseRatioScalable", "get_SpatiallyScalable", "get_High"]

    /**
     * @type {Integer} 
     */
    Simple {
        get => this.get_Simple()
    }

    /**
     * @type {Integer} 
     */
    Main {
        get => this.get_Main()
    }

    /**
     * @type {Integer} 
     */
    SignalNoiseRatioScalable {
        get => this.get_SignalNoiseRatioScalable()
    }

    /**
     * @type {Integer} 
     */
    SpatiallyScalable {
        get => this.get_SpatiallyScalable()
    }

    /**
     * @type {Integer} 
     */
    High {
        get => this.get_High()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Simple() {
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
    get_Main() {
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
    get_SignalNoiseRatioScalable() {
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
    get_SpatiallyScalable() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_High() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
