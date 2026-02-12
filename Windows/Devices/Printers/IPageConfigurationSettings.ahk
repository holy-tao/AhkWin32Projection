#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IPageConfigurationSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPageConfigurationSettings
     * @type {Guid}
     */
    static IID => Guid("{b6fc1e02-5331-54ff-95a0-1fcb76bb97a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OrientationSource", "put_OrientationSource", "get_SizeSource", "put_SizeSource"]

    /**
     * @type {Integer} 
     */
    OrientationSource {
        get => this.get_OrientationSource()
        set => this.put_OrientationSource(value)
    }

    /**
     * @type {Integer} 
     */
    SizeSource {
        get => this.get_SizeSource()
        set => this.put_SizeSource(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OrientationSource() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_OrientationSource(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SizeSource() {
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
    put_SizeSource(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
