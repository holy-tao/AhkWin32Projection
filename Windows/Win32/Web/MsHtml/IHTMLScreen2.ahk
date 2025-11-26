#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLScreen2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLScreen2
     * @type {Guid}
     */
    static IID => Guid("{3050f84a-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_logicalXDPI", "get_logicalYDPI", "get_deviceXDPI", "get_deviceYDPI"]

    /**
     * @type {Integer} 
     */
    logicalXDPI {
        get => this.get_logicalXDPI()
    }

    /**
     * @type {Integer} 
     */
    logicalYDPI {
        get => this.get_logicalYDPI()
    }

    /**
     * @type {Integer} 
     */
    deviceXDPI {
        get => this.get_deviceXDPI()
    }

    /**
     * @type {Integer} 
     */
    deviceYDPI {
        get => this.get_deviceYDPI()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_logicalXDPI() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_logicalYDPI() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_deviceXDPI() {
        result := ComCall(9, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_deviceYDPI() {
        result := ComCall(10, this, "int*", &p := 0, "HRESULT")
        return p
    }
}
