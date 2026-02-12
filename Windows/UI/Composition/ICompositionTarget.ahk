#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Visual.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionTarget extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionTarget
     * @type {Guid}
     */
    static IID => Guid("{a1bea8ba-d726-4663-8129-6b5e7927ffa6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Root", "put_Root"]

    /**
     * @type {Visual} 
     */
    Root {
        get => this.get_Root()
        set => this.put_Root(value)
    }

    /**
     * 
     * @returns {Visual} 
     */
    get_Root() {
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
    put_Root(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
