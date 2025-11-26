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
 * @see https://docs.microsoft.com/windows/win32/api//rend/nn-rend-itrendezvous
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
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itrendezvous-get_defaultdirectories
     */
    get_DefaultDirectories() {
        pVariant := VARIANT()
        result := ComCall(7, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * 
     * @returns {IEnumDirectory} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itrendezvous-enumeratedefaultdirectories
     */
    EnumerateDefaultDirectories() {
        result := ComCall(8, this, "ptr*", &ppEnumDirectory := 0, "HRESULT")
        return IEnumDirectory(ppEnumDirectory)
    }

    /**
     * Creates a new directory.
     * @param {Integer} DirectoryType 
     * @param {BSTR} pName 
     * @returns {ITDirectory} 
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-createdirectory
     */
    CreateDirectory(DirectoryType, pName) {
        pName := pName is String ? BSTR.Alloc(pName).Value : pName

        result := ComCall(9, this, "int", DirectoryType, "ptr", pName, "ptr*", &ppDir := 0, "HRESULT")
        return ITDirectory(ppDir)
    }

    /**
     * 
     * @param {Integer} DirectoryObjectType 
     * @param {BSTR} pName 
     * @returns {ITDirectoryObject} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itrendezvous-createdirectoryobject
     */
    CreateDirectoryObject(DirectoryObjectType, pName) {
        pName := pName is String ? BSTR.Alloc(pName).Value : pName

        result := ComCall(10, this, "int", DirectoryObjectType, "ptr", pName, "ptr*", &ppDirectoryObject := 0, "HRESULT")
        return ITDirectoryObject(ppDirectoryObject)
    }
}
