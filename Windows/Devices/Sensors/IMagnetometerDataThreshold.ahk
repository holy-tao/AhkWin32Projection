#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IMagnetometerDataThreshold extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMagnetometerDataThreshold
     * @type {Guid}
     */
    static IID => Guid("{d177cb01-9063-5fa5-b596-b445e9dc3401}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_XAxisMicroteslas", "put_XAxisMicroteslas", "get_YAxisMicroteslas", "put_YAxisMicroteslas", "get_ZAxisMicroteslas", "put_ZAxisMicroteslas"]

    /**
     * @type {Float} 
     */
    XAxisMicroteslas {
        get => this.get_XAxisMicroteslas()
        set => this.put_XAxisMicroteslas(value)
    }

    /**
     * @type {Float} 
     */
    YAxisMicroteslas {
        get => this.get_YAxisMicroteslas()
        set => this.put_YAxisMicroteslas(value)
    }

    /**
     * @type {Float} 
     */
    ZAxisMicroteslas {
        get => this.get_ZAxisMicroteslas()
        set => this.put_ZAxisMicroteslas(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_XAxisMicroteslas() {
        result := ComCall(6, this, "float*", &value := 0, "int")
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
    put_XAxisMicroteslas(value) {
        result := ComCall(7, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_YAxisMicroteslas() {
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
    put_YAxisMicroteslas(value) {
        result := ComCall(9, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ZAxisMicroteslas() {
        result := ComCall(10, this, "float*", &value := 0, "int")
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
    put_ZAxisMicroteslas(value) {
        result := ComCall(11, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
