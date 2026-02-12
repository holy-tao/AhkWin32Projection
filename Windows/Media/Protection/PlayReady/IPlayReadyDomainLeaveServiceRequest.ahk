#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class IPlayReadyDomainLeaveServiceRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayReadyDomainLeaveServiceRequest
     * @type {Guid}
     */
    static IID => Guid("{062d58be-97ad-4917-aa03-46d4c252d464}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DomainAccountId", "put_DomainAccountId", "get_DomainServiceId", "put_DomainServiceId"]

    /**
     * @type {Guid} 
     */
    DomainAccountId {
        get => this.get_DomainAccountId()
        set => this.put_DomainAccountId(value)
    }

    /**
     * @type {Guid} 
     */
    DomainServiceId {
        get => this.get_DomainServiceId()
        set => this.put_DomainServiceId(value)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_DomainAccountId() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Guid} value 
     * @returns {HRESULT} 
     */
    put_DomainAccountId(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_DomainServiceId() {
        value := Guid()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Guid} value 
     * @returns {HRESULT} 
     */
    put_DomainServiceId(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
