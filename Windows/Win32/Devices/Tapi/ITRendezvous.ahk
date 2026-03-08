#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IEnumDirectory.ahk
#Include .\ITDirectory.ahk
#Include .\ITDirectoryObject.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITRendezvous interface is the main interface for the Rendezvous control. An application calls the COM CoCreateInstance function on this interface to create the Rendezvous object.
 * @see https://learn.microsoft.com/windows/win32/api/rend/nn-rend-itrendezvous
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITRendezvous extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITRendezvous
     * @type {Guid}
     */
    static IID => Guid("{34621d6b-6cff-11d1-aff7-00c04fc31fee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DefaultDirectories", "EnumerateDefaultDirectories", "CreateDirectory", "CreateDirectoryObject"]

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
        result := ComCall(7, this, "ptr", pVariant, "HRESULT")
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
     * @param {Integer} DirectoryType The type of the directory. See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/ne-rend-directory_type">DIRECTORY_TYPE</a>.
     * @param {BSTR} pName Pointer to a <b>BSTR</b> containing the name of the directory to be created.
     * @returns {ITDirectory} Pointer to receive an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-itdirectory">ITDirectory</a> object of the type specified above.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itrendezvous-createdirectory
     */
    CreateDirectory(DirectoryType, pName) {
        pName := pName is String ? BSTR.Alloc(pName).Value : pName

        result := ComCall(9, this, "int", DirectoryType, "ptr", pName, "ptr*", &ppDir := 0, "HRESULT")
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
     * @param {Integer} DirectoryObjectType The type of the object. See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/ne-rend-directory_object_type">DIRECTORY_OBJECT_TYPE</a>.
     * @param {BSTR} pName Pointer to a <b>BSTR</b> containing the name of the object.
     * @returns {ITDirectoryObject} Pointer to receive the interface pointer for the newly created 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-itdirectoryobject">ITDirectoryObject</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itrendezvous-createdirectoryobject
     */
    CreateDirectoryObject(DirectoryObjectType, pName) {
        pName := pName is String ? BSTR.Alloc(pName).Value : pName

        result := ComCall(10, this, "int", DirectoryObjectType, "ptr", pName, "ptr*", &ppDirectoryObject := 0, "HRESULT")
        return ITDirectoryObject(ppDirectoryObject)
    }
}
