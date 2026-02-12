#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IAdaptiveTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdaptiveTrigger
     * @type {Guid}
     */
    static IID => Guid("{a5f04119-0cd9-49f1-a23f-44e547ab9f1a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MinWindowWidth", "put_MinWindowWidth", "get_MinWindowHeight", "put_MinWindowHeight"]

    /**
     * @type {Float} 
     */
    MinWindowWidth {
        get => this.get_MinWindowWidth()
        set => this.put_MinWindowWidth(value)
    }

    /**
     * @type {Float} 
     */
    MinWindowHeight {
        get => this.get_MinWindowHeight()
        set => this.put_MinWindowHeight(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinWindowWidth() {
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
    put_MinWindowWidth(value) {
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
    get_MinWindowHeight() {
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
    put_MinWindowHeight(value) {
        result := ComCall(9, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
