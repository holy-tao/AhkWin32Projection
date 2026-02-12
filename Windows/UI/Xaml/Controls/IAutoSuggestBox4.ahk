#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IAutoSuggestBox4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutoSuggestBox4
     * @type {Guid}
     */
    static IID => Guid("{c22df897-a3e8-5051-b3cc-b5f0f5262950}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Description", "put_Description"]

    /**
     * @type {IInspectable} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Description() {
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
    put_Description(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
