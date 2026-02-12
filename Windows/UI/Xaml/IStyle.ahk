#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SetterBaseCollection.ahk
#Include Interop\TypeName.ahk
#Include .\Style.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides access to the visual styles associated with the content of a document.
 * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nn-uiautomationcore-istylesprovider
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IStyle extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStyle
     * @type {Guid}
     */
    static IID => Guid("{c4a9f225-9db7-4a7d-b6d1-f74edb9293c2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsSealed", "get_Setters", "get_TargetType", "put_TargetType", "get_BasedOn", "put_BasedOn", "Seal"]

    /**
     * @type {Boolean} 
     */
    IsSealed {
        get => this.get_IsSealed()
    }

    /**
     * @type {SetterBaseCollection} 
     */
    Setters {
        get => this.get_Setters()
    }

    /**
     * @type {TypeName} 
     */
    TargetType {
        get => this.get_TargetType()
        set => this.put_TargetType(value)
    }

    /**
     * @type {Style} 
     */
    BasedOn {
        get => this.get_BasedOn()
        set => this.put_BasedOn(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSealed() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SetterBaseCollection} 
     */
    get_Setters() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SetterBaseCollection(value)
    }

    /**
     * 
     * @returns {TypeName} 
     */
    get_TargetType() {
        value := TypeName()
        result := ComCall(8, this, "ptr", value, "int")
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
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Style} 
     */
    get_BasedOn() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Style(value)
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_BasedOn(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Seal() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
