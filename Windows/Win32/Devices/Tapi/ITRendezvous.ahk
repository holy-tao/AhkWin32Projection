#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ITDirectory.ahk" { ITDirectory }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ITDirectoryObject.ahk" { ITDirectoryObject }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DIRECTORY_OBJECT_TYPE.ahk" { DIRECTORY_OBJECT_TYPE }
#Import ".\IEnumDirectory.ahk" { IEnumDirectory }
#Import ".\DIRECTORY_TYPE.ahk" { DIRECTORY_TYPE }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The ITRendezvous interface is the main interface for the Rendezvous control. An application calls the COM CoCreateInstance function on this interface to create the Rendezvous object.
 * @see https://learn.microsoft.com/windows/win32/api/rend/nn-rend-itrendezvous
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITRendezvous extends IDispatch {
    /**
     * The interface identifier for ITRendezvous
     * @type {Guid}
     */
    static IID := Guid("{34621d6b-6cff-11d1-aff7-00c04fc31fee}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITRendezvous interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_DefaultDirectories      : IntPtr
        EnumerateDefaultDirectories : IntPtr
        CreateDirectory             : IntPtr
        CreateDirectoryObject       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITRendezvous.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    DefaultDirectories {
        get => this.get_DefaultDirectories()
    }

    /**
     * The get_DefaultDirectories method enumerates all configured default directories. This method is similar to EnumerateDefaultDirectories but is provided for use by Visual Basic and other scripting languages.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-itdirectory">ITDirectory</a> interface returned by <b>ITRendezvous::get_DefaultDirectories</b>. The application must call <b>Release</b> on the 
     * <b>ITDirectory</b> interface to free resources associated with it.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> that will receive an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-itdirectory">ITDirectory</a> interface pointers.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itrendezvous-get_defaultdirectories
     */
    get_DefaultDirectories() {
        pVariant := VARIANT()
        result := ComCall(7, this, VARIANT.Ptr, pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The EnumerateDefaultDirectories method enumerates all configured default directories. This method is similar to get_DefaultDirectories but is designed for C/C++.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-ienumdirectory">IEnumDirectory</a> interface returned by <b>ITRendezvous::EnumerateDefaultDirectories</b>. The application must call <b>Release</b> on the 
     * <b>IEnumDirectory</b> interface to free resources associated with it.
     * @returns {IEnumDirectory} Pointer to receive 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-ienumdirectory">IEnumDirectory</a> enumerator listing default directories.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itrendezvous-enumeratedefaultdirectories
     */
    EnumerateDefaultDirectories() {
        result := ComCall(8, this, "ptr*", &ppEnumDirectory := 0, "HRESULT")
        return IEnumDirectory(ppEnumDirectory)
    }

    /**
     * The CreateDirectory method creates an ITDirectory object corresponding to a directory of the given type and name.
     * @remarks
     * For directories of type DT_NTDS, <i>pName</i> is ignored because Rendezvous supports using only the local domain controller (DC).
     * 
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> to allocate memory for the <i>pName</i> parameter and use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory when the variable is no longer needed.
     * 
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-itdirectory">ITDirectory</a> interface returned by <b>ITRendezvous::CreateDirectory</b>. The application must call <b>Release</b> on the 
     * <b>ITDirectory</b> interface to free resources associated with it.
     * 
     * This function may send data over the wire in unencrypted form; therefore, someone eavesdropping on the network may be able to read the data. The security risk of sending the data in clear text should be considered before using this method.
     * @param {DIRECTORY_TYPE} DirectoryType The type of the directory. See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/ne-rend-directory_type">DIRECTORY_TYPE</a>.
     * @param {BSTR} pName Pointer to a <b>BSTR</b> containing the name of the directory to be created.
     * @returns {ITDirectory} Pointer to receive an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-itdirectory">ITDirectory</a> object of the type specified above.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itrendezvous-createdirectory
     */
    CreateDirectory(DirectoryType, pName) {
        pName := pName is String ? BSTR.Alloc(pName).Value : pName

        result := ComCall(9, this, DIRECTORY_TYPE, DirectoryType, BSTR, pName, "ptr*", &ppDir := 0, "HRESULT")
        return ITDirectory(ppDir)
    }

    /**
     * The CreateDirectoryObject method creates a new ITDirectoryObject object.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> to allocate memory for the <i>pName</i> parameter and use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory when the variable is no longer needed.
     * 
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-itdirectoryobject">ITDirectoryObject</a> interface returned by <b>ITRendezvous::CreateDirectoryObject</b>. The application must call <b>Release</b> on the 
     * <b>ITDirectoryObject</b> interface to free resources associated with it.
     * 
     * This function may send data over the wire in unencrypted form; therefore, someone eavesdropping on the network may be able to read the data. The security risk of sending the data in clear text should be considered before using this method.
     * @param {DIRECTORY_OBJECT_TYPE} DirectoryObjectType The type of the object. See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/ne-rend-directory_object_type">DIRECTORY_OBJECT_TYPE</a>.
     * @param {BSTR} pName Pointer to a <b>BSTR</b> containing the name of the object.
     * @returns {ITDirectoryObject} Pointer to receive the interface pointer for the newly created 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-itdirectoryobject">ITDirectoryObject</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itrendezvous-createdirectoryobject
     */
    CreateDirectoryObject(DirectoryObjectType, pName) {
        pName := pName is String ? BSTR.Alloc(pName).Value : pName

        result := ComCall(10, this, DIRECTORY_OBJECT_TYPE, DirectoryObjectType, BSTR, pName, "ptr*", &ppDirectoryObject := 0, "HRESULT")
        return ITDirectoryObject(ppDirectoryObject)
    }

    Query(iid) {
        if (ITRendezvous.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DefaultDirectories := CallbackCreate(GetMethod(implObj, "get_DefaultDirectories"), flags, 2)
        this.vtbl.EnumerateDefaultDirectories := CallbackCreate(GetMethod(implObj, "EnumerateDefaultDirectories"), flags, 2)
        this.vtbl.CreateDirectory := CallbackCreate(GetMethod(implObj, "CreateDirectory"), flags, 4)
        this.vtbl.CreateDirectoryObject := CallbackCreate(GetMethod(implObj, "CreateDirectoryObject"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DefaultDirectories)
        CallbackFree(this.vtbl.EnumerateDefaultDirectories)
        CallbackFree(this.vtbl.CreateDirectory)
        CallbackFree(this.vtbl.CreateDirectoryObject)
    }
}
