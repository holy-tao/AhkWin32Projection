#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\Transform.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IBrush extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBrush
     * @type {Guid}
     */
    static IID => Guid("{8806a321-1e06-422c-a1cc-01696559e021}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Opacity", "put_Opacity", "get_Transform", "put_Transform", "get_RelativeTransform", "put_RelativeTransform"]

    /**
     * @type {Float} 
     */
    Opacity {
        get => this.get_Opacity()
        set => this.put_Opacity(value)
    }

    /**
     * @type {Transform} 
     */
    Transform {
        get => this.get_Transform()
        set => this.put_Transform(value)
    }

    /**
     * @type {Transform} 
     */
    RelativeTransform {
        get => this.get_RelativeTransform()
        set => this.put_RelativeTransform(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Opacity() {
        result := ComCall(6, this, "double*", &value := 0, "int")
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
    put_Opacity(value) {
        result := ComCall(7, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Transform} 
     */
    get_Transform() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Transform(value)
    }

    /**
     * 
     * @param {Transform} value 
     * @returns {HRESULT} 
     */
    put_Transform(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Transform} 
     */
    get_RelativeTransform() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Transform(value)
    }

    /**
     * 
     * @param {Transform} value 
     * @returns {HRESULT} 
     */
    put_RelativeTransform(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
