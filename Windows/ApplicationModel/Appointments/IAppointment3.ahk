#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Appointments
 * @version WindowsRuntime 1.4
 */
class IAppointment3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointment3
     * @type {Guid}
     */
    static IID => Guid("{bfcc45a9-8961-4991-934b-c48768e5a96c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ChangeNumber", "get_RemoteChangeNumber", "put_RemoteChangeNumber", "get_DetailsKind", "put_DetailsKind"]

    /**
     * @type {Integer} 
     */
    ChangeNumber {
        get => this.get_ChangeNumber()
    }

    /**
     * @type {Integer} 
     */
    RemoteChangeNumber {
        get => this.get_RemoteChangeNumber()
        set => this.put_RemoteChangeNumber(value)
    }

    /**
     * @type {Integer} 
     */
    DetailsKind {
        get => this.get_DetailsKind()
        set => this.put_DetailsKind(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChangeNumber() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RemoteChangeNumber() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
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
    put_RemoteChangeNumber(value) {
        result := ComCall(8, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DetailsKind() {
        result := ComCall(9, this, "int*", &value := 0, "int")
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
    put_DetailsKind(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
