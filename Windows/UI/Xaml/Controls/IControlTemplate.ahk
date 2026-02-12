#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Interop\TypeName.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IControlTemplate extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IControlTemplate
     * @type {Guid}
     */
    static IID => Guid("{efd2418e-41e0-48bb-8b82-91eda1ba3fe2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TargetType", "put_TargetType"]

    /**
     * @type {TypeName} 
     */
    TargetType {
        get => this.get_TargetType()
        set => this.put_TargetType(value)
    }

    /**
     * 
     * @returns {TypeName} 
     */
    get_TargetType() {
        value := TypeName()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypeName} value 
     * @returns {HRESULT} 
     */
    put_TargetType(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
