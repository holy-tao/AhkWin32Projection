#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use the ISdo interface to store, retrieve, and update Server Data Objects (SDO) information.
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/nn-sdoias-isdo
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
     * @param {Integer} Id Specifies the ID of an existing property.
     * @returns {IUnknown} Pointer to a pointer that receives the address of an <b>ISdoPropertyInfo</b> interface for the specified property.
     * @see https://docs.microsoft.com/windows/win32/api//sdoias/nf-sdoias-isdo-getpropertyinfo
     */
    GetPropertyInfo(Id) {
        result := ComCall(7, this, "int", Id, "ptr*", &ppPropertyInfo := 0, "HRESULT")
        return IUnknown(ppPropertyInfo)
    }

    /**
     * The GetProperty method retrieves the value of the specified property.
     * @param {Integer} Id Specifies the ID of an existing property.
     * @returns {VARIANT} Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> that contains the value of the property.
     * @see https://docs.microsoft.com/windows/win32/api//sdoias/nf-sdoias-isdo-getproperty
     */
    GetProperty(Id) {
        pValue := VARIANT()
        result := ComCall(8, this, "int", Id, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * The PutProperty method sets the value of the specified property.
     * @param {Integer} Id Specifies the ID of an existing property.
     * @param {Pointer<VARIANT>} pValue Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> that contains the value for that property.
     * @returns {HRESULT} If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//sdoias/nf-sdoias-isdo-putproperty
     */
    PutProperty(Id, pValue) {
        result := ComCall(9, this, "int", Id, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * The ResetProperty method resets the specified property to its default value.
     * @param {Integer} Id Specifies the ID of an existing property.
     * @returns {HRESULT} If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//sdoias/nf-sdoias-isdo-resetproperty
     */
    ResetProperty(Id) {
        result := ComCall(10, this, "int", Id, "HRESULT")
        return result
    }

    /**
     * The Apply method writes to persistent storage the changes made by calls to the ISdo::PutProperty method.
     * @returns {HRESULT} If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//sdoias/nf-sdoias-isdo-apply
     */
    Apply() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * The Restore method reloads the values of the Server Data Objects (SDO) properties from persistent storage.
     * @returns {HRESULT} If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//sdoias/nf-sdoias-isdo-restore
     */
    Restore() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * The get__NewEnum method retrieves an IEnumVARIANT interface for the Server Data Objects (SDO) properties.
     * @returns {IUnknown} Pointer to a pointer that, on successful return, points to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface pointer. Use this <b>IUnknown</b> interface pointer with 
     * its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method to obtain an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//sdoias/nf-sdoias-isdo-get__newenum
     */
    get__NewEnum() {
        result := ComCall(13, this, "ptr*", &ppEnumVARIANT := 0, "HRESULT")
        return IUnknown(ppEnumVARIANT)
    }
}
