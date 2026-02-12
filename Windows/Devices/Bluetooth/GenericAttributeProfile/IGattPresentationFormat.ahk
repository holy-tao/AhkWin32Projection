#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattPresentationFormat extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattPresentationFormat
     * @type {Guid}
     */
    static IID => Guid("{196d0021-faad-45dc-ae5b-2ac3184e84db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FormatType", "get_Exponent", "get_Unit", "get_Namespace", "get_Description"]

    /**
     * @type {Integer} 
     */
    FormatType {
        get => this.get_FormatType()
    }

    /**
     * @type {Integer} 
     */
    Exponent {
        get => this.get_Exponent()
    }

    /**
     * @type {Integer} 
     */
    Unit {
        get => this.get_Unit()
    }

    /**
     * @type {Integer} 
     */
    Namespace {
        get => this.get_Namespace()
    }

    /**
     * @type {Integer} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FormatType() {
        result := ComCall(6, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Exponent() {
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
    get_Unit() {
        result := ComCall(8, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Namespace() {
        result := ComCall(9, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Description() {
        result := ComCall(10, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
