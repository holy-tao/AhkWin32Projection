#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrinterScriptablePropertyBag.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterScriptContext extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinterScriptContext
     * @type {Guid}
     */
    static IID => Guid("{066acbca-8881-49c9-bb98-fae16b4889e1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DriverProperties", "get_QueueProperties", "get_UserProperties"]

    /**
     * @type {IPrinterScriptablePropertyBag} 
     */
    DriverProperties {
        get => this.get_DriverProperties()
    }

    /**
     * @type {IPrinterScriptablePropertyBag} 
     */
    QueueProperties {
        get => this.get_QueueProperties()
    }

    /**
     * @type {IPrinterScriptablePropertyBag} 
     */
    UserProperties {
        get => this.get_UserProperties()
    }

    /**
     * 
     * @returns {IPrinterScriptablePropertyBag} 
     */
    get_DriverProperties() {
        result := ComCall(7, this, "ptr*", &ppPropertyBag := 0, "HRESULT")
        return IPrinterScriptablePropertyBag(ppPropertyBag)
    }

    /**
     * 
     * @returns {IPrinterScriptablePropertyBag} 
     */
    get_QueueProperties() {
        result := ComCall(8, this, "ptr*", &ppPropertyBag := 0, "HRESULT")
        return IPrinterScriptablePropertyBag(ppPropertyBag)
    }

    /**
     * 
     * @returns {IPrinterScriptablePropertyBag} 
     */
    get_UserProperties() {
        result := ComCall(9, this, "ptr*", &ppPropertyBag := 0, "HRESULT")
        return IPrinterScriptablePropertyBag(ppPropertyBag)
    }
}
