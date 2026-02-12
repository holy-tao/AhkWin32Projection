#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class IPrintTaskTargetDeviceSupport extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintTaskTargetDeviceSupport
     * @type {Guid}
     */
    static IID => Guid("{295d70c0-c2cb-4b7d-b0ea-93095091a220}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_IsPrinterTargetEnabled", "get_IsPrinterTargetEnabled", "put_Is3DManufacturingTargetEnabled", "get_Is3DManufacturingTargetEnabled"]

    /**
     * @type {Boolean} 
     */
    IsPrinterTargetEnabled {
        get => this.get_IsPrinterTargetEnabled()
        set => this.put_IsPrinterTargetEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    Is3DManufacturingTargetEnabled {
        get => this.get_Is3DManufacturingTargetEnabled()
        set => this.put_Is3DManufacturingTargetEnabled(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPrinterTargetEnabled(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPrinterTargetEnabled() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Is3DManufacturingTargetEnabled(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Is3DManufacturingTargetEnabled() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
