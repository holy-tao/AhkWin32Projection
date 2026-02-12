#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Visual.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IRedirectVisual extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRedirectVisual
     * @type {Guid}
     */
    static IID => Guid("{8cc6e340-8b75-5422-b06f-09ffe9f8617e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Source", "put_Source"]

    /**
     * @type {Visual} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * 
     * @returns {Visual} 
     */
    get_Source() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Visual(value)
    }

    /**
     * 
     * @param {Visual} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
