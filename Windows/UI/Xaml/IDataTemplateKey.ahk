#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IDataTemplateKey extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataTemplateKey
     * @type {Guid}
     */
    static IID => Guid("{873b6c28-cceb-4b61-86fa-b2cec39cc2fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DataType", "put_DataType"]

    /**
     * @type {IInspectable} 
     */
    DataType {
        get => this.get_DataType()
        set => this.put_DataType(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_DataType() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_DataType(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
