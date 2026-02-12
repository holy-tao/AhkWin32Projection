#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines the implementation for a type that generates [InkPresenterRuler](inkpresenterruler.md) objects used in the construction of an [InkPresenter](inkpresenter.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.iinkpresenterrulerfactory
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkPresenterRuler extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkPresenterRuler
     * @type {Guid}
     */
    static IID => Guid("{6cda7d5a-dec7-4dd7-877a-2133f183d48a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Length", "put_Length", "get_Width", "put_Width"]

    /**
     * @type {Float} 
     */
    Length {
        get => this.get_Length()
        set => this.put_Length(value)
    }

    /**
     * @type {Float} 
     */
    Width {
        get => this.get_Width()
        set => this.put_Width(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Length() {
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
    put_Length(value) {
        result := ComCall(7, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Width() {
        result := ComCall(8, this, "double*", &value := 0, "int")
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
    put_Width(value) {
        result := ComCall(9, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
