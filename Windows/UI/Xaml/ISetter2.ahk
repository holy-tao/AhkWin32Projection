#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TargetPropertyPath.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ISetter2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISetter2
     * @type {Guid}
     */
    static IID => Guid("{70169561-05b1-4fa3-9d53-8e0c8c747afc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Target", "put_Target"]

    /**
     * @type {TargetPropertyPath} 
     */
    Target {
        get => this.get_Target()
        set => this.put_Target(value)
    }

    /**
     * 
     * @returns {TargetPropertyPath} 
     */
    get_Target() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TargetPropertyPath(value)
    }

    /**
     * 
     * @param {TargetPropertyPath} value 
     * @returns {HRESULT} 
     */
    put_Target(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
