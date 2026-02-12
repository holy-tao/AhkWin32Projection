#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use the ISdo interface to store, retrieve, and update Server Data Objects (SDO) information.
 * @see https://learn.microsoft.com/windows/win32/api//content/sdoias/nn-sdoias-isdo
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class ISdo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISdo
     * @type {Guid}
     */
    static IID => Guid("{56bc53de-96db-11d1-bf3f-000000000000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropertyInfo", "GetProperty", "PutProperty", "ResetProperty", "Apply", "Restore", "get__NewEnum"]

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * The GetPropertyInfo method retrieves a pointer to an ISdoPropertyInfo interface for the specified property.
     * @remarks
     * Although Server Data Objects (SDO) exposes this method, you do not need it in order to use SDO.
     * @param {Integer} Id Specifies the ID of an existing property.
     * @returns {IUnknown} Pointer to a pointer that receives the address of an <b>ISdoPropertyInfo</b> interface for the specified property.
     * @see https://learn.microsoft.com/windows/win32/api//content/sdoias/nf-sdoias-isdo-getpropertyinfo
     */
    GetPropertyInfo(Id) {
        result := ComCall(7, this, "int", Id, "ptr*", &ppPropertyInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppPropertyInfo)
    }

    /**
     * The GetProperty method retrieves the value of the specified property.
     * @param {Integer} Id Specifies the ID of an existing property.
     * @returns {VARIANT} Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> that contains the value of the property.
     * @see https://learn.microsoft.com/windows/win32/api//content/sdoias/nf-sdoias-isdo-getproperty
     */
    GetProperty(Id) {
        pValue := VARIANT()
        result := ComCall(8, this, "int", Id, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * The PutProperty method sets the value of the specified property.
     * @remarks
     * After you have set values using <b>ISdo::PutProperty</b>, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/nf-sdoias-isdo-apply">ISdo::Apply</a> to write the changes to persistent storage.
     * 
     * The method fails if the property is READ_ONLY or if the value is invalid.
     * @param {Integer} Id Specifies the ID of an existing property.
     * @param {Pointer<VARIANT>} pValue Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> that contains the value for that property.
     * @returns {HRESULT} If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/sdoias/nf-sdoias-isdo-putproperty
     */
    PutProperty(Id, pValue) {
        result := ComCall(9, this, "int", Id, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The ResetProperty method resets the specified property to its default value.
     * @remarks
     * Very few IAS properties have default values. If you reset a property that does not have a default value, <b>E_INVALIDARG</b> is returned. In Visual Basic, an error similar to the following is returned: "Function call is invalid".
     * 
     * <div class="alert"><b>Note</b>  Internet Authentication Service (IAS) was renamed Network Policy Server (NPS) starting with Windows Server 2008.</div>
     * <div> </div>
     * @param {Integer} Id Specifies the ID of an existing property.
     * @returns {HRESULT} If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/sdoias/nf-sdoias-isdo-resetproperty
     */
    ResetProperty(Id) {
        result := ComCall(10, this, "int", Id, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Apply method writes to persistent storage the changes made by calls to the ISdo::PutProperty method.
     * @remarks
     * To cancel changes made by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/nf-sdoias-isdo-putproperty">ISdo::PutProperty</a>, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/nf-sdoias-isdo-restore">ISdo::Restore</a>.
     * @returns {HRESULT} If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/sdoias/nf-sdoias-isdo-apply
     */
    Apply() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Restore method reloads the values of the Server Data Objects (SDO) properties from persistent storage.
     * @remarks
     * Use the 
     * <b>Restore</b> method to cancel changes made by calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/nf-sdoias-isdo-putproperty">ISdo::PutProperty</a> method.
     * @returns {HRESULT} If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/sdoias/nf-sdoias-isdo-restore
     */
    Restore() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get__NewEnum method retrieves an IEnumVARIANT interface for the Server Data Objects (SDO) properties.
     * @remarks
     * <div class="alert"><b>Note</b>  Two underscores are used between "get" and "NewEnum" in the name of this method.</div>
     * <div> </div>
     * @returns {IUnknown} Pointer to a pointer that, on successful return, points to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface pointer. Use this <b>IUnknown</b> interface pointer with 
     * its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method to obtain an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/sdoias/nf-sdoias-isdo-get__newenum
     */
    get__NewEnum() {
        result := ComCall(13, this, "ptr*", &ppEnumVARIANT := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppEnumVARIANT)
    }
}
