#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ICertSrvSetupKeyInformation.ahk" { ICertSrvSetupKeyInformation }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Defines functionality to populate and enumerate a collection of ICertSrvSetupKeyInformation objects.
 * @see https://learn.microsoft.com/windows/win32/api/casetup/nn-casetup-icertsrvsetupkeyinformationcollection
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct ICertSrvSetupKeyInformationCollection extends IDispatch {
    /**
     * The interface identifier for ICertSrvSetupKeyInformationCollection
     * @type {Guid}
     */
    static IID := Guid("{e65c8b00-e58f-41f9-a9ec-a28d7427c844}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertSrvSetupKeyInformationCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get__NewEnum : IntPtr
        get_Item     : IntPtr
        get_Count    : IntPtr
        Add          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertSrvSetupKeyInformationCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * Gets an enumerator for the information set.
     * @remarks
     * This property is provided for internal use by the <c>For Each</c> statement in Visual Basic Scripting Edition (VBScript) and C#. To enumerate the collection of properties with C++, use the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertsrvsetupkeyinformationcollection-get_count">Count</a> and <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertsrvsetupkeyinformationcollection-get_item">Item</a> properties defined by the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertsrvsetupkeyinformationcollection">ICertSrvSetupKeyInformationCollection</a> interface.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetupkeyinformationcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppVal := 0, "HRESULT")
        return IUnknown(ppVal)
    }

    /**
     * Gets an ICertSrvSetupKeyInformation object that is identified by index in the collection.
     * @param {Integer} Index 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetupkeyinformationcollection-get_item
     */
    get_Item(Index) {
        pVal := VARIANT()
        result := ComCall(8, this, "int", Index, VARIANT.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets the number of ICertSrvSetupKeyInformation objects in the collection.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetupkeyinformationcollection-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Adds an ICertSrvSetupKeyInformation object to the collection.
     * @param {ICertSrvSetupKeyInformation} pIKeyInformation A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertsrvsetupkeyinformation">ICertSrvSetupKeyInformation</a> object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetupkeyinformationcollection-add
     */
    Add(pIKeyInformation) {
        result := ComCall(10, this, "ptr", pIKeyInformation, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICertSrvSetupKeyInformationCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.Add)
    }
}
