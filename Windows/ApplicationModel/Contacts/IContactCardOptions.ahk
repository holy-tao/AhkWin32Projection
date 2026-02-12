#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactCardOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactCardOptions
     * @type {Guid}
     */
    static IID => Guid("{8c0a4f7e-6ab6-4f3f-be72-817236eeea5b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HeaderKind", "put_HeaderKind", "get_InitialTabKind", "put_InitialTabKind"]

    /**
     * @type {Integer} 
     */
    HeaderKind {
        get => this.get_HeaderKind()
        set => this.put_HeaderKind(value)
    }

    /**
     * @type {Integer} 
     */
    InitialTabKind {
        get => this.get_InitialTabKind()
        set => this.put_InitialTabKind(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HeaderKind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HeaderKind(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InitialTabKind() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_InitialTabKind(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
